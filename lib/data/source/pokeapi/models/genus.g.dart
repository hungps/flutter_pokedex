// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genus.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PokeApiGenusImpl _$$PokeApiGenusImplFromJson(Map<String, dynamic> json) =>
    _$PokeApiGenusImpl(
      genus: json['genus'] as String,
      language: PokeApiNamedApiResource.fromJson(
          json['language'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PokeApiGenusImplToJson(_$PokeApiGenusImpl instance) =>
    <String, dynamic>{
      'genus': instance.genus,
      'language': instance.language,
    };
