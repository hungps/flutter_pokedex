import 'dart:ui';

import 'package:flutter/material.dart';

import '../../configs/colors.dart';
import 'pokemon_props.dart';
import 'pokemon_types.dart';

class Pokemon {
  const Pokemon({
    @required this.number,
    @required this.name,
    this.description,
    this.types,
    @required this.image,
    this.height,
    this.weight,
    this.genera,
    this.eggGroups,
    this.gender,
    this.stats,
    this.baseExp,
    this.evolutions,
    this.evolutionReason,
  });

  final String number;
  final String name;
  final String description;
  final List<PokemonTypes> types;
  final String image;
  final String height;
  final String weight;
  final String genera;
  final List<PokemonTypes> eggGroups;
  final PokemonGender gender;
  final PokemonStats stats;
  final double baseExp;
  final List<Pokemon> evolutions;
  final String evolutionReason;
}

extension PokemonX on Pokemon {
  Color get color {
    if (types.isEmpty) {
      return AppColors.lightBlue;
    }

    switch (types[0]) {
      case PokemonTypes.grass:
      case PokemonTypes.bug:
        return AppColors.lightTeal;

      case PokemonTypes.fire:
        return AppColors.lightRed;

      case PokemonTypes.water:
      case PokemonTypes.fighting:
      case PokemonTypes.normal:
        return AppColors.lightBlue;

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

      default:
        return AppColors.lightBlue;
    }
  }
}
