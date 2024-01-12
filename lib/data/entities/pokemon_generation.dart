import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_generation.freezed.dart';
part 'pokemon_generation.g.dart';

@freezed
class PokemonGeneration with _$PokemonGeneration {
  const factory PokemonGeneration({
    required String title,
    required List<String> pokemonImages,
  }) = _PokemonGeneration;

  factory PokemonGeneration.fromJson(Map<String, Object?> json) =>
      _$PokemonGenerationFromJson(json);
}
