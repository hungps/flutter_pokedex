import 'package:flutter/material.dart';

import 'pokemon_props.dart';
import 'pokemon_types.dart';

class Pokemon {
  const Pokemon({
    required this.number,
    required this.name,
    required this.description,
    required this.types,
    required this.image,
    required this.height,
    required this.weight,
    required this.genera,
    required this.eggGroups,
    required this.gender,
    required this.stats,
    required this.baseExp,
    required this.evolutions,
    required this.evolutionReason,
  });

  final String number;
  final String name;
  final String description;
  final List<PokemonTypes> types;
  final String image;
  final String height;
  final String weight;
  final String genera;
  final List<String> eggGroups;
  final PokemonGender gender;
  final PokemonStats stats;
  final double baseExp;
  final List<Pokemon> evolutions;
  final String evolutionReason;
}

extension PokemonX on Pokemon {
  Color get color => types.first.color;

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
  }
}
