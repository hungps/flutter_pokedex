import 'dart:convert' as json;

import 'package:flutter/material.dart';
import 'package:pokedex/data/types.dart';
import 'package:pokedex/models/type.dart';

import '../configs/AppColors.dart';
import '../models/pokemon.dart';

// Parses Pokemon.json File
Future<List<Pokemon>> getPokemonsList(BuildContext context) async {
  String jsonString =
      await DefaultAssetBundle.of(context).loadString("assets/pokemons.json");
  List<dynamic> jsonData = json.jsonDecode(jsonString);

  List<Pokemon> pokemons =
      jsonData.map((json) => Pokemon.fromJson(json)).toList();

  for (final pokemon in pokemons) {
    List<Pokemon> evolutions = pokemon.evolutions
        .map((item) => item.id)
        .map((id) => pokemons.firstWhere((item) => item.id == id))
        .toList();

    pokemon.evolutions.setAll(0, evolutions);
  }

  return pokemons;
}

Map<String, double> getTypeEffectiveness(Pokemon pokemon) {
  Map<String, double> effectivenessMap = new Map();
  for (EffectiveType effectiveType in effectiveTypes) {
    double typeEffectiveness = 1;
    for (String pokemonTypeName in pokemon.types) {
      final pokemonEffectiveType = getEffectiveTypeFromType(pokemonTypeName);
      if (pokemonEffectiveType.immune.contains(effectiveType.name)) {
        typeEffectiveness = 0;
      }
      if (pokemonEffectiveType.superEffective.contains(effectiveType.name)) {
        typeEffectiveness *= 2;
      }
      if (pokemonEffectiveType.notEffective.contains(effectiveType.name)) {
        typeEffectiveness *= 0.5;
      }
    }
    effectivenessMap[effectiveType.name] = typeEffectiveness;
  }
  return effectivenessMap;
}

// A function to get Color for container of pokemon
Color getPokemonColor(String typeOfPokemon) {
  switch (typeOfPokemon.toLowerCase()) {
    case 'grass':
      return AppColors.lightGreen; // was lightTeal

    case 'bug':
      return AppColors.lightTeal;

    case 'fire':
      return AppColors.lightRed;

    case 'water':
      return AppColors.lightBlue;

    case 'fighting':
      return AppColors.red;

    case 'normal':
      return AppColors.beige;

    case 'electric':
      return AppColors.lightYellow;

    case 'psychic':
      return AppColors.lightPink;

    case 'poison':
      return AppColors.lightPurple;

    case 'ghost':
      return AppColors.purple; // was lightPurple

    case 'ground':
      return AppColors.darkBrown; // was lightBrown

    case 'rock':
      return AppColors.lightBrown;

    case 'dark':
      return AppColors.black;

    case 'dragon':
      return AppColors.violet;

    case 'fairy':
      return AppColors.pink;

    case 'flying':
      return AppColors.lilac;

    case 'ice':
      return AppColors.lightCyan;

    case 'steel':
      return AppColors.grey;

    default:
      return AppColors.lightBlue;
  }
}
