import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/configs/AppColors.dart';
import 'package:pokedex/data/pokemons.dart';
import 'package:pokedex/models/pokemon.dart';

class PokemonBall extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonBall(this.pokemon, {Key key}) : super(key: key);

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
            SvgPicture.asset(
              "assets/images/pokeball.svg",
              width: pokeballSize,
              height: pokeballSize,
              color: AppColors.lightGrey,
            ),
            Image.asset(
              pokemon.image,
              width: pokemonSize,
              height: pokemonSize,
            ),
          ],
        ),
        SizedBox(height: 3),
        Text(pokemon.name),
      ],
    );
  }
}

class PokemonEvolution extends StatelessWidget {
  Widget _buildRow({current: Pokemon, next: Pokemon, level: int}) {
    return Row(
      children: <Widget>[
        Expanded(child: PokemonBall(current)),
        Expanded(
            child: Column(
          children: <Widget>[
            Icon(Icons.arrow_forward, color: AppColors.lightGrey),
            SizedBox(height: 7),
            Text(
              "Lvl $level",
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

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 31, horizontal: 28),
      children: <Widget>[
        Text(
          "Evolution Chain",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, height: 0.8),
        ),
        SizedBox(height: 28),
        _buildRow(current: pokemons[0], next: pokemons[1], level: 16),
        _buildDivider(),
        _buildRow(current: pokemons[1], next: pokemons[2], level: 34),
      ],
    );
  }
}
