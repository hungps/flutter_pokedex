import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_sprites.freezed.dart';
part 'pokemon_sprites.g.dart';

@freezed
class PokeApiPokemonSprites with _$PokeApiPokemonSprites {
  const factory PokeApiPokemonSprites({
    @JsonKey(name: 'other') required PokeApiPokemonSpritesOther other,
  }) = _PokeApiPokemonSprites;

  factory PokeApiPokemonSprites.fromJson(Map<String, dynamic> json) =>
      _$PokeApiPokemonSpritesFromJson(json);
}

@freezed
class PokeApiPokemonSpritesOther with _$PokeApiPokemonSpritesOther {
  const factory PokeApiPokemonSpritesOther({
    @JsonKey(name: 'official-artwork')
    required PokeApiPokemonSpritesOtherOfficialArtwork officialArtwork,
  }) = _PokeApiPokemonSpritesOther;

  factory PokeApiPokemonSpritesOther.fromJson(Map<String, dynamic> json) =>
      _$PokeApiPokemonSpritesOtherFromJson(json);
}

@freezed
class PokeApiPokemonSpritesOtherOfficialArtwork
    with _$PokeApiPokemonSpritesOtherOfficialArtwork {
  const factory PokeApiPokemonSpritesOtherOfficialArtwork({
    @JsonKey(name: 'front_default') required String frontDefault,
  }) = _PokeApiPokemonSpritesOtherOfficialArtwork;

  factory PokeApiPokemonSpritesOtherOfficialArtwork.fromJson(
          Map<String, dynamic> json) =>
      _$PokeApiPokemonSpritesOtherOfficialArtworkFromJson(json);
}
