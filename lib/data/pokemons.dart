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

// Taken from Bulbapedia - Type color templates
Color getPokemonColor2(String label){
  switch(label.toLowerCase()){
    case "bug":
      return Color(0xFFA8B820);
    case "dark":
      return Color(0xFF705848);
    case "dragon":
      return Color(0xFF7038F8);
    case "electric":
      return Color(0xFFF8D030);
    case "fairy":
      return Color(0xFFEE99AC);
    case "fighting":
      return Color(0xFFC03028);
    case "fire":
      return Color(0xFFF08030);
    case "flying":
      return Color(0xFFA890F0);
    case "ghost":
      return Color(0xFF705898);
    case "grass":
      return Color(0xFF78C850);
    case "ground":
      return Color(0xFFE0C068);
    case "ice":
      return Color(0xFF98D8D8);
    case "normal":
      return Color(0xFFA8A878);
    case "poison":
      return Color(0xFFA040A0);
    case "psychic":
      return Color(0xFFF85888);
    case "rock":
      return Color(0xFFB8A038);
    case "steel":
      return Color(0xFFB8B8D0);
    case "water":
      return Color(0xFF6890F0);
    default:
      return Color(0xFF68A090);
  }
}
