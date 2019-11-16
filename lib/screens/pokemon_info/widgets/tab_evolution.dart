import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../configs/AppColors.dart';
import '../../../models/pokemon.dart';
import '../pokemon_info_arguments.dart';

class PokemonBall extends StatelessWidget {
  const PokemonBall(this.pokemon, {Key key}) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final pokeballSize = screenHeight * 0.1;
    final pokemonSize = pokeballSize * 0.85;

    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Image.asset(
              "assets/images/pokeball.png",
              width: pokeballSize,
              height: pokeballSize,
              color: AppColors.lightGrey,
            ),
            CachedNetworkImage(
              imageUrl: pokemon.image,
              imageBuilder: (_, image) => Image(
                image: image,
                width: pokemonSize,
                height: pokemonSize,
              ),
            )
          ],
        ),
        SizedBox(height: 3),
        Text(pokemon.name),
      ],
    );
  }
}

class PokemonEvolution extends StatelessWidget {
  List<Pokemon> pokemons;

  Widget _buildRow({current: Pokemon, next: Pokemon, reason: String}) {
    return Row(
      children: <Widget>[
        Expanded(child: PokemonBall(current)),
        Expanded(
            child: Column(
          children: <Widget>[
            Icon(Icons.arrow_forward, color: AppColors.lightGrey),
            SizedBox(height: 7),
            Text(
              reason,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ],
        )),
        Expanded(child: PokemonBall(next)),
      ],
    );
  }

  Widget _buildDivider() {
    return Column(
      children: <Widget>[
        SizedBox(height: 21),
        Divider(),
        SizedBox(height: 21),
      ],
    );
  }

  List<Widget> buildEvolutionList(String pokemonId) {
    List<String> ids = [];
    List<Widget> widgets = [];
    while (true) {
      if (pokemons[getIndex(pokemonId)].evolvedFrom == "") break;

      pokemonId = pokemons[getIndex(pokemonId)].evolvedFrom;
      if (pokemonId == "") break;
    }
    ids.add(pokemonId);
    while (ids.length != 0) {
      String currentId = ids.last;
      //get Parent of pokemon with id
      for (Pokemon currentPokemon in pokemons) {
        if (currentPokemon.evolvedFrom == currentId) {
          Pokemon basePokemon = pokemons[getIndex(currentId)];
          Pokemon nextPokemon = currentPokemon;
          widgets
              .add(_buildRow(current: basePokemon, next: nextPokemon, reason: nextPokemon.reason));
          widgets.add(_buildDivider());
          ids.add(currentPokemon.id);
        }
      }
      ids.remove(currentId);
    }
    if (widgets.length != 0) // edge case . if there is no evolution
      widgets.removeLast(); // removing the last divider
    return widgets;
  }

  // returns index of pokemon in pokemons array
  // eg #001 will return 0
  int getIndex(String id) {
    return int.parse(id.substring(1)) - 1;
  }

  @override
  Widget build(BuildContext context) {
    final cardController = Provider.of<AnimationController>(context);
    final index = Provider.of<PokemonInfoArguments>(context, listen: false).index;
    pokemons = Provider.of<PokemonInfoArguments>(context, listen: false).pokemons;

    final pokemon = pokemons[index];
    final evolutions = buildEvolutionList(pokemon.id);
    return AnimatedBuilder(
      animation: cardController,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Evolution Chain",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, height: 0.8),
          ),
          SizedBox(height: 28),
          if (evolutions.length != 0) ...evolutions else PokemonBall(pokemon),
        ],
      ),
      builder: (context, widget) {
        final scrollable = cardController.value.floor() == 1;

        return SingleChildScrollView(
          physics: scrollable ? BouncingScrollPhysics() : NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(vertical: 31, horizontal: 28),
          child: widget,
        );
      },
    );
  }
}
