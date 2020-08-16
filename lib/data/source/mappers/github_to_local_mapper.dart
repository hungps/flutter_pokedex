import 'package:pokedex/core/extensions/string.dart';
import 'package:pokedex/data/source/github/models/pokemon.dart';
import 'package:pokedex/data/source/local/models/pokemon.dart';
import 'package:pokedex/data/source/local/models/pokemon_gender.dart';
import 'package:pokedex/data/source/local/models/pokemon_stats.dart';

extension GithubPokemonModelToLocalX on GithubPokemonModel {
  PokemonHiveModel toHiveModel() => PokemonHiveModel()
    ..number = id?.trim() ?? ''
    ..name = name?.trim() ?? ''
    ..description = xDescription?.trim() ?? ''
    ..types = types?.toList(growable: false) ?? []
    ..image = imageUrl?.trim() ?? ''
    ..height = height?.trim() ?? ''
    ..weight = weight?.trim() ?? ''
    ..genera = category?.trim() ?? ''
    ..eggGroups = eggGroups
            ?.split(RegExp(r',\s*?'))
            ?.map((e) => e?.trim() ?? '')
            ?.toList() ??
        []
    ..gender = (PokemonGenderHiveModel()
      ..male = genderMalePercentage?.parseDouble() ?? 0.0
      ..female = genderFemalePercentage?.parseDouble() ?? 0.0
      ..genderless = genderless == 1)
    ..stats = (PokemonStatsHiveModel()
      ..hp = hp?.toInt() ?? 0
      ..speed = speed?.toInt() ?? 0
      ..attack = attack?.toInt() ?? 0
      ..defense = defense?.toInt() ?? 0
      ..specialAttack = specialAttack?.toInt() ?? 0
      ..specialDefense = specialDefense?.toInt() ?? 0)
    ..baseExp = baseExp?.parseDouble()
    ..evolutions = evolutions ?? []
    ..evolutionReason = reason ?? '';
}
