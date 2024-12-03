// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_species.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PokeApiPokemonSpeciesImpl _$$PokeApiPokemonSpeciesImplFromJson(
        Map<String, dynamic> json) =>
    _$PokeApiPokemonSpeciesImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      order: (json['order'] as num).toInt(),
      genderRate: (json['gender_rate'] as num).toInt(),
      eggGroups: (json['egg_groups'] as List<dynamic>)
          .map((e) =>
              PokeApiNamedApiResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      color: PokeApiNamedApiResource.fromJson(
          json['color'] as Map<String, dynamic>),
      generation: PokeApiNamedApiResource.fromJson(
          json['generation'] as Map<String, dynamic>),
      names: (json['names'] as List<dynamic>)
          .map((e) => PokeApiName.fromJson(e as Map<String, dynamic>))
          .toList(),
      flavorTextEntries: (json['flavor_text_entries'] as List<dynamic>)
          .map((e) => PokeApiFlavorText.fromJson(e as Map<String, dynamic>))
          .toList(),
      genera: (json['genera'] as List<dynamic>)
          .map((e) => PokeApiGenus.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PokeApiPokemonSpeciesImplToJson(
        _$PokeApiPokemonSpeciesImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'order': instance.order,
      'gender_rate': instance.genderRate,
      'egg_groups': instance.eggGroups,
      'color': instance.color,
      'generation': instance.generation,
      'names': instance.names,
      'flavor_text_entries': instance.flavorTextEntries,
      'genera': instance.genera,
    };
