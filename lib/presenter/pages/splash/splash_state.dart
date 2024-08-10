import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_state.freezed.dart';

enum SplashStatus {
  initial,
  loading,
  loaded,
}

@freezed
class SplashState with _$SplashState {
  const factory SplashState({
    @Default(SplashStatus.loading) SplashStatus status,
  }) = _SplashState;
}
