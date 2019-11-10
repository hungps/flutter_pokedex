import 'dart:convert' as json;

import 'package:flutter/cupertino.dart';

import '../configs/AppColors.dart';
import '../models/pokemon.dart';

const List<Pokemon> pokemons = [
  Pokemon(
    name: "Bulbasaur",
    types: const ["grass", "poison"],
    image: "assets/images/bulbasaur.png",
    color: AppColors.lightTeal,
  ),
  Pokemon(
    name: "Ivysaur",
    types: const ["grass", "poison"],
    image: "assets/images/ivysaur.png",
    color: AppColors.lightTeal,
  ),
  Pokemon(
    name: "Venusaur",
    types: const ["grass", "poison"],
    image: "assets/images/venusaur.png",
    color: AppColors.lightTeal,
  ),
  Pokemon(
    name: "Charmander",
    types: const ["fire"],
    image: "assets/images/charmander.png",
    color: AppColors.lightRed,
  ),
  Pokemon(
    name: "Charmeleon",
    types: const ["fire"],
    image: "assets/images/charmeleon.png",
    color: AppColors.lightRed,
  ),
  Pokemon(
    name: "Charizard",
    types: const ["fire"],
    image: "assets/images/charizard.png",
    color: AppColors.lightRed,
  ),
  Pokemon(
    name: "Squirtle",
    types: const ["water"],
    image: "assets/images/squirtle.png",
    color: AppColors.lightBlue,
  ),
  Pokemon(
    name: "Wartortle",
    types: const ["water"],
    image: "assets/images/wartortle.png",
    color: AppColors.lightBlue,
  ),
  Pokemon(
    name: "Blastoise",
    types: const ["water"],
    image: "assets/images/blastoise.png",
    color: AppColors.lightBlue,
  ),
  Pokemon(
    name: "Pikachu",
    types: const ["electric"],
    image: "assets/images/pikachu.png",
    color: AppColors.lightYellow,
  ),
];

// Parses Pokemon.json File
Future<List<Pokemon>> getPokemonsList(context) async {
  List<Pokemon> pokemons = [];

  String jsonString = await DefaultAssetBundle.of(context).loadString("assets/pokemons.json");
  dynamic jsonData = json.jsonDecode(jsonString);

  for (var currentPokemon in jsonData) {
    String name = currentPokemon['name'];
    String imageUrl = currentPokemon['imageurl'];
    List<dynamic> dynamicTypesOfPokemon = currentPokemon['typeofpokemon'];
    List<String> typesOfPokemon = [];

    //Converting dynamic list to string list
    for (var dynamicType in dynamicTypesOfPokemon) {
      typesOfPokemon.add(dynamicType.toString());
    }
    String about = currentPokemon['xdescription'];
    String height = currentPokemon['height'];
    String weight = currentPokemon['weight'];
    List<dynamic> dynamicEvolutionsOfPokemon = currentPokemon['evolutions'];
    List<String> evolutions= [];
    for(var dynamicEvolution in dynamicEvolutionsOfPokemon)
      evolutions.add(dynamicEvolution.toString());
    Color color = getPokemonColor(typesOfPokemon[0]);
    String id = currentPokemon['id'];
    String category = currentPokemon['category'];
    Pokemon pokemon = Pokemon(name: name, image: imageUrl, types: typesOfPokemon, color: color,evolutions: evolutions,about : about,height: height,weight: weight,category: category,id :id);
    pokemons.add(pokemon);
  }
  return pokemons;
}

// A function to get Color for container of pokemon
Color getPokemonColor(typeOfPokemon) {
  switch (typeOfPokemon) {
    case 'Grass':
    case 'Bug':
      return AppColors.lightTeal;

    case 'Fire':
      return AppColors.lightRed;

    case 'Water':
    case 'Fighting':
    case 'Normal':
      return AppColors.lightBlue;

    case 'Electric':
    case 'Psychic':
      return AppColors.lightYellow;

    case 'Poison':
    case 'Ghost':
      return AppColors.lightPurple;

    case 'Ground':
    case 'Rock':
      return AppColors.lightBrown;

    default:
      return AppColors.lightBlue;
  }
}
