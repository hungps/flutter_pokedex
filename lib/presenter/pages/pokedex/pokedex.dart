import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/presenter/navigation/navigation.dart';
import 'package:pokedex/presenter/widgets/loading.dart';
import 'package:pokedex/data/entities/pokemon.dart';
import 'package:pokedex/data/states/pokemon/pokemon_bloc.dart';
import 'package:pokedex/data/states/pokemon/pokemon_event.dart';
import 'package:pokedex/data/states/pokemon/pokemon_selector.dart';
import 'package:pokedex/data/states/pokemon/pokemon_state.dart';
import 'package:pokedex/presenter/modals/generation_modal.dart';
import 'package:pokedex/presenter/modals/search_modal.dart';
import 'package:pokedex/presenter/widgets/app_bar.dart';
import 'package:pokedex/presenter/widgets/pokemon_card.dart';
import 'package:pokedex/presenter/widgets/fab.dart';
import 'package:pokedex/presenter/widgets/scaffold.dart';
import 'package:pokedex/presenter/widgets/pokemon_refresh_control.dart';

part 'sections/pokemon_grid.dart';

@RoutePage()
class PokedexPage extends StatefulWidget {
  const PokedexPage({super.key});

  @override
  State<StatefulWidget> createState() => _PokedexPageState();
}

class _PokedexPageState extends State<PokedexPage> {
  void _showGenerationModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => const PokemonGenerationBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PokeballScaffold(
      body: Stack(
        children: [
          const _PokemonGrid(),
          ExpandableFab(
            icon: AnimatedIcons.menu_close,
            menuItems: [
              ExpandableFabMenuItem(
                title: 'Favourite Pokemon',
                icon: Icons.favorite,
                onPressed: () {},
              ),
              ExpandableFabMenuItem(
                title: 'All Type',
                icon: Icons.filter_vintage,
                onPressed: () {},
              ),
              ExpandableFabMenuItem(
                title: 'All Gen',
                icon: Icons.flash_on,
                onPressed: () =>
                    showPokemonGenerationBottomSheet(context: context),
              ),
              ExpandableFabMenuItem(
                title: 'Search',
                icon: Icons.search,
                onPressed: () => showSearchPokemonBottomSheet(context: context),
              ),
            ],
          )
        ],
      ),
    );
  }
}
