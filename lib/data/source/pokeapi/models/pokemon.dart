import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex/data/source/pokeapi/models/named_api_resource.dart';
import 'package:pokedex/data/source/pokeapi/models/pokemon_sprites.dart';
import 'package:pokedex/data/source/pokeapi/models/pokemon_stat.dart';
import 'package:pokedex/data/source/pokeapi/models/pokemon_type.dart';

part 'pokemon.freezed.dart';
part 'pokemon.g.dart';

@freezed
class PokeApiPokemon with _$PokeApiPokemon {
  const factory PokeApiPokemon({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'base_experience') required int baseExperience,
    @JsonKey(name: 'height') required int height,
    @JsonKey(name: 'order') required int order,
    @JsonKey(name: 'weight') required int weight,
    @JsonKey(name: 'forms') required List<PokeApiNamedApiResource> forms,
    @JsonKey(name: 'species') required PokeApiNamedApiResource species,
    @JsonKey(name: 'sprites') required PokeApiPokemonSprites sprites,
    @JsonKey(name: 'stats') required List<PokeApiPokemonStat> stats,
    @JsonKey(name: 'types') required List<PokeApiPokemonType> types,
  }) = _PokeApiPokemon;

  factory PokeApiPokemon.fromJson(Map<String, dynamic> json) =>
      _$PokeApiPokemonFromJson(json);
}
