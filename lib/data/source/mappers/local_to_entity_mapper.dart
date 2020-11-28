import 'package:pokedex/data/source/local/models/pokemon.dart';
import 'package:pokedex/data/source/local/models/pokemon_gender.dart';
import 'package:pokedex/data/source/local/models/pokemon_stats.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/domain/entities/pokemon_props.dart';
import 'package:pokedex/domain/entities/pokemon_types.dart';

extension PokemonHiveModelX on PokemonHiveModel {
  Pokemon toEntity({List<PokemonHiveModel> evolutions = const []}) => Pokemon(
        number: number?.trim() ?? '',
        name: name?.trim() ?? '',
        description: description?.trim() ?? '',
        types: types.map((e) => PokemonTypesX.parse(e)).toList(),
        image: image?.trim() ?? '',
        height: height?.trim() ?? '',
        weight: weight?.trim() ?? '',
        genera: genera?.trim() ?? '',
        eggGroups: eggGroups.map((e) => e?.trim() ?? '').where((e) => e.isNotEmpty).toList(),
        gender: gender.toEntity(),
        stats: stats.toEntity(),
        baseExp: baseExp ?? 0.0,
        evolutions: evolutions.map((e) => e.toEntity()).toList(),
        evolutionReason: evolutionReason ?? '',
      );
}

extension PokemonGenderHiveModelX on PokemonGenderHiveModel {
  PokemonGender toEntity() => PokemonGender(
        male: male ?? 0.0,
        female: female ?? 0.0,
        genderless: genderless ?? false,
      );
}

extension PokemonStatsHiveModelX on PokemonStatsHiveModel {
  PokemonStats toEntity() => PokemonStats(
        attack: attack ?? 0,
        specialAttack: specialAttack ?? 0,
        defense: defense ?? 0,
        specialDefense: specialDefense ?? 0,
        hp: hp ?? 0,
        speed: speed ?? 0,
      );
}
