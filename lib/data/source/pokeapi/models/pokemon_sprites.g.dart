// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_sprites.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PokeApiPokemonSpritesImpl _$$PokeApiPokemonSpritesImplFromJson(
        Map<String, dynamic> json) =>
    _$PokeApiPokemonSpritesImpl(
      other: PokeApiPokemonSpritesOther.fromJson(
          json['other'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PokeApiPokemonSpritesImplToJson(
        _$PokeApiPokemonSpritesImpl instance) =>
    <String, dynamic>{
      'other': instance.other,
    };

_$PokeApiPokemonSpritesOtherImpl _$$PokeApiPokemonSpritesOtherImplFromJson(
        Map<String, dynamic> json) =>
    _$PokeApiPokemonSpritesOtherImpl(
      officialArtwork: PokeApiPokemonSpritesOtherOfficialArtwork.fromJson(
          json['official-artwork'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PokeApiPokemonSpritesOtherImplToJson(
        _$PokeApiPokemonSpritesOtherImpl instance) =>
    <String, dynamic>{
      'official-artwork': instance.officialArtwork,
    };

_$PokeApiPokemonSpritesOtherOfficialArtworkImpl
    _$$PokeApiPokemonSpritesOtherOfficialArtworkImplFromJson(
            Map<String, dynamic> json) =>
        _$PokeApiPokemonSpritesOtherOfficialArtworkImpl(
          frontDefault: json['front_default'] as String,
        );

Map<String, dynamic> _$$PokeApiPokemonSpritesOtherOfficialArtworkImplToJson(
        _$PokeApiPokemonSpritesOtherOfficialArtworkImpl instance) =>
    <String, dynamic>{
      'front_default': instance.frontDefault,
    };
