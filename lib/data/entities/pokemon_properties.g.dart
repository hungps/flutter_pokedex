// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_properties.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PokemonGenderImpl _$$PokemonGenderImplFromJson(Map<String, dynamic> json) =>
    _$PokemonGenderImpl(
      genderless: json['genderless'] as bool,
      maleRate: (json['maleRate'] as num).toDouble(),
      femaleRate: (json['femaleRate'] as num).toDouble(),
    );

Map<String, dynamic> _$$PokemonGenderImplToJson(_$PokemonGenderImpl instance) =>
    <String, dynamic>{
      'genderless': instance.genderless,
      'maleRate': instance.maleRate,
      'femaleRate': instance.femaleRate,
    };

_$PokemonStatsImpl _$$PokemonStatsImplFromJson(Map<String, dynamic> json) =>
    _$PokemonStatsImpl(
      attack: (json['attack'] as num).toInt(),
      specialAttack: (json['specialAttack'] as num).toInt(),
      defense: (json['defense'] as num).toInt(),
      specialDefense: (json['specialDefense'] as num).toInt(),
      hp: (json['hp'] as num).toInt(),
      speed: (json['speed'] as num).toInt(),
    );

Map<String, dynamic> _$$PokemonStatsImplToJson(_$PokemonStatsImpl instance) =>
    <String, dynamic>{
      'attack': instance.attack,
      'specialAttack': instance.specialAttack,
      'defense': instance.defense,
      'specialDefense': instance.specialDefense,
      'hp': instance.hp,
      'speed': instance.speed,
    };
