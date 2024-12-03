import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex/data/source/pokeapi/models/named_api_resource.dart';

part 'flavor_text.freezed.dart';
part 'flavor_text.g.dart';

@freezed
class PokeApiFlavorText with _$PokeApiFlavorText {
  const factory PokeApiFlavorText({
    @JsonKey(name: 'flavor_text') required String flavorText,
    @JsonKey(name: 'language') required PokeApiNamedApiResource language,
  }) = _PokeApiFlavorText;

  factory PokeApiFlavorText.fromJson(Map<String, dynamic> json) =>
      _$PokeApiFlavorTextFromJson(json);
}
