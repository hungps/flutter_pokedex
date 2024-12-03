import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'named_api_resource.freezed.dart';
part 'named_api_resource.g.dart';

@freezed
class PokeApiNamedApiResource with _$PokeApiNamedApiResource {
  const factory PokeApiNamedApiResource({
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'url') required String url,
  }) = _PokeApiNamedApiResource;

  factory PokeApiNamedApiResource.fromJson(Map<String, dynamic> json) =>
      _$PokeApiNamedApiResourceFromJson(json);
}
