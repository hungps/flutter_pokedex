import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex/data/source/pokeapi/models/named_api_resource.dart';

part 'name.freezed.dart';
part 'name.g.dart';

@freezed
class PokeApiName with _$PokeApiName {
  const factory PokeApiName({
    required String name,
    required PokeApiNamedApiResource language,
  }) = _PokeApiName;

  factory PokeApiName.fromJson(Map<String, dynamic> json) =>
      _$PokeApiNameFromJson(json);
}
