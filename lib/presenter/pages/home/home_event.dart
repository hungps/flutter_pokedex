import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_event.freezed.dart';

@freezed
final class HomeEvent with _$HomeEvent {
  const factory HomeEvent.loadStarted() = HomeLoadStarted;
}
