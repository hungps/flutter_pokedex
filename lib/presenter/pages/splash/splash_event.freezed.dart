// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'splash_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SplashEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadStarted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadStarted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadStarted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SplashLoadStarted value) loadStarted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SplashLoadStarted value)? loadStarted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SplashLoadStarted value)? loadStarted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SplashEventCopyWith<$Res> {
  factory $SplashEventCopyWith(
          SplashEvent value, $Res Function(SplashEvent) then) =
      _$SplashEventCopyWithImpl<$Res, SplashEvent>;
}

/// @nodoc
class _$SplashEventCopyWithImpl<$Res, $Val extends SplashEvent>
    implements $SplashEventCopyWith<$Res> {
  _$SplashEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SplashEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SplashLoadStartedImplCopyWith<$Res> {
  factory _$$SplashLoadStartedImplCopyWith(_$SplashLoadStartedImpl value,
          $Res Function(_$SplashLoadStartedImpl) then) =
      __$$SplashLoadStartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SplashLoadStartedImplCopyWithImpl<$Res>
    extends _$SplashEventCopyWithImpl<$Res, _$SplashLoadStartedImpl>
    implements _$$SplashLoadStartedImplCopyWith<$Res> {
  __$$SplashLoadStartedImplCopyWithImpl(_$SplashLoadStartedImpl _value,
      $Res Function(_$SplashLoadStartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of SplashEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SplashLoadStartedImpl
    with DiagnosticableTreeMixin
    implements SplashLoadStarted {
  const _$SplashLoadStartedImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SplashEvent.loadStarted()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'SplashEvent.loadStarted'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SplashLoadStartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadStarted,
  }) {
    return loadStarted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadStarted,
  }) {
    return loadStarted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadStarted,
    required TResult orElse(),
  }) {
    if (loadStarted != null) {
      return loadStarted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SplashLoadStarted value) loadStarted,
  }) {
    return loadStarted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SplashLoadStarted value)? loadStarted,
  }) {
    return loadStarted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SplashLoadStarted value)? loadStarted,
    required TResult orElse(),
  }) {
    if (loadStarted != null) {
      return loadStarted(this);
    }
    return orElse();
  }
}

abstract class SplashLoadStarted implements SplashEvent {
  const factory SplashLoadStarted() = _$SplashLoadStartedImpl;
}
