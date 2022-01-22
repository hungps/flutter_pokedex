import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/configs/images.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/providers/providers.dart';
import 'package:pokedex/ui/screens/pokedex/widgets/pokemon_card.dart';
import 'package:pokedex/ui/widgets/main_app_bar.dart';
import 'package:pokedex/ui/widgets/pokemon_refresh_control.dart';
import 'package:pokedex/routes.dart';

class PokemonGrid extends ConsumerStatefulWidget {
  @override
  _PokemonGridState createState() => _PokemonGridState();
}

class _PokemonGridState extends ConsumerState<PokemonGrid> {
  static const double _endReachedThreshold = 200;

  final GlobalKey<NestedScrollViewState> _scrollKey = GlobalKey();

  ScrollController? get innerController => _scrollKey.currentState?.innerController;

  @override
  void initState() {
    super.initState();

    scheduleMicrotask(() {
      ref.read(pokemonsStateProvider).getPokemons(reset: true);
      innerController?.addListener(_onScroll);
    });
  }

  @override
  void dispose() {
    innerController?.dispose();

    super.dispose();
  }

  void _onScroll() {
    if (innerController == null || !innerController!.hasClients) return;

    final thresholdReached = innerController!.position.extentAfter < _endReachedThreshold;
    final isLoading = ref.read(pokemonsStateProvider).loading;
    final canLoadMore = ref.read(pokemonsStateProvider).canLoadMore;

    if (thresholdReached && !isLoading && canLoadMore) {
      // Load more!
      ref.read(pokemonsStateProvider).getPokemons();
    }
  }

  Future _onRefresh() async {
    ref.read(pokemonsStateProvider).getPokemons(reset: true);
  }

  void _onPokemonPress(int index, Pokemon pokemon) {
    ref.read(currentPokemonStateProvider).setPokemon(index, pokemon);

    AppNavigator.push(Routes.pokemonInfo, pokemon);
  }

  List<Widget> _buildHeader(BuildContext context, bool innerBoxIsScrolled) {
    return [
      MainSliverAppBar(),
    ];
  }

  Widget _buildGrid({List<Pokemon> pokemons = const []}) {
    return SliverPadding(
      padding: EdgeInsets.all(28),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) => PokemonCard(
            pokemons[index],
            index: index,
            onPress: () => _onPokemonPress(index, pokemons[index]),
          ),
          childCount: pokemons.length,
        ),
      ),
    );
  }

  Widget _buildLoadMoreIndicator() {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.only(bottom: 28),
        alignment: Alignment.center,
        child: Image(image: AppImages.pikloader),
      ),
    );
  }

  Widget _buildError() {
    return SliverFillRemaining(
      child: Container(
        padding: EdgeInsets.only(bottom: 28),
        alignment: Alignment.center,
        child: Icon(
          Icons.warning_amber_rounded,
          size: 60,
          color: Colors.black26,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      key: _scrollKey,
      headerSliverBuilder: _buildHeader,
      body: Consumer(builder: (_, ref, __) {
        final pokemonState = ref.watch(pokemonsStateProvider);

        return CustomScrollView(
          slivers: [
            PokemonRefreshControl(onRefresh: _onRefresh),
            if (pokemonState.isError)
              _buildError()
            else ...[
              _buildGrid(pokemons: pokemonState.pokemons),
              if (pokemonState.canLoadMore) _buildLoadMoreIndicator(),
            ]
          ],
        );
      }),
    );
  }
}
