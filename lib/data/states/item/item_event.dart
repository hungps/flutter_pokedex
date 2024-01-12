import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_event.freezed.dart';

@freezed
class ItemEvent with _$ItemEvent {
  const factory ItemEvent.loadStarted({@Default(false) bool loadAll}) = ItemLoadStarted;

  const factory ItemEvent.loadMoreStarted() = ItemLoadMoreStarted;

  const factory ItemEvent.selectChanged({required String itemId}) = ItemSelectChanged;
}
