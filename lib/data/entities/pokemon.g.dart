// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PokemonImpl _$$PokemonImplFromJson(Map<String, dynamic> json) =>
    _$PokemonImpl(
      number: json['number'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      types: (json['types'] as List<dynamic>)
          .map((e) => $enumDecode(_$PokemonTypesEnumMap, e))
          .toList(),
      image: json['image'] as String,
      height: json['height'] as String,
      weight: json['weight'] as String,
      genera: json['genera'] as String,
      eggGroups:
          (json['eggGroups'] as List<dynamic>).map((e) => e as String).toList(),
      gender: PokemonGender.fromJson(json['gender'] as Map<String, dynamic>),
      stats: PokemonStats.fromJson(json['stats'] as Map<String, dynamic>),
      baseExp: (json['baseExp'] as num).toDouble(),
      evolutions: (json['evolutions'] as List<dynamic>)
          .map((e) => Pokemon.fromJson(e as Map<String, dynamic>))
          .toList(),
      evolutionReason: json['evolutionReason'] as String,
    );

Map<String, dynamic> _$$PokemonImplToJson(_$PokemonImpl instance) =>
    <String, dynamic>{
      'number': instance.number,
      'name': instance.name,
      'description': instance.description,
      'types': instance.types.map((e) => _$PokemonTypesEnumMap[e]!).toList(),
      'image': instance.image,
      'height': instance.height,
      'weight': instance.weight,
      'genera': instance.genera,
      'eggGroups': instance.eggGroups,
      'gender': instance.gender,
      'stats': instance.stats,
      'baseExp': instance.baseExp,
      'evolutions': instance.evolutions,
      'evolutionReason': instance.evolutionReason,
    };

const _$PokemonTypesEnumMap = {
  PokemonTypes.grass: 'grass',
  PokemonTypes.poison: 'poison',
  PokemonTypes.fire: 'fire',
  PokemonTypes.flying: 'flying',
  PokemonTypes.water: 'water',
  PokemonTypes.bug: 'bug',
  PokemonTypes.normal: 'normal',
  PokemonTypes.electric: 'electric',
  PokemonTypes.ground: 'ground',
  PokemonTypes.fairy: 'fairy',
  PokemonTypes.fighting: 'fighting',
  PokemonTypes.psychic: 'psychic',
  PokemonTypes.rock: 'rock',
  PokemonTypes.steel: 'steel',
  PokemonTypes.ice: 'ice',
  PokemonTypes.ghost: 'ghost',
  PokemonTypes.dragon: 'dragon',
  PokemonTypes.dark: 'dark',
  PokemonTypes.monster: 'monster',
  PokemonTypes.unknown: 'unknown',
};
