import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pokedex/data/pokemons.dart';
import 'package:pokedex/widgets/poke_container.dart';
import 'package:pokedex/widgets/pokemon_card.dart';

class Pokedex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PokeContainer(
        appBar: true,
        children: <Widget>[
          SizedBox(height: 34),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26.0),
            child: Text(
              "Pokedex",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 32),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              padding: EdgeInsets.only(left: 28, right: 28, bottom: 58),
              itemCount: pokemons.length,
              itemBuilder: (context, index) => PokemonCard(pokemons[index], index: index),
            ),
          ),
        ],
      ),
    );
  }
}
