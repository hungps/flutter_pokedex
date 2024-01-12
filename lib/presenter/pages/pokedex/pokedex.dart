import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/configs/images.dart';
import 'package:pokedex/utils/extensions/animation.dart';
import 'package:pokedex/data/entities/pokemon.dart';
import 'package:pokedex/presenter/navigation/routes.dart';
import 'package:pokedex/data/states/pokemon/pokemon_bloc.dart';
import 'package:pokedex/data/states/pokemon/pokemon_event.dart';
import 'package:pokedex/data/states/pokemon/pokemon_selector.dart';
import 'package:pokedex/data/states/pokemon/pokemon_state.dart';
import 'package:pokedex/presenter/modals/generation_modal.dart';
import 'package:pokedex/presenter/modals/search_modal.dart';
import 'package:pokedex/presenter/widgets/app_bar.dart';
import 'package:pokedex/presenter/widgets/pokemon_card.dart';
import 'package:pokedex/presenter/widgets/animated_overlay.dart';
import 'package:pokedex/presenter/widgets/fab.dart';
import 'package:pokedex/presenter/widgets/scaffold.dart';
import 'package:pokedex/presenter/widgets/pokemon_refresh_control.dart';

part 'sections/fab_menu.dart';
part 'sections/pokemon_grid.dart';

class PokedexScreen extends StatefulWidget {
  const PokedexScreen({super.key});

  @override
  State<StatefulWidget> createState() => _PokedexScreenState();
}

class _PokedexScreenState extends State<PokedexScreen> {
  @override
  Widget build(BuildContext context) {
    return PokeballScaffold(
      body: const Stack(
        children: [
          _PokemonGrid(),
          _FabMenu(),
        ],
      ),
    );
  }
}
