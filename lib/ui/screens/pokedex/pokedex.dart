import 'dart:async';
import 'dart:math' show max;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/configs/durations.dart';
import 'package:pokedex/configs/images.dart';
import 'package:pokedex/core/extensions/animation.dart';
import 'package:pokedex/core/extensions/context.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/providers/providers.dart';
import 'package:pokedex/routes.dart';
import 'package:pokedex/ui/modals/generation_modal.dart';
import 'package:pokedex/ui/modals/search_modal.dart';
import 'package:pokedex/ui/screens/pokedex/widgets/pokemon_card.dart';
import 'package:pokedex/ui/widgets/fab.dart';
import 'package:pokedex/ui/widgets/poke_container.dart';

part 'package:pokedex/ui/screens/pokedex/widgets/fab_menu.dart';
part 'package:pokedex/ui/screens/pokedex/widgets/fab_overlay_background.dart';
part 'package:pokedex/ui/screens/pokedex/widgets/header_app_bar.dart';
part 'package:pokedex/ui/screens/pokedex/widgets/pokemon_grid.dart';

class PokedexScreen extends StatefulWidget {
  const PokedexScreen();

  @override
  State<StatefulWidget> createState() => _PokedexScreenState();
}

class _PokedexScreenState extends State<PokedexScreen> with SingleTickerProviderStateMixin {
  static const double _endReachedThreshold = 200;

  final ScrollController _scrollController = ScrollController();

  Animation<double> _fabAnimation;
  AnimationController _fabController;
  bool _isFabMenuVisible = false;

  @override
  void initState() {
    _fabController = AnimationController(
      vsync: this,
      duration: animationDuration,
    );

    _fabAnimation = _fabController.curvedTweenAnimation(
      begin: 0.0,
      end: 1.0,
    );

    _scrollController.addListener(_onScroll);

    scheduleMicrotask(() {
      context.read(pokemonsStateProvider).getPokemons(reset: true);
    });

    super.initState();
  }

  @override
  void dispose() {
    _fabController?.dispose();
    _scrollController?.dispose();

    super.dispose();
  }

  void _toggleFabMenu() {
    _isFabMenuVisible = !_isFabMenuVisible;

    if (_isFabMenuVisible) {
      _fabController.forward();
    } else {
      _fabController.reverse();
    }
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;

    final thresholdReached = _scrollController.position.extentAfter < _endReachedThreshold;
    final isLoading = context.read(pokemonsStateProvider).loading;
    final canLoadMore = context.read(pokemonsStateProvider).canLoadMore;

    if (thresholdReached && !isLoading && canLoadMore) {
      // Load more!
      context.read(pokemonsStateProvider).getPokemons();
    }
  }

  Future _onRefresh() async {
    context.read(pokemonsStateProvider).getPokemons(reset: true);
  }

  void _showSearchModal() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => SearchBottomModal(),
    );
  }

  void _showGenerationModal() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => GenerationModal(),
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: EdgeInsets.only(
        left: 26,
        right: 26,
        top: context.responsive(18),
        bottom: context.responsive(4),
      ),
      child: Text(
        'Pokedex',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildPokemonGrid() {
    return Expanded(
      child: Consumer(builder: (_, watch, __) {
        final pokemonState = watch(pokemonsStateProvider);

        return _PokemonGrid(
          pokemons: pokemonState.pokemons,
          canLoadMore: pokemonState.canLoadMore,
          controller: _scrollController,
          onRefresh: _onRefresh,
          onSelectPokemon: (index, pokemon) {
            context.read(currentPokemonStateProvider).setPokemon(index, pokemon);
            AppNavigator.push(Routes.pokemonInfo, pokemon);
          },
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PokeballBackground(
        buildChildren: (props) {
          final appBarTop = props.size / 2 + props.top - IconTheme.of(context).size / 2;

          return [
            Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _HeaderAppBar(top: appBarTop),
                _buildTitle(),
                _buildPokemonGrid(),
              ],
            ),
            _FabOverlayBackground(
              animation: _fabAnimation,
              onPressOut: _toggleFabMenu,
            ),
          ];
        },
      ),
      floatingActionButton: _FabMenu(
        animation: _fabAnimation,
        toggle: _toggleFabMenu,
        onAllGenPress: _showGenerationModal,
        onSearchPress: _showSearchModal,
      ),
    );
  }
}
