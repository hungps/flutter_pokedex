import 'package:flutter/cupertino.dart';
import 'package:pokedex/configs/AppColors.dart';
import 'package:pokedex/models/pokemon.dart';
import 'dart:convert' as json;

import '../configs/AppColors.dart';
import '../configs/AppColors.dart';
import '../models/pokemon.dart';
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
Future<List<Pokemon>> getPokemonsList(context) async
{
  List<Pokemon> pokemons =[];

  String jsonString = await DefaultAssetBundle.of(context).loadString("assets/pokemons.json");
  dynamic jsonData  = json.jsonDecode(jsonString);
  for(var currentPokemon in jsonData)
    {
      String name = currentPokemon['name'];
      String imageUrl = currentPokemon['imageurl'];
      List<dynamic> dynamictypesOfPokemon = currentPokemon['typeofpokemon'];
      List<String> typesOfPokemon =[];
      for(var dynamicType in dynamictypesOfPokemon)
        typesOfPokemon.add(dynamicType.toString());
      Color color = getPokemonColor(typesOfPokemon[0]);
      Pokemon pokemon = Pokemon(
        name: name,
        image: imageUrl,
        types: typesOfPokemon,
        color: color
      );
      pokemons.add(pokemon);
    }
  return pokemons;
}
getPokemonColor(typeOfPokemon)
{
  //TODO add more colors

   switch(typeOfPokemon)
   {
     case 'Grass' : return AppColors.lightTeal;
     case 'Fire' : return AppColors.lightRed;
     case 'Water' : return AppColors.lightBlue;
     case 'Electric' : return AppColors.lightYellow;
     default : return AppColors.brown;
   }
}
