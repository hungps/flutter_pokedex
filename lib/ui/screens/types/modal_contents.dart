import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/configs/images.dart';
import 'package:pokedex/configs/types.dart';
import 'package:pokedex/core/utils.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/routes.dart';
import 'package:pokedex/states/pokemon/pokemon_bloc.dart';
import 'package:pokedex/states/pokemon/pokemon_event.dart';
import 'package:pokedex/states/pokemon/pokemon_state.dart';
import 'package:pokedex/ui/screens/pokedex/widgets/pokemon_card.dart';
import 'package:pokedex/ui/screens/types/type_container.dart';
import 'package:pokedex/ui/screens/types/type_entities/widget_list.dart';

// Class responsible for creating the list present in the modal page consisting of various effects related to the selected type
class ModalContents extends StatefulWidget {
  const ModalContents({
    Key? key,
    required this.index,
    required this.width,
    required this.scroller,
  }) : super(key: key);

  final int index;
  final double width;
  final ScrollController scroller;

  @override
  _ModalContentsState createState() => _ModalContentsState();
}

class _ModalContentsState extends State<ModalContents> {
  final List<bool> _isOpen = [false, false, false];

  @override
  void initState() {
    super.initState();

    scheduleMicrotask(() {
      context.read<PokemonBloc>().add(PokemonLoadStarted(loadAll: true));
    });
  }

  void _onPokemonPress(int index, Pokemon pokemon) {
    context.read<PokemonBloc>().add(PokemonSelectChanged(pokemonId: pokemon.number));

    AppNavigator.push(Routes.pokemonInfo, pokemon);
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
                image: AppImages.pokeball,
                width: 30,
                height: 30,
                color: pokeType.color.withOpacity(0.5),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                  "${getEnumValue(pokeType.type)[0].toUpperCase() + getEnumValue(pokeType.type).substring(1)} Type "
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
                    index: pokemons.indexOf(pokemon),
                    onPress: () => _onPokemonPress(pokemons.indexOf(pokemon), pokemon),
                  );
                }).toList(),
              )
            : Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
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
                image: AppImages.pokeball,
                width: 30,
                height: 30,
                color: pokeType.color.withOpacity(0.5),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                  "${getEnumValue(pokeType.type)[0].toUpperCase() + getEnumValue(pokeType.type).substring(1)} Type "
                  "Items"),
            )
          ],
        );
      },
      canTapOnHeader: true,
      body: Text("Under development"),
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
        padding: EdgeInsets.only(bottom: 28),
        alignment: Alignment.center,
        child: Icon(
          Icons.warning_amber_rounded,
          size: 60,
          color: Colors.black26,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      controller: widget.scroller,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Container(
              alignment: Alignment.center,
              child: TypeDisplayContainer(
                index: widget.index,
                path: "name",
                value: null,
                width: 200.0,
                j: null,
                height: 70,
                typeList: [],
              )), //type_card
        ),
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 20),
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
