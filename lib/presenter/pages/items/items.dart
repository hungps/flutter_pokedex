import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/presenter/assets.gen.dart';
import 'package:pokedex/utils/extensions/animation.dart';
import 'package:pokedex/data/states/item/item_bloc.dart';
import 'package:pokedex/data/states/item/item_event.dart';
import 'package:pokedex/data/states/item/item_selector.dart';
import 'package:pokedex/data/states/item/item_state.dart';
import 'package:pokedex/presenter/modals/generation_modal.dart';
import 'package:pokedex/presenter/modals/search_modal.dart';
import 'package:pokedex/presenter/widgets/animated_overlay.dart';
import 'package:pokedex/presenter/widgets/app_bar.dart';
import 'package:pokedex/presenter/widgets/fab.dart';
import 'package:pokedex/presenter/widgets/scaffold.dart';
import 'package:pokedex/presenter/widgets/pokemon_refresh_control.dart';

import 'widgets/item_card.dart';

part 'sections/fab_menu.dart';
part 'sections/items_grid.dart';

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({super.key});

  @override
  ItemsScreenState createState() => ItemsScreenState();
}

class ItemsScreenState extends State<ItemsScreen> {
  @override
  Widget build(BuildContext context) {
    return PokeballScaffold(
      body: const Stack(
        children: [
          _ItemGrid(),
        ],
      ),
    );
  }
}
