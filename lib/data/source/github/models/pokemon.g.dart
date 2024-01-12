// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GithubPokemonModel _$GithubPokemonModelFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'name',
      'id',
      'imageurl',
      'typeofpokemon',
      'genderless'
    ],
    disallowNullValues: const [
      'name',
      'id',
      'imageurl',
      'typeofpokemon',
      'genderless'
    ],
  );
  return GithubPokemonModel(
    json['name'] as String,
    json['id'] as String,
    json['imageurl'] as String,
    json['xdescription'] as String? ?? '',
    json['ydescription'] as String? ?? '',
    json['height'] as String? ?? '',
    json['category'] as String? ?? '',
    json['weight'] as String? ?? '',
    (json['typeofpokemon'] as List<dynamic>).map((e) => e as String).toList(),
    (json['weaknesses'] as List<dynamic>?)?.map((e) => e as String).toList() ??
        [],
    (json['evolutions'] as List<dynamic>?)?.map((e) => e as String).toList() ??
        [],
    (json['abilities'] as List<dynamic>?)?.map((e) => e as String).toList() ??
        [],
    json['hp'] as num? ?? 0,
    json['attack'] as num? ?? 0,
    json['defense'] as num? ?? 0,
    json['special_attack'] as num? ?? 0,
    json['special_defense'] as num? ?? 0,
    json['speed'] as num? ?? 0,
    json['total'] as num? ?? 0,
    json['male_percentage'] as String?,
    json['female_percentage'] as String?,
    json['genderless'] as num,
    json['cycles'] as String?,
    json['egg_groups'] as String?,
    json['evolvedfrom'] as String?,
    json['reason'] as String?,
    json['base_exp'] as String? ?? '0',
  );
}

Map<String, dynamic> _$GithubPokemonModelToJson(GithubPokemonModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'imageurl': instance.imageUrl,
      'xdescription': instance.xDescription,
      'ydescription': instance.yDescription,
      'height': instance.height,
      'category': instance.category,
      'weight': instance.weight,
      'typeofpokemon': instance.types,
      'weaknesses': instance.weaknesses,
      'evolutions': instance.evolutions,
      'abilities': instance.abilities,
      'hp': instance.hp,
      'attack': instance.attack,
      'defense': instance.defense,
      'special_attack': instance.specialAttack,
      'special_defense': instance.specialDefense,
      'speed': instance.speed,
      'total': instance.total,
      'male_percentage': instance.genderMalePercentage,
      'female_percentage': instance.genderFemalePercentage,
      'genderless': instance.genderless,
      'cycles': instance.cycles,
      'egg_groups': instance.eggGroups,
      'evolvedfrom': instance.evolvedFrom,
      'reason': instance.reason,
      'base_exp': instance.baseExp,
    };
