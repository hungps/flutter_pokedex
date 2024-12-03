// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'named_api_resource_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PokeApiNamedApiResourceListImpl _$$PokeApiNamedApiResourceListImplFromJson(
        Map<String, dynamic> json) =>
    _$PokeApiNamedApiResourceListImpl(
      count: (json['count'] as num).toInt(),
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) =>
              PokeApiNamedApiResource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PokeApiNamedApiResourceListImplToJson(
        _$PokeApiNamedApiResourceListImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
