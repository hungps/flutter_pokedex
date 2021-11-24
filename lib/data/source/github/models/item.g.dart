// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GithubItemModel _$GithubItemModelFromJson(Map<String, dynamic> json) {
  $checkKeys(json, disallowNullValues: const [
    'name',
    'category',
    'imageUrl',
    'effect',
  ]);
  return GithubItemModel(
    json['name'] as String,
    json['category'] as String,
    json['imageurl'] as String,
    json['effect'] as String,
  );
}

Map<String, dynamic> _$GithubItemModelToJson(GithubItemModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('category', instance.category);
  writeNotNull('imageurl', instance.imageurl);
  writeNotNull('effect', instance.effect);

  return val;
}
