import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex/data/entities/item.dart';

part 'item_state.freezed.dart';

enum ItemStateStatus {
  initial,
  loading,
  loadingMore,
  success,
  failure,
}

@freezed
class ItemState with _$ItemState {
  const factory ItemState({
    @Default(ItemStateStatus.initial) ItemStateStatus status,
    @Default([]) List<Item> items,
    @Default(0) int selectedItemIndex,
    @Default(1) int page,
    @Default(true) bool canLoadMore,
    Exception? error,
  }) = _ItemState;

  const ItemState._();

  Item get selectedItem => items[selectedItemIndex];
}
