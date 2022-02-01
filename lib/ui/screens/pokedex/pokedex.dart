import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/configs/durations.dart';
import 'package:pokedex/configs/images.dart';
import 'package:pokedex/core/extensions/animation.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/routes.dart';
import 'package:pokedex/states/pokemon/pokemon_bloc.dart';
import 'package:pokedex/states/pokemon/pokemon_event.dart';
import 'package:pokedex/states/pokemon/pokemon_selector.dart';
import 'package:pokedex/states/pokemon/pokemon_state.dart';
import 'package:pokedex/ui/modals/generation_modal.dart';
import 'package:pokedex/ui/modals/search_modal.dart';
import 'package:pokedex/ui/widgets/pokemon_card.dart';
import 'package:pokedex/ui/widgets/animated_overlay.dart';
import 'package:pokedex/ui/widgets/fab.dart';
import 'package:pokedex/ui/widgets/main_app_bar.dart';
import 'package:pokedex/ui/widgets/pokeball_background.dart';
import 'package:pokedex/ui/widgets/pokemon_refresh_control.dart';

part 'sections/fab_menu.dart';
part 'sections/pokemon_grid.dart';

class PokedexScreen extends StatefulWidget {
  const PokedexScreen();

  @override
  State<StatefulWidget> createState() => _PokedexScreenState();
}

class _PokedexScreenState extends State<PokedexScreen> {
  @override
  Widget build(BuildContext context) {
    return PokeballBackground(
      child: Stack(
        children: [
          _PokemonGrid(),
          _FabMenu(),
        ],
      ),
    );
  }
}
