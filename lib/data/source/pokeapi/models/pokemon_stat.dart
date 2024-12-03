import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex/data/source/pokeapi/models/named_api_resource.dart';

part 'pokemon_stat.freezed.dart';
part 'pokemon_stat.g.dart';

@freezed
class PokeApiPokemonStat with _$PokeApiPokemonStat {
  const factory PokeApiPokemonStat({
    @JsonKey(name: 'base_stat') required int baseStat,
    @JsonKey(name: 'effort') required int effort,
    @JsonKey(name: 'stat') required PokeApiNamedApiResource stat,
  }) = _PokeApiPokemonStat;

  factory PokeApiPokemonStat.fromJson(Map<String, dynamic> json) =>
      _$PokeApiPokemonStatFromJson(json);
}
