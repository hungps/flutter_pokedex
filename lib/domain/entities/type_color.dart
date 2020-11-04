import 'package:flutter/material.dart';
import 'package:pokedex/configs/colors.dart';
import 'package:pokedex/domain/entities/pokemon_types.dart';

Color colorGenerator(PokemonTypes val) {
  switch (val) {
    case PokemonTypes.grass:
    case PokemonTypes.bug:
      return AppColors.lightTeal;

    case PokemonTypes.fire:
      return AppColors.lightRed;

    case PokemonTypes.water:
      return AppColors.lightBlue;

    case PokemonTypes.normal:
    case PokemonTypes.flying:
      return AppColors.semiGrey;

    case PokemonTypes.fighting:
      return AppColors.brown;

    case PokemonTypes.electric:
    case PokemonTypes.psychic:
      return AppColors.lightYellow;

    case PokemonTypes.poison:
    case PokemonTypes.ghost:
      return AppColors.lightPurple;

    case PokemonTypes.ground:
    case PokemonTypes.rock:
      return AppColors.lightBrown;

    case PokemonTypes.dark:
      return AppColors.black;

    case PokemonTypes.fairy:
      return AppColors.lightPink;

    default:
      return AppColors.lightBlue;
  }
}
