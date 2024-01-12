import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_properties.freezed.dart';
part 'pokemon_properties.g.dart';

@freezed
class PokemonGender with _$PokemonGender {
  const factory PokemonGender({
    required bool genderless,
    required double maleRate,
    required double femaleRate,
  }) = _PokemonGender;

  factory PokemonGender.fromJson(Map<String, Object?> json) => _$PokemonGenderFromJson(json);
}

@freezed
class PokemonStats with _$PokemonStats {
  const factory PokemonStats({
    required int attack,
    required int specialAttack,
    required int defense,
    required int specialDefense,
    required int hp,
    required int speed,
  }) = _PokemonStats;

  const PokemonStats._();

  int get total => attack + specialAttack + defense + specialDefense + hp + speed;

  factory PokemonStats.fromJson(Map<String, Object?> json) => _$PokemonStatsFromJson(json);
}
