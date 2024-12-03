import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex/data/source/pokeapi/models/named_api_resource.dart';

part 'genus.freezed.dart';
part 'genus.g.dart';

@freezed
class PokeApiGenus with _$PokeApiGenus {
  const factory PokeApiGenus({
    @JsonKey(name: 'genus') required String genus,
    @JsonKey(name: 'language') required PokeApiNamedApiResource language,
  }) = _PokeApiGenus;

  factory PokeApiGenus.fromJson(Map<String, dynamic> json) =>
      _$PokeApiGenusFromJson(json);
}
