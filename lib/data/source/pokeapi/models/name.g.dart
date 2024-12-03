// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'name.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PokeApiNameImpl _$$PokeApiNameImplFromJson(Map<String, dynamic> json) =>
    _$PokeApiNameImpl(
      name: json['name'] as String,
      language: PokeApiNamedApiResource.fromJson(
          json['language'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PokeApiNameImplToJson(_$PokeApiNameImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'language': instance.language,
    };
