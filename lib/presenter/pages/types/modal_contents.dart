import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/data/types.dart';
import 'package:pokedex/data/entities/pokemon.dart';
import 'package:pokedex/presenter/assets.gen.dart';
import 'package:pokedex/presenter/navigation/navigation.dart';
import 'package:pokedex/data/states/pokemon/pokemon_bloc.dart';
import 'package:pokedex/data/states/pokemon/pokemon_event.dart';
import 'package:pokedex/data/states/pokemon/pokemon_state.dart';
import 'package:pokedex/presenter/pages/types/type_container.dart';
import 'package:pokedex/presenter/pages/types/type_entities/widget_list.dart';
import 'package:pokedex/presenter/widgets/pokemon_card.dart';
import 'package:pokedex/utils/extensions/string.dart';

// Class responsible for creating the list present in the modal page consisting of various effects related to the selected type
class ModalContents extends StatefulWidget {
  const ModalContents({
    super.key,
    required this.index,
    required this.width,
    required this.scroller,
  });

  final int index;
  final double width;
  final ScrollController scroller;

  @override
  ModalContentsState createState() => ModalContentsState();
}

class ModalContentsState extends State<ModalContents> {
  final List<bool> _isOpen = [false, false, false];

  @override
  void initState() {
    super.initState();

    scheduleMicrotask(() {
      context.read<PokemonBloc>().add(const PokemonLoadStarted(loadAll: true));
    });
  }

  void _onPokemonPress(int index, Pokemon pokemon) {
    context.read<PokemonBloc>().add(PokemonSelectChanged(pokemonId: pokemon.number));

    context.router.push(PokemonInfoRoute(id: pokemon.number));
  }

  PokeTypes get pokeType => types[widget.index];

  ExpansionPanel _buildTypePokemonPanel(List<Pokemon> pokemons) {
    final filteredPokemons =
        pokemons.where((pokemon) => pokemon.types.contains(pokeType.type)).toList();

    return ExpansionPanel(
      headerBuilder: (context, isOpen) {
        return Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Image(
                image: Assets.images.pokeball.provider(),
                width: 30,
                height: 30,
                color: pokeType.color.withOpacity(0.5),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text("${pokeType.type.displayName.capitalize()} Type "
                  "Pokemons"),
            )
          ],
        );
      },
      canTapOnHeader: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: filteredPokemons.isNotEmpty
            ? GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                childAspectRatio: 1.4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                physics: const NeverScrollableScrollPhysics(),
                children: filteredPokemons.map((pokemon) {
                  return PokemonCard(
                    pokemon,
                    onPress: () => _onPokemonPress(pokemons.indexOf(pokemon), pokemon),
                  );
                }).toList(),
              )
            : const Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child:
                    Text("No Pokemon found", style: TextStyle(fontSize: 16, color: Colors.black54)),
              ),
      ),
      isExpanded: _isOpen[0],
    );
  }

  ExpansionPanel _buildTypeItemsPanel() {
    return ExpansionPanel(
      headerBuilder: (context, isOpen) {
        return Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Image(
                image: Assets.images.pokeball.provider(),
                width: 30,
                height: 30,
                color: pokeType.color.withOpacity(0.5),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text("${pokeType.type.displayName.capitalize()} Type "
                  "Items"),
            )
          ],
        );
      },
      canTapOnHeader: true,
      body: const Text("Under development"),
      isExpanded: _isOpen[1],
    );
  }

  Widget _buildTypePanelList(List<Pokemon> pokemons) => ExpansionPanelList(
        animationDuration: const Duration(milliseconds: 500),
        children: [
          _buildTypePokemonPanel(pokemons),
          _buildTypeItemsPanel(),
        ],
        expansionCallback: (i, isOpen) => setState(() => _isOpen[i] = !isOpen),
      );

  Widget _buildError() => Container(
        padding: const EdgeInsets.only(bottom: 28),
        alignment: Alignment.center,
        child: const Icon(
          Icons.warning_amber_rounded,
          size: 60,
          color: Colors.black26,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      controller: widget.scroller,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
              alignment: Alignment.center,
              child: TypeDisplayContainer(
                index: widget.index,
                path: "name",
                value: null,
                width: 200.0,
                j: null,
                height: 70,
                typeList: const [],
              )), //type_card
        ),
        Center(
          child: Container(
            margin: const EdgeInsets.only(top: 20),
            height: 1,
            width: widget.width / 1.7,
            color: Colors.black12,
          ),
        ),
        if (pokeType.superEffective.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: lister(widget.index, 2, widget.width, "Effective Against".toUpperCase()),
          ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: lister(widget.index, 0.5, widget.width, "Weak Against".toUpperCase()),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: lister(widget.index, 1, widget.width, "Normal Against".toUpperCase()),
        ),
        if (pokeType.nilEffective.isNotEmpty)
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: lister(widget.index, 0, widget.width, "No Effect Against".toUpperCase()),
          ),
        BlocBuilder<PokemonBloc, PokemonState>(builder: (_, state) {
          if (state.error != null) {
            return _buildError();
          }

          return _buildTypePanelList(state.pokemons);
        }),
      ],
    );
  }
}
