import 'dart:convert' as json;

import 'package:flutter/cupertino.dart';

import '../configs/AppColors.dart';
import '../models/pokemon.dart';

// TODO: Remove this hard coded pokemon when we have the pokemon evolutions info
const List<Pokemon> pokemons = [
  Pokemon(
    name: "Bulbasaur",
    types: const ["grass", "poison"],
    image: "assets/images/bulbasaur.png",
  ),
  Pokemon(
    name: "Ivysaur",
    types: const ["grass", "poison"],
    image: "assets/images/ivysaur.png",
  ),
  Pokemon(
    name: "Venusaur",
    types: const ["grass", "poison"],
    image: "assets/images/venusaur.png",
  ),
  Pokemon(
    name: "Charmander",
    types: const ["fire"],
    image: "assets/images/charmander.png",
  ),
  Pokemon(
    name: "Charmeleon",
    types: const ["fire"],
    image: "assets/images/charmeleon.png",
  ),
  Pokemon(
    name: "Charizard",
    types: const ["fire"],
    image: "assets/images/charizard.png",
  ),
  Pokemon(
    name: "Squirtle",
    types: const ["water"],
    image: "assets/images/squirtle.png",
  ),
  Pokemon(
    name: "Wartortle",
    types: const ["water"],
    image: "assets/images/wartortle.png",
  ),
  Pokemon(
    name: "Blastoise",
    types: const ["water"],
    image: "assets/images/blastoise.png",
  ),
  Pokemon(
    name: "Pikachu",
    types: const ["electric"],
    image: "assets/images/pikachu.png",
  ),
];

// Parses Pokemon.json File
Future<List<Pokemon>> getPokemonsList(context) async {
  String jsonString = await DefaultAssetBundle.of(context).loadString("assets/pokemons.json");
  List<dynamic> jsonData = json.jsonDecode(jsonString);

  List<Pokemon> pokemons = jsonData.map((json) => Pokemon.fromJson(json)).toList();

  return pokemons;
}

// A function to get Color for container of pokemon
Color getPokemonColor(String typeOfPokemon) {
  switch (typeOfPokemon.toLowerCase()) {
    case 'grass':
    case 'bug':
      return AppColors.lightTeal;

    case 'fire':
      return AppColors.lightRed;

    case 'water':
    case 'fighting':
    case 'normal':
      return AppColors.lightBlue;

    case 'electric':
    case 'psychic':
      return AppColors.lightYellow;

    case 'poison':
    case 'ghost':
      return AppColors.lightPurple;

    case 'ground':
    case 'rock':
      return AppColors.lightBrown;
    case 'dark':
      return AppColors.black;
    default:
      return AppColors.lightBlue;
  }
}
