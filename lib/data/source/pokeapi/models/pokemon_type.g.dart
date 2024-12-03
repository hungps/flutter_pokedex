// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PokeApiPokemonTypeImpl _$$PokeApiPokemonTypeImplFromJson(
        Map<String, dynamic> json) =>
    _$PokeApiPokemonTypeImpl(
      slot: (json['slot'] as num).toInt(),
      type: PokeApiNamedApiResource.fromJson(
          json['type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PokeApiPokemonTypeImplToJson(
        _$PokeApiPokemonTypeImpl instance) =>
    <String, dynamic>{
      'slot': instance.slot,
      'type': instance.type,
    };
