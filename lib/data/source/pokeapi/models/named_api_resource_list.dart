import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex/data/source/pokeapi/models/named_api_resource.dart';

part 'named_api_resource_list.freezed.dart';
part 'named_api_resource_list.g.dart';

@freezed
class PokeApiNamedApiResourceList with _$PokeApiNamedApiResourceList {
  const factory PokeApiNamedApiResourceList({
    @JsonKey(name: 'count') required int count,
    @JsonKey(name: 'next') required String? next,
    @JsonKey(name: 'previous') required String? previous,
    @JsonKey(name: 'results') required List<PokeApiNamedApiResource> results,
  }) = _PokeApiNamedApiResourceList;

  factory PokeApiNamedApiResourceList.fromJson(Map<String, dynamic> json) =>
      _$PokeApiNamedApiResourceListFromJson(json);
}
