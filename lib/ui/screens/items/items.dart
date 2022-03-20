import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/configs/durations.dart';
import 'package:pokedex/configs/images.dart';
import 'package:pokedex/core/extensions/animation.dart';
import 'package:pokedex/states/item/item_bloc.dart';
import 'package:pokedex/states/item/item_event.dart';
import 'package:pokedex/states/item/item_selector.dart';
import 'package:pokedex/states/item/item_state.dart';
import 'package:pokedex/ui/modals/generation_modal.dart';
import 'package:pokedex/ui/modals/search_modal.dart';
import 'package:pokedex/ui/widgets/animated_overlay.dart';
import 'package:pokedex/ui/widgets/fab.dart';
import 'package:pokedex/ui/widgets/main_app_bar.dart';
import 'package:pokedex/ui/widgets/pokeball_background.dart';
import 'package:pokedex/ui/widgets/pokemon_refresh_control.dart';

import 'widgets/item_card.dart';

part 'sections/fab_menu.dart';
part 'sections/items_grid.dart';

class ItemsScreen extends StatefulWidget {
  const ItemsScreen();

  @override
  _ItemsScreenState createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  @override
  Widget build(BuildContext context) {
    return PokeballBackground(
      child: Stack(
        children: [
          _ItemGrid(),
        ],
      ),
    );
  }
}
