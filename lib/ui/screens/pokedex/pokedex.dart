import 'package:flutter/material.dart';
import 'package:pokedex/configs/durations.dart';
import 'package:pokedex/core/extensions/animation.dart';
import 'package:pokedex/ui/modals/generation_modal.dart';
import 'package:pokedex/ui/modals/search_modal.dart';
import 'package:pokedex/ui/screens/pokedex/widgets/pokemon_grid.dart';
import 'package:pokedex/ui/widgets/fab.dart';
import 'package:pokedex/ui/widgets/pokeball_background.dart';

part 'package:pokedex/ui/screens/pokedex/widgets/fab_menu.dart';
part 'package:pokedex/ui/screens/pokedex/widgets/fab_overlay_background.dart';

class PokedexScreen extends StatefulWidget {
  const PokedexScreen();

  @override
  State<StatefulWidget> createState() => _PokedexScreenState();
}

class _PokedexScreenState extends State<PokedexScreen> with SingleTickerProviderStateMixin {
  late Animation<double> _fabAnimation;
  late AnimationController _fabController;
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

    super.initState();
  }

  @override
  void dispose() {
    _fabController.dispose();

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

  @override
  Widget build(BuildContext context) {
    return PokeballBackground(
      child: Stack(
        children: [
          PokemonGrid(),
          _FabOverlayBackground(
            animation: _fabAnimation,
            onPressOut: _toggleFabMenu,
          ),
        ],
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
