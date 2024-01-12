import 'package:pokedex/data/source/local/models/item.dart';
import 'package:pokedex/data/source/local/models/pokemon.dart';
import 'package:pokedex/data/source/local/models/pokemon_gender.dart';
import 'package:pokedex/data/source/local/models/pokemon_stats.dart';
import 'package:pokedex/data/entities/item.dart';
import 'package:pokedex/data/entities/pokemon.dart';
import 'package:pokedex/data/entities/pokemon_properties.dart';
import 'package:pokedex/data/entities/pokemon_types.dart';

extension PokemonHiveModelX on PokemonHiveModel {
  Pokemon toEntity({List<PokemonHiveModel> evolutions = const []}) => Pokemon(
        number: number.trim(),
        name: name.trim(),
        description: description.trim(),
        types: types.map((e) => PokemonTypes.parse(e)).toList(),
        image: image.trim(),
        height: height.trim(),
        weight: weight.trim(),
        genera: genera.trim(),
        eggGroups: eggGroups.map((e) => e.trim()).where((e) => e.isNotEmpty).toList(),
        gender: gender.toEntity(),
        stats: stats.toEntity(),
        baseExp: baseExp,
        evolutions: evolutions.map((e) => e.toEntity()).toList(),
        evolutionReason: evolutionReason,
      );
}

extension PokemonGenderHiveModelX on PokemonGenderHiveModel {
  PokemonGender toEntity() => PokemonGender(
        maleRate: male,
        femaleRate: female,
        genderless: genderless,
      );
}

extension PokemonStatsHiveModelX on PokemonStatsHiveModel {
  PokemonStats toEntity() => PokemonStats(
        attack: attack,
        specialAttack: specialAttack,
        defense: defense,
        specialDefense: specialDefense,
        hp: hp,
        speed: speed,
      );
}

extension ItemHiveModelX on ItemHiveModel {
  Item toEntity({List<ItemHiveModel> evolutions = const []}) => Item(
        name: name?.trim() ?? '',
        category: name?.trim() ?? '',
        image: imageurl?.trim() ?? '',
        effect: effect?.trim() ?? '',
      );
}
