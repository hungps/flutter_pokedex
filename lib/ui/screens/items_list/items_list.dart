import 'package:flutter/material.dart';
import 'package:pokedex/configs/durations.dart';
import 'package:pokedex/ui/screens/items_list/widgets/items_grid.dart';
import 'package:pokedex/ui/widgets/pokeball_background.dart';

class ItemsListScreen extends StatefulWidget {
  const ItemsListScreen();

  @override
  _ItemsListScreenState createState() => _ItemsListScreenState();
}

class _ItemsListScreenState extends State<ItemsListScreen> with SingleTickerProviderStateMixin {
  Animation<double> _fabAnimation;
  AnimationController _fabController;
  bool _isFabMenuVisible = false;

  @override
  void initState() {
    _fabController = AnimationController(
      vsync: this,
      duration: animationDuration,
    );

    super.initState();
  }

  @override
  void dispose() {
    _fabController?.dispose();

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

  @override
  Widget build(BuildContext context) {
    return PokeballBackground(
      child: Stack(
        children: [
          ItemsGrid()
          /*_FabOverlayBackground(
            animation: _fabAnimation,
            onPressOut: _toggleFabMenu,
          ),*/
        ],
      ),
    );
  }
}
