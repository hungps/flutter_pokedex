import 'package:pokedex/configs/AppColors.dart';
import 'package:pokedex/models/pokemon.dart';

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
