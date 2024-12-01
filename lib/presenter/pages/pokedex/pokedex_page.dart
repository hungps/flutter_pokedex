import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/di.dart';
import 'package:pokedex/presenter/navigation/navigation.dart';
import 'package:pokedex/presenter/pages/pokedex/pokedex_bloc.dart';
import 'package:pokedex/presenter/pages/pokedex/pokedex_event.dart';
import 'package:pokedex/presenter/pages/pokedex/pokedex_selector.dart';
import 'package:pokedex/presenter/pages/pokedex/pokedex_state.dart';
import 'package:pokedex/presenter/widgets/error_indicator.dart';
import 'package:pokedex/presenter/widgets/loading.dart';
import 'package:pokedex/data/entities/pokemon.dart';
import 'package:pokedex/data/states/pokemon/pokemon_bloc.dart';
import 'package:pokedex/data/states/pokemon/pokemon_event.dart';
import 'package:pokedex/presenter/modals/generation_modal.dart';
import 'package:pokedex/presenter/modals/search_modal.dart';
import 'package:pokedex/presenter/widgets/app_bar.dart';
import 'package:pokedex/presenter/widgets/pokemon_card.dart';
import 'package:pokedex/presenter/widgets/fab.dart';
import 'package:pokedex/presenter/widgets/pokemon_refresh_control.dart';
import 'package:pokedex/presenter/widgets/scaffold.dart';
import 'package:pokedex/utils/mixins/load_more_mixin.dart';

@RoutePage()
class PokedexPage extends StatefulWidget implements AutoRouteWrapper {
  const PokedexPage({super.key});

  @override
  State<StatefulWidget> createState() => _PokedexPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt.get<PokedexBloc>(),
      child: this,
    );
  }
}

class _PokedexPageState extends State<PokedexPage> with LoadMoreMixin {
  final GlobalKey<NestedScrollViewState> _nestedScrollViewKey = GlobalKey();

  @override
  ScrollController? get scrollController =>
      _nestedScrollViewKey.currentState?.innerController;

  PokedexBloc get _bloc => context.read<PokedexBloc>();

  @override
  void initState() {
    super.initState();

    scheduleMicrotask(() {
      _bloc.add(const PokedexFetchPokemonsStarted());
      // TODO: Remove
      context.read<PokemonBloc>().add(const PokemonLoadStarted());
    });
  }

  @override
  void onLoadMoreThresholdReached() {
    _bloc.add(const PokedexFetchMorePokemonsStarted());
  }

  Future _onRefresh() async {
    _bloc.add(const PokedexFetchPokemonsStarted());

    return _bloc.stream.firstWhere((e) => e.status != PokedexStatus.loading);
  }

  void _onPokemonPress(Pokemon pokemon) {
    // TODO: Remove
    context
        .read<PokemonBloc>()
        .add(PokemonSelectChanged(pokemonId: pokemon.number));

    context.router.push(PokemonInfoRoute(id: pokemon.number));
  }

  @override
  Widget build(BuildContext context) {
    return PokeballScaffold(
      body: Stack(
        children: [
          NestedScrollView(
            key: _nestedScrollViewKey,
            headerSliverBuilder: (_, __) => [
              AppMovingTitleSliverAppBar(title: 'Pokedex'),
            ],
            body: PokedexStatusSelector(builder: (status) {
              switch (status) {
                case PokedexStatus.loading:
                  return _buildLoading();

                case PokedexStatus.failure:
                  return _buildError();

                case PokedexStatus.loadingMore:
                case PokedexStatus.loaded:
                  return _buildSuccess();
              }
            }),
          ),
          ExpandableFab(
            icon: AnimatedIcons.menu_close,
            menuItems: [
              const ExpandableFabMenuItem(
                title: 'Favourite Pokemon',
                icon: Icons.favorite,
                onPressed: null,
              ),
              const ExpandableFabMenuItem(
                title: 'All Type',
                icon: Icons.filter_vintage,
                onPressed: null,
              ),
              ExpandableFabMenuItem(
                title: 'All Gen',
                icon: Icons.flash_on,
                onPressed: () => showPokemonGenerationSheet(context: context),
              ),
              ExpandableFabMenuItem(
                title: 'Search',
                icon: Icons.search,
                onPressed: () => showSearchPokemonSheet(context: context),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLoading() {
    return const PikaLoadingIndicator();
  }

  Widget _buildSuccess() {
    return CustomScrollView(
      slivers: [
        SliverPokemonRefreshControl(
          onRefresh: _onRefresh,
        ),
        SliverPadding(
          padding: const EdgeInsets.all(28),
          sliver: PokedexPokemonsSelector(builder: (pokemons) {
            return SliverGrid.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: pokemons.length,
              itemBuilder: (_, index) {
                final pokemon = pokemons[index];
                return PokemonCard(
                  name: pokemon.name,
                  number: pokemon.number,
                  types: pokemon.types,
                  color: pokemon.color,
                  imageUrl: pokemon.image,
                  onPressed: () => _onPokemonPress(pokemon),
                );
              },
            );
          }),
        ),
        PokedexCanLoadMoreSelector(builder: (canLoadMore) {
          return SliverPadding(
            padding: const EdgeInsets.only(bottom: 24),
            sliver: canLoadMore ? const SliverPikaLoadingIndicator() : null,
          );
        })
      ],
    );
  }

  Widget _buildError() {
    return CustomScrollView(
      slivers: [
        SliverPokemonRefreshControl(
          onRefresh: _onRefresh,
        ),
        const SliverFillRemaining(
          child: AppErrorIndicator(),
        ),
      ],
    );
  }
}
