import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination.freezed.dart';
part 'pagination.g.dart';

@freezed
class PokeApiPagination with _$PokeApiPagination {
  const factory PokeApiPagination({
    @JsonKey(name: 'offset') required int offset,
    @JsonKey(name: 'limit') required int limit,
  }) = _PokeApiPagination;

  factory PokeApiPagination.fromJson(Map<String, dynamic> json) =>
      _$PokeApiPaginationFromJson(json);
}
