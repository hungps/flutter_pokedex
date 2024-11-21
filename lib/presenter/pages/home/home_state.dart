import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex/data/entities/news.dart';

part 'home_state.freezed.dart';

enum HomeStatus {
  initial,
  loading,
  loaded,
}

@freezed
final class HomeState with _$HomeState {
  const factory HomeState({
    @Default(HomeStatus.initial) status,
    @Default([]) List<News> news,
  }) = _HomeState;
}
