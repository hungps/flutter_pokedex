// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PokemonEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool loadAll) loadStarted,
    required TResult Function() loadMoreStarted,
    required TResult Function(String pokemonId) selectChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool loadAll)? loadStarted,
    TResult? Function()? loadMoreStarted,
    TResult? Function(String pokemonId)? selectChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool loadAll)? loadStarted,
    TResult Function()? loadMoreStarted,
    TResult Function(String pokemonId)? selectChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PokemonLoadStarted value) loadStarted,
    required TResult Function(PokemonLoadMoreStarted value) loadMoreStarted,
    required TResult Function(PokemonSelectChanged value) selectChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PokemonLoadStarted value)? loadStarted,
    TResult? Function(PokemonLoadMoreStarted value)? loadMoreStarted,
    TResult? Function(PokemonSelectChanged value)? selectChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PokemonLoadStarted value)? loadStarted,
    TResult Function(PokemonLoadMoreStarted value)? loadMoreStarted,
    TResult Function(PokemonSelectChanged value)? selectChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonEventCopyWith<$Res> {
  factory $PokemonEventCopyWith(
          PokemonEvent value, $Res Function(PokemonEvent) then) =
      _$PokemonEventCopyWithImpl<$Res, PokemonEvent>;
}

/// @nodoc
class _$PokemonEventCopyWithImpl<$Res, $Val extends PokemonEvent>
    implements $PokemonEventCopyWith<$Res> {
  _$PokemonEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$PokemonLoadStartedImplCopyWith<$Res> {
  factory _$$PokemonLoadStartedImplCopyWith(_$PokemonLoadStartedImpl value,
          $Res Function(_$PokemonLoadStartedImpl) then) =
      __$$PokemonLoadStartedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool loadAll});
}

/// @nodoc
class __$$PokemonLoadStartedImplCopyWithImpl<$Res>
    extends _$PokemonEventCopyWithImpl<$Res, _$PokemonLoadStartedImpl>
    implements _$$PokemonLoadStartedImplCopyWith<$Res> {
  __$$PokemonLoadStartedImplCopyWithImpl(_$PokemonLoadStartedImpl _value,
      $Res Function(_$PokemonLoadStartedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadAll = null,
  }) {
    return _then(_$PokemonLoadStartedImpl(
      loadAll: null == loadAll
          ? _value.loadAll
          : loadAll // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PokemonLoadStartedImpl
    with DiagnosticableTreeMixin
    implements PokemonLoadStarted {
  const _$PokemonLoadStartedImpl({this.loadAll = false});

  @override
  @JsonKey()
  final bool loadAll;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PokemonEvent.loadStarted(loadAll: $loadAll)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PokemonEvent.loadStarted'))
      ..add(DiagnosticsProperty('loadAll', loadAll));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonLoadStartedImpl &&
            (identical(other.loadAll, loadAll) || other.loadAll == loadAll));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loadAll);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonLoadStartedImplCopyWith<_$PokemonLoadStartedImpl> get copyWith =>
      __$$PokemonLoadStartedImplCopyWithImpl<_$PokemonLoadStartedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool loadAll) loadStarted,
    required TResult Function() loadMoreStarted,
    required TResult Function(String pokemonId) selectChanged,
  }) {
    return loadStarted(loadAll);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool loadAll)? loadStarted,
    TResult? Function()? loadMoreStarted,
    TResult? Function(String pokemonId)? selectChanged,
  }) {
    return loadStarted?.call(loadAll);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool loadAll)? loadStarted,
    TResult Function()? loadMoreStarted,
    TResult Function(String pokemonId)? selectChanged,
    required TResult orElse(),
  }) {
    if (loadStarted != null) {
      return loadStarted(loadAll);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PokemonLoadStarted value) loadStarted,
    required TResult Function(PokemonLoadMoreStarted value) loadMoreStarted,
    required TResult Function(PokemonSelectChanged value) selectChanged,
  }) {
    return loadStarted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PokemonLoadStarted value)? loadStarted,
    TResult? Function(PokemonLoadMoreStarted value)? loadMoreStarted,
    TResult? Function(PokemonSelectChanged value)? selectChanged,
  }) {
    return loadStarted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PokemonLoadStarted value)? loadStarted,
    TResult Function(PokemonLoadMoreStarted value)? loadMoreStarted,
    TResult Function(PokemonSelectChanged value)? selectChanged,
    required TResult orElse(),
  }) {
    if (loadStarted != null) {
      return loadStarted(this);
    }
    return orElse();
  }
}

abstract class PokemonLoadStarted implements PokemonEvent {
  const factory PokemonLoadStarted({final bool loadAll}) =
      _$PokemonLoadStartedImpl;

  bool get loadAll;
  @JsonKey(ignore: true)
  _$$PokemonLoadStartedImplCopyWith<_$PokemonLoadStartedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PokemonLoadMoreStartedImplCopyWith<$Res> {
  factory _$$PokemonLoadMoreStartedImplCopyWith(
          _$PokemonLoadMoreStartedImpl value,
          $Res Function(_$PokemonLoadMoreStartedImpl) then) =
      __$$PokemonLoadMoreStartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PokemonLoadMoreStartedImplCopyWithImpl<$Res>
    extends _$PokemonEventCopyWithImpl<$Res, _$PokemonLoadMoreStartedImpl>
    implements _$$PokemonLoadMoreStartedImplCopyWith<$Res> {
  __$$PokemonLoadMoreStartedImplCopyWithImpl(
      _$PokemonLoadMoreStartedImpl _value,
      $Res Function(_$PokemonLoadMoreStartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PokemonLoadMoreStartedImpl
    with DiagnosticableTreeMixin
    implements PokemonLoadMoreStarted {
  const _$PokemonLoadMoreStartedImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PokemonEvent.loadMoreStarted()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'PokemonEvent.loadMoreStarted'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonLoadMoreStartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool loadAll) loadStarted,
    required TResult Function() loadMoreStarted,
    required TResult Function(String pokemonId) selectChanged,
  }) {
    return loadMoreStarted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool loadAll)? loadStarted,
    TResult? Function()? loadMoreStarted,
    TResult? Function(String pokemonId)? selectChanged,
  }) {
    return loadMoreStarted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool loadAll)? loadStarted,
    TResult Function()? loadMoreStarted,
    TResult Function(String pokemonId)? selectChanged,
    required TResult orElse(),
  }) {
    if (loadMoreStarted != null) {
      return loadMoreStarted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PokemonLoadStarted value) loadStarted,
    required TResult Function(PokemonLoadMoreStarted value) loadMoreStarted,
    required TResult Function(PokemonSelectChanged value) selectChanged,
  }) {
    return loadMoreStarted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PokemonLoadStarted value)? loadStarted,
    TResult? Function(PokemonLoadMoreStarted value)? loadMoreStarted,
    TResult? Function(PokemonSelectChanged value)? selectChanged,
  }) {
    return loadMoreStarted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PokemonLoadStarted value)? loadStarted,
    TResult Function(PokemonLoadMoreStarted value)? loadMoreStarted,
    TResult Function(PokemonSelectChanged value)? selectChanged,
    required TResult orElse(),
  }) {
    if (loadMoreStarted != null) {
      return loadMoreStarted(this);
    }
    return orElse();
  }
}

abstract class PokemonLoadMoreStarted implements PokemonEvent {
  const factory PokemonLoadMoreStarted() = _$PokemonLoadMoreStartedImpl;
}

/// @nodoc
abstract class _$$PokemonSelectChangedImplCopyWith<$Res> {
  factory _$$PokemonSelectChangedImplCopyWith(_$PokemonSelectChangedImpl value,
          $Res Function(_$PokemonSelectChangedImpl) then) =
      __$$PokemonSelectChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String pokemonId});
}

/// @nodoc
class __$$PokemonSelectChangedImplCopyWithImpl<$Res>
    extends _$PokemonEventCopyWithImpl<$Res, _$PokemonSelectChangedImpl>
    implements _$$PokemonSelectChangedImplCopyWith<$Res> {
  __$$PokemonSelectChangedImplCopyWithImpl(_$PokemonSelectChangedImpl _value,
      $Res Function(_$PokemonSelectChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pokemonId = null,
  }) {
    return _then(_$PokemonSelectChangedImpl(
      pokemonId: null == pokemonId
          ? _value.pokemonId
          : pokemonId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PokemonSelectChangedImpl
    with DiagnosticableTreeMixin
    implements PokemonSelectChanged {
  const _$PokemonSelectChangedImpl({required this.pokemonId});

  @override
  final String pokemonId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PokemonEvent.selectChanged(pokemonId: $pokemonId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PokemonEvent.selectChanged'))
      ..add(DiagnosticsProperty('pokemonId', pokemonId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonSelectChangedImpl &&
            (identical(other.pokemonId, pokemonId) ||
                other.pokemonId == pokemonId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pokemonId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonSelectChangedImplCopyWith<_$PokemonSelectChangedImpl>
      get copyWith =>
          __$$PokemonSelectChangedImplCopyWithImpl<_$PokemonSelectChangedImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool loadAll) loadStarted,
    required TResult Function() loadMoreStarted,
    required TResult Function(String pokemonId) selectChanged,
  }) {
    return selectChanged(pokemonId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool loadAll)? loadStarted,
    TResult? Function()? loadMoreStarted,
    TResult? Function(String pokemonId)? selectChanged,
  }) {
    return selectChanged?.call(pokemonId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool loadAll)? loadStarted,
    TResult Function()? loadMoreStarted,
    TResult Function(String pokemonId)? selectChanged,
    required TResult orElse(),
  }) {
    if (selectChanged != null) {
      return selectChanged(pokemonId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PokemonLoadStarted value) loadStarted,
    required TResult Function(PokemonLoadMoreStarted value) loadMoreStarted,
    required TResult Function(PokemonSelectChanged value) selectChanged,
  }) {
    return selectChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PokemonLoadStarted value)? loadStarted,
    TResult? Function(PokemonLoadMoreStarted value)? loadMoreStarted,
    TResult? Function(PokemonSelectChanged value)? selectChanged,
  }) {
    return selectChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PokemonLoadStarted value)? loadStarted,
    TResult Function(PokemonLoadMoreStarted value)? loadMoreStarted,
    TResult Function(PokemonSelectChanged value)? selectChanged,
    required TResult orElse(),
  }) {
    if (selectChanged != null) {
      return selectChanged(this);
    }
    return orElse();
  }
}

abstract class PokemonSelectChanged implements PokemonEvent {
  const factory PokemonSelectChanged({required final String pokemonId}) =
      _$PokemonSelectChangedImpl;

  String get pokemonId;
  @JsonKey(ignore: true)
  _$$PokemonSelectChangedImplCopyWith<_$PokemonSelectChangedImpl>
      get copyWith => throw _privateConstructorUsedError;
}
