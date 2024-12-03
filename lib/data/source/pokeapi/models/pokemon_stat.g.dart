// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_stat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PokeApiPokemonStatImpl _$$PokeApiPokemonStatImplFromJson(
        Map<String, dynamic> json) =>
    _$PokeApiPokemonStatImpl(
      baseStat: (json['base_stat'] as num).toInt(),
      effort: (json['effort'] as num).toInt(),
      stat: PokeApiNamedApiResource.fromJson(
          json['stat'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PokeApiPokemonStatImplToJson(
        _$PokeApiPokemonStatImpl instance) =>
    <String, dynamic>{
      'base_stat': instance.baseStat,
      'effort': instance.effort,
      'stat': instance.stat,
    };
