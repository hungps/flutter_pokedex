import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../configs/AppColors.dart';
import '../../../models/pokemon.dart';

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
          ),
        ),
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

  List<Widget> buildEvolutionList(List<Pokemon> pokemons) {
    if (pokemons.length < 2) {
      return [
        Center(child: Text("No evolution")),
      ];
    }

    return Iterable<int>.generate(pokemons.length - 1) // skip the last one
        .map(
          (index) => _buildRow(
            current: pokemons[index],
            next: pokemons[index + 1],
            reason: pokemons[index + 1].reason,
          ),
        )
        .expand((widget) => [widget, _buildDivider()])
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final cardController = Provider.of<AnimationController>(context);

    return AnimatedBuilder(
      animation: cardController,
      child: Consumer<PokemonModel>(
        builder: (_, model, child) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Evolution Chain",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, height: 0.8),
            ),
            SizedBox(height: 28),
            ...buildEvolutionList(model.pokemon.evolutions),
          ],
        ),
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
