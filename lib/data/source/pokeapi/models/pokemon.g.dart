// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PokeApiPokemonImpl _$$PokeApiPokemonImplFromJson(Map<String, dynamic> json) =>
    _$PokeApiPokemonImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      baseExperience: (json['base_experience'] as num).toInt(),
      height: (json['height'] as num).toInt(),
      order: (json['order'] as num).toInt(),
      weight: (json['weight'] as num).toInt(),
      forms: (json['forms'] as List<dynamic>)
          .map((e) =>
              PokeApiNamedApiResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      species: PokeApiNamedApiResource.fromJson(
          json['species'] as Map<String, dynamic>),
      sprites: PokeApiPokemonSprites.fromJson(
          json['sprites'] as Map<String, dynamic>),
      stats: (json['stats'] as List<dynamic>)
          .map((e) => PokeApiPokemonStat.fromJson(e as Map<String, dynamic>))
          .toList(),
      types: (json['types'] as List<dynamic>)
          .map((e) => PokeApiPokemonType.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PokeApiPokemonImplToJson(
        _$PokeApiPokemonImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'base_experience': instance.baseExperience,
      'height': instance.height,
      'order': instance.order,
      'weight': instance.weight,
      'forms': instance.forms,
      'species': instance.species,
      'sprites': instance.sprites,
      'stats': instance.stats,
      'types': instance.types,
    };
