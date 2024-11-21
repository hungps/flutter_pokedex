import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'news.freezed.dart';

@freezed
class News with _$News {
  const factory News({
    required String title,
    required DateTime postedAt,
    required String thumbnail,
  }) = _News;
}
