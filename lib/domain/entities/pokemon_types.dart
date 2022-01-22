import 'dart:ui';

import 'package:pokedex/configs/colors.dart';

import '../../core/extensions/string.dart';
import '../../core/utils.dart';

enum PokemonTypes {
  grass,
  poison,
  fire,
  flying,
  water,
  bug,
  normal,
  electric,
  ground,
  fairy,
  fighting,
  psychic,
  rock,
  steel,
  ice,
  ghost,
  dragon,
  dark,
  monster,
  unknown,
}

extension PokemonTypesX on PokemonTypes {
  String get value => getEnumValue(this).capitalize();

  static PokemonTypes parse(String rawValue) {
    final type = PokemonTypes.values.firstWhere(
      (element) => element.value.trim().toLowerCase() == rawValue.toLowerCase(),
      orElse: () => PokemonTypes.unknown,
    );

    return type;
  }

  Map<PokemonTypes, double> get effectiveness => _pokemonEffectivenessMap[this] ?? {};

  Color get color {
    switch (this) {
      case PokemonTypes.grass:
        return AppColors.lightGreen;

      case PokemonTypes.bug:
        return AppColors.lightTeal;

      case PokemonTypes.fire:
        return AppColors.lightRed;

      case PokemonTypes.water:
        return AppColors.lightBlue;

      case PokemonTypes.fighting:
        return AppColors.red;

      case PokemonTypes.normal:
        return AppColors.beige;

      case PokemonTypes.electric:
        return AppColors.lightYellow;

      case PokemonTypes.psychic:
        return AppColors.lightPink;

      case PokemonTypes.poison:
        return AppColors.lightPurple;

      case PokemonTypes.ghost:
        return AppColors.purple;

      case PokemonTypes.ground:
        return AppColors.darkBrown;

      case PokemonTypes.rock:
        return AppColors.lightBrown;

      case PokemonTypes.dark:
        return AppColors.black;

      case PokemonTypes.dragon:
        return AppColors.violet;

      case PokemonTypes.fairy:
        return AppColors.pink;

      case PokemonTypes.flying:
        return AppColors.lilac;

      case PokemonTypes.ice:
        return AppColors.lightCyan;

      case PokemonTypes.steel:
        return AppColors.grey;

      default:
        return AppColors.lightBlue;
    }
  }
}

final _pokemonEffectivenessMap = <PokemonTypes, Map<PokemonTypes, double>>{
  PokemonTypes.normal: {
    PokemonTypes.ghost: 0,
    PokemonTypes.fighting: 2,
  },
  PokemonTypes.fire: {
    PokemonTypes.bug: 0.5,
    PokemonTypes.fairy: 0.5,
    PokemonTypes.fire: 0.5,
    PokemonTypes.grass: 0.5,
    PokemonTypes.ice: 0.5,
    PokemonTypes.steel: 0.5,
    PokemonTypes.ground: 2,
    PokemonTypes.rock: 2,
    PokemonTypes.water: 2,
  },
  PokemonTypes.water: {
    PokemonTypes.fire: 0.5,
    PokemonTypes.ice: 0.5,
    PokemonTypes.steel: 0.5,
    PokemonTypes.water: 0.5,
    PokemonTypes.electric: 2,
    PokemonTypes.grass: 2,
  },
  PokemonTypes.electric: {
    PokemonTypes.electric: 0.5,
    PokemonTypes.flying: 0.5,
    PokemonTypes.steel: 0.5,
    PokemonTypes.ground: 2,
  },
  PokemonTypes.grass: {
    PokemonTypes.electric: 0.5,
    PokemonTypes.grass: 0.5,
    PokemonTypes.ground: 0.5,
    PokemonTypes.water: 0.5,
    PokemonTypes.bug: 2,
    PokemonTypes.ice: 2,
    PokemonTypes.flying: 2,
    PokemonTypes.fire: 2,
    PokemonTypes.poison: 2,
  },
  PokemonTypes.ice: {
    PokemonTypes.ice: 0.5,
    PokemonTypes.fire: 2,
    PokemonTypes.fighting: 2,
    PokemonTypes.rock: 2,
    PokemonTypes.steel: 2,
  },
  PokemonTypes.fighting: {
    PokemonTypes.bug: 0.5,
    PokemonTypes.rock: 0.5,
    PokemonTypes.dark: 0.5,
    PokemonTypes.flying: 2,
    PokemonTypes.psychic: 2,
    PokemonTypes.fairy: 2,
  },
  PokemonTypes.poison: {
    PokemonTypes.fighting: 0.5,
    PokemonTypes.poison: 0.5,
    PokemonTypes.bug: 0.5,
    PokemonTypes.fairy: 0.5,
    PokemonTypes.ground: 2,
    PokemonTypes.psychic: 2,
  },
  PokemonTypes.ground: {
    PokemonTypes.electric: 0,
    PokemonTypes.poison: 0.5,
    PokemonTypes.rock: 0.5,
    PokemonTypes.water: 2,
    PokemonTypes.grass: 2,
    PokemonTypes.ice: 2,
  },
  PokemonTypes.flying: {
    PokemonTypes.ground: 0,
    PokemonTypes.grass: 0.5,
    PokemonTypes.fighting: 0.5,
    PokemonTypes.bug: 0.5,
    PokemonTypes.electric: 2,
    PokemonTypes.ice: 2,
    PokemonTypes.rock: 2,
  },
  PokemonTypes.psychic: {
    PokemonTypes.fighting: 0.5,
    PokemonTypes.psychic: 0.5,
    PokemonTypes.bug: 2,
    PokemonTypes.ghost: 2,
    PokemonTypes.dark: 2,
  },
  PokemonTypes.bug: {
    PokemonTypes.grass: 0.5,
    PokemonTypes.fighting: 0.5,
    PokemonTypes.ground: 0.5,
    PokemonTypes.fire: 2,
    PokemonTypes.flying: 2,
    PokemonTypes.rock: 2,
  },
  PokemonTypes.rock: {
    PokemonTypes.normal: 0.5,
    PokemonTypes.fire: 0.5,
    PokemonTypes.poison: 0.5,
    PokemonTypes.flying: 0.5,
    PokemonTypes.water: 2,
    PokemonTypes.grass: 2,
    PokemonTypes.fighting: 2,
    PokemonTypes.ground: 2,
    PokemonTypes.steel: 2,
  },
  PokemonTypes.ghost: {
    PokemonTypes.normal: 0,
    PokemonTypes.fighting: 0,
    PokemonTypes.poison: 0.5,
    PokemonTypes.bug: 0.5,
    PokemonTypes.ghost: 2,
    PokemonTypes.dark: 2,
  },
  PokemonTypes.dragon: {
    PokemonTypes.fire: 0.5,
    PokemonTypes.water: 0.5,
    PokemonTypes.electric: 0.5,
    PokemonTypes.grass: 0.5,
    PokemonTypes.ice: 2,
    PokemonTypes.dragon: 2,
    PokemonTypes.fairy: 2,
  },
  PokemonTypes.dark: {
    PokemonTypes.psychic: 0,
    PokemonTypes.ghost: 0.5,
    PokemonTypes.dark: 0.5,
    PokemonTypes.fighting: 2,
    PokemonTypes.bug: 2,
    PokemonTypes.fairy: 2,
  },
  PokemonTypes.steel: {
    PokemonTypes.poison: 0,
    PokemonTypes.normal: 0.5,
    PokemonTypes.grass: 0.5,
    PokemonTypes.ice: 0.5,
    PokemonTypes.flying: 0.5,
    PokemonTypes.psychic: 0.5,
    PokemonTypes.bug: 0.5,
    PokemonTypes.rock: 0.5,
    PokemonTypes.dragon: 0.5,
    PokemonTypes.steel: 0.5,
    PokemonTypes.fairy: 0.5,
    PokemonTypes.fire: 2,
    PokemonTypes.fighting: 2,
    PokemonTypes.ground: 2,
  },
  PokemonTypes.fairy: {
    PokemonTypes.dragon: 0,
    PokemonTypes.fighting: 0.5,
    PokemonTypes.bug: 0.5,
    PokemonTypes.dark: 0.5,
    PokemonTypes.poison: 2,
    PokemonTypes.steel: 2,
  },
};
