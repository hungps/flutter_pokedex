import 'dart:async';
import 'dart:math' show max;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/configs/durations.dart';
import 'package:pokedex/core/extensions/animation.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/providers/providers.dart';
import 'package:pokedex/routes.dart';
import 'package:pokedex/ui/screens/pokedex/modals/generation_modal.dart';
import 'package:pokedex/ui/screens/pokedex/modals/search_modal.dart';
import 'package:pokedex/ui/widgets/fab.dart';
import 'package:pokedex/ui/widgets/poke_container.dart';
import 'package:pokedex/ui/widgets/pokemon_card.dart';

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
      pokemonsStateProvider.read(context).getPokemons(reset: true);
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
    final isLoading = pokemonsStateProvider.read(context).loading;
    final canLoadMore = pokemonsStateProvider.read(context).canLoadMore;

    if (thresholdReached && !isLoading && canLoadMore) {
      // Load more!
      pokemonsStateProvider.read(context).getPokemons();
    }
  }

  Future _onRefresh() async {
    pokemonsStateProvider.read(context).getPokemons(reset: true);
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
        top: 18,
        left: 26,
        right: 26,
        bottom: 4,
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
      child: Consumer((context, read) {
        final pokemonState = read(pokemonsStateProvider);

        return _PokemonGrid(
          pokemons: pokemonState.pokemons,
          canLoadMore: pokemonState.canLoadMore,
          controller: _scrollController,
          onRefresh: _onRefresh,
          onSelectPokemon: (index, pokemon) {
            currentPokemonStateProvider.read(context).setPokemon(index, pokemon);
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
