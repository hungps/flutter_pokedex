import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex/data/source/pokeapi/models/named_api_resource.dart';

part 'pokemon_type.freezed.dart';
part 'pokemon_type.g.dart';

@freezed
class PokeApiPokemonType with _$PokeApiPokemonType {
  const factory PokeApiPokemonType({
    @JsonKey(name: 'slot') required int slot,
    @JsonKey(name: 'type') required PokeApiNamedApiResource type,
  }) = _PokeApiPokemonType;

  factory PokeApiPokemonType.fromJson(Map<String, dynamic> json) =>
      _$PokeApiPokemonTypeFromJson(json);
}
