import 'dart:convert' as json;

import 'package:flutter/material.dart';

import '../configs/AppColors.dart';
import '../models/pokemon.dart';

// Parses Pokemon.json File
Future<List<Pokemon>> getPokemonsList(BuildContext context) async {
  String jsonString = await DefaultAssetBundle.of(context).loadString("assets/pokemons.json");
  List<dynamic> jsonData = json.jsonDecode(jsonString);

  List<Pokemon> pokemons = jsonData.map((json) => Pokemon.fromJson(json)).toList();

  for (final pokemon in pokemons) {
    List<Pokemon> evolutions = pokemon.evolutions
        .map((item) => item.id)
        .map((id) => pokemons.firstWhere((item) => item.id == id))
        .toList();

    pokemon.evolutions.setAll(0, evolutions);
  }

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
