import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pokedex/domain/entities/type_color.dart';

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
<<<<<<< HEAD
<<<<<<< HEAD
  Color get color {
    if (types.isEmpty) {
      return AppColors.lightBlue;
    }

    return colorGenerator(types[0]);
=======
=======
>>>>>>> 9aea3afa11a8d7fc9ec69f74ae71a85be18e521c
  Color get color => types?.first?.color ?? AppColors.lightBlue;

  Map<PokemonTypes, double> get typeEffectiveness {
    final effectiveness =
        PokemonTypes.values.where((element) => element != PokemonTypes.unknown).map(
              (type) => MapEntry(
                type,
                types
                    .map((pokemonType) => pokemonType.effectiveness[type] ?? 1.0)
                    .reduce((total, effectiveness) => total * effectiveness),
              ),
            );

    return Map.fromEntries(effectiveness);
<<<<<<< HEAD
>>>>>>> upstream/master
=======
>>>>>>> 9aea3afa11a8d7fc9ec69f74ae71a85be18e521c
  }
}
