// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flavor_text.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PokeApiFlavorTextImpl _$$PokeApiFlavorTextImplFromJson(
        Map<String, dynamic> json) =>
    _$PokeApiFlavorTextImpl(
      flavorText: json['flavor_text'] as String,
      language: PokeApiNamedApiResource.fromJson(
          json['language'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PokeApiFlavorTextImplToJson(
        _$PokeApiFlavorTextImpl instance) =>
    <String, dynamic>{
      'flavor_text': instance.flavorText,
      'language': instance.language,
    };
