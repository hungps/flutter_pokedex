import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination.freezed.dart';

@freezed
class Pagination with _$Pagination {
  const factory Pagination({
    /// The current page (starting from 1).
    @Default(1) int page,

    /// The number of items per page.
    @Default(20) int itemsPerPage,
  }) = _Pagination;
}
