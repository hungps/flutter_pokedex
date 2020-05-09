// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GithubPokemonModel _$GithubPokemonModelFromJson(Map<String, dynamic> json) {
  $checkKeys(json, disallowNullValues: const [
    'name',
    'id',
    'imageurl',
    'typeofpokemon',
    'hp',
    'attack',
    'defense',
    'special_attack',
    'special_defense',
    'speed',
    'total',
    'male_percentage',
    'female_percentage',
    'genderless',
    'egg_groups'
  ]);
  return GithubPokemonModel(
    json['name'] as String,
    json['id'] as String,
    json['imageurl'] as String,
    json['xdescription'] as String ?? '',
    json['ydescription'] as String ?? '',
    json['height'] as String ?? '',
    json['category'] as String ?? '',
    json['weight'] as String ?? '',
    (json['typeofpokemon'] as List)?.map((e) => e as String)?.toList(),
    (json['weaknesses'] as List)?.map((e) => e as String)?.toList() ?? [],
    (json['evolutions'] as List)?.map((e) => e as String)?.toList() ?? [],
    (json['abilities'] as List)?.map((e) => e as String)?.toList() ?? [],
    json['hp'] as num,
    json['attack'] as num,
    json['defense'] as num,
    json['special_attack'] as num,
    json['special_defense'] as num,
    json['speed'] as num,
    json['total'] as num,
    json['male_percentage'] as String,
    json['female_percentage'] as String,
    json['genderless'] as num,
    json['cycles'] as String ?? '',
    json['egg_groups'] as String,
    json['evolvedfrom'] as String,
    json['reason'] as String ?? '',
    json['base_exp'] as String ?? '0',
  );
}

Map<String, dynamic> _$GithubPokemonModelToJson(GithubPokemonModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('id', instance.id);
  writeNotNull('imageurl', instance.imageUrl);
  val['xdescription'] = instance.xDescription;
  val['ydescription'] = instance.yDescription;
  val['height'] = instance.height;
  val['category'] = instance.category;
  val['weight'] = instance.weight;
  writeNotNull('typeofpokemon', instance.types);
  val['weaknesses'] = instance.weaknesses;
  val['evolutions'] = instance.evolutions;
  val['abilities'] = instance.abilities;
  writeNotNull('hp', instance.hp);
  writeNotNull('attack', instance.attack);
  writeNotNull('defense', instance.defense);
  writeNotNull('special_attack', instance.specialAttack);
  writeNotNull('special_defense', instance.specialDefense);
  writeNotNull('speed', instance.speed);
  writeNotNull('total', instance.total);
  writeNotNull('male_percentage', instance.genderMalePercentage);
  writeNotNull('female_percentage', instance.genderFemalePercentage);
  writeNotNull('genderless', instance.genderless);
  val['cycles'] = instance.cycles;
  writeNotNull('egg_groups', instance.eggGroups);
  val['evolvedfrom'] = instance.evolvedFrom;
  val['reason'] = instance.reason;
  val['base_exp'] = instance.baseExp;
  return val;
}
