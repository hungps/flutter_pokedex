// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PokeApiPaginationImpl _$$PokeApiPaginationImplFromJson(
        Map<String, dynamic> json) =>
    _$PokeApiPaginationImpl(
      offset: (json['offset'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
    );

Map<String, dynamic> _$$PokeApiPaginationImplToJson(
        _$PokeApiPaginationImpl instance) =>
    <String, dynamic>{
      'offset': instance.offset,
      'limit': instance.limit,
    };
