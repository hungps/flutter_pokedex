// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ItemEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool loadAll) loadStarted,
    required TResult Function() loadMoreStarted,
    required TResult Function(String itemId) selectChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool loadAll)? loadStarted,
    TResult? Function()? loadMoreStarted,
    TResult? Function(String itemId)? selectChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool loadAll)? loadStarted,
    TResult Function()? loadMoreStarted,
    TResult Function(String itemId)? selectChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ItemLoadStarted value) loadStarted,
    required TResult Function(ItemLoadMoreStarted value) loadMoreStarted,
    required TResult Function(ItemSelectChanged value) selectChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ItemLoadStarted value)? loadStarted,
    TResult? Function(ItemLoadMoreStarted value)? loadMoreStarted,
    TResult? Function(ItemSelectChanged value)? selectChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ItemLoadStarted value)? loadStarted,
    TResult Function(ItemLoadMoreStarted value)? loadMoreStarted,
    TResult Function(ItemSelectChanged value)? selectChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemEventCopyWith<$Res> {
  factory $ItemEventCopyWith(ItemEvent value, $Res Function(ItemEvent) then) =
      _$ItemEventCopyWithImpl<$Res, ItemEvent>;
}

/// @nodoc
class _$ItemEventCopyWithImpl<$Res, $Val extends ItemEvent>
    implements $ItemEventCopyWith<$Res> {
  _$ItemEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ItemLoadStartedImplCopyWith<$Res> {
  factory _$$ItemLoadStartedImplCopyWith(_$ItemLoadStartedImpl value,
          $Res Function(_$ItemLoadStartedImpl) then) =
      __$$ItemLoadStartedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool loadAll});
}

/// @nodoc
class __$$ItemLoadStartedImplCopyWithImpl<$Res>
    extends _$ItemEventCopyWithImpl<$Res, _$ItemLoadStartedImpl>
    implements _$$ItemLoadStartedImplCopyWith<$Res> {
  __$$ItemLoadStartedImplCopyWithImpl(
      _$ItemLoadStartedImpl _value, $Res Function(_$ItemLoadStartedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadAll = null,
  }) {
    return _then(_$ItemLoadStartedImpl(
      loadAll: null == loadAll
          ? _value.loadAll
          : loadAll // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ItemLoadStartedImpl
    with DiagnosticableTreeMixin
    implements ItemLoadStarted {
  const _$ItemLoadStartedImpl({this.loadAll = false});

  @override
  @JsonKey()
  final bool loadAll;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ItemEvent.loadStarted(loadAll: $loadAll)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ItemEvent.loadStarted'))
      ..add(DiagnosticsProperty('loadAll', loadAll));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemLoadStartedImpl &&
            (identical(other.loadAll, loadAll) || other.loadAll == loadAll));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loadAll);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemLoadStartedImplCopyWith<_$ItemLoadStartedImpl> get copyWith =>
      __$$ItemLoadStartedImplCopyWithImpl<_$ItemLoadStartedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool loadAll) loadStarted,
    required TResult Function() loadMoreStarted,
    required TResult Function(String itemId) selectChanged,
  }) {
    return loadStarted(loadAll);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool loadAll)? loadStarted,
    TResult? Function()? loadMoreStarted,
    TResult? Function(String itemId)? selectChanged,
  }) {
    return loadStarted?.call(loadAll);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool loadAll)? loadStarted,
    TResult Function()? loadMoreStarted,
    TResult Function(String itemId)? selectChanged,
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
    required TResult Function(ItemLoadStarted value) loadStarted,
    required TResult Function(ItemLoadMoreStarted value) loadMoreStarted,
    required TResult Function(ItemSelectChanged value) selectChanged,
  }) {
    return loadStarted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ItemLoadStarted value)? loadStarted,
    TResult? Function(ItemLoadMoreStarted value)? loadMoreStarted,
    TResult? Function(ItemSelectChanged value)? selectChanged,
  }) {
    return loadStarted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ItemLoadStarted value)? loadStarted,
    TResult Function(ItemLoadMoreStarted value)? loadMoreStarted,
    TResult Function(ItemSelectChanged value)? selectChanged,
    required TResult orElse(),
  }) {
    if (loadStarted != null) {
      return loadStarted(this);
    }
    return orElse();
  }
}

abstract class ItemLoadStarted implements ItemEvent {
  const factory ItemLoadStarted({final bool loadAll}) = _$ItemLoadStartedImpl;

  bool get loadAll;
  @JsonKey(ignore: true)
  _$$ItemLoadStartedImplCopyWith<_$ItemLoadStartedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ItemLoadMoreStartedImplCopyWith<$Res> {
  factory _$$ItemLoadMoreStartedImplCopyWith(_$ItemLoadMoreStartedImpl value,
          $Res Function(_$ItemLoadMoreStartedImpl) then) =
      __$$ItemLoadMoreStartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ItemLoadMoreStartedImplCopyWithImpl<$Res>
    extends _$ItemEventCopyWithImpl<$Res, _$ItemLoadMoreStartedImpl>
    implements _$$ItemLoadMoreStartedImplCopyWith<$Res> {
  __$$ItemLoadMoreStartedImplCopyWithImpl(_$ItemLoadMoreStartedImpl _value,
      $Res Function(_$ItemLoadMoreStartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ItemLoadMoreStartedImpl
    with DiagnosticableTreeMixin
    implements ItemLoadMoreStarted {
  const _$ItemLoadMoreStartedImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ItemEvent.loadMoreStarted()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'ItemEvent.loadMoreStarted'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemLoadMoreStartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool loadAll) loadStarted,
    required TResult Function() loadMoreStarted,
    required TResult Function(String itemId) selectChanged,
  }) {
    return loadMoreStarted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool loadAll)? loadStarted,
    TResult? Function()? loadMoreStarted,
    TResult? Function(String itemId)? selectChanged,
  }) {
    return loadMoreStarted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool loadAll)? loadStarted,
    TResult Function()? loadMoreStarted,
    TResult Function(String itemId)? selectChanged,
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
    required TResult Function(ItemLoadStarted value) loadStarted,
    required TResult Function(ItemLoadMoreStarted value) loadMoreStarted,
    required TResult Function(ItemSelectChanged value) selectChanged,
  }) {
    return loadMoreStarted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ItemLoadStarted value)? loadStarted,
    TResult? Function(ItemLoadMoreStarted value)? loadMoreStarted,
    TResult? Function(ItemSelectChanged value)? selectChanged,
  }) {
    return loadMoreStarted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ItemLoadStarted value)? loadStarted,
    TResult Function(ItemLoadMoreStarted value)? loadMoreStarted,
    TResult Function(ItemSelectChanged value)? selectChanged,
    required TResult orElse(),
  }) {
    if (loadMoreStarted != null) {
      return loadMoreStarted(this);
    }
    return orElse();
  }
}

abstract class ItemLoadMoreStarted implements ItemEvent {
  const factory ItemLoadMoreStarted() = _$ItemLoadMoreStartedImpl;
}

/// @nodoc
abstract class _$$ItemSelectChangedImplCopyWith<$Res> {
  factory _$$ItemSelectChangedImplCopyWith(_$ItemSelectChangedImpl value,
          $Res Function(_$ItemSelectChangedImpl) then) =
      __$$ItemSelectChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String itemId});
}

/// @nodoc
class __$$ItemSelectChangedImplCopyWithImpl<$Res>
    extends _$ItemEventCopyWithImpl<$Res, _$ItemSelectChangedImpl>
    implements _$$ItemSelectChangedImplCopyWith<$Res> {
  __$$ItemSelectChangedImplCopyWithImpl(_$ItemSelectChangedImpl _value,
      $Res Function(_$ItemSelectChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemId = null,
  }) {
    return _then(_$ItemSelectChangedImpl(
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ItemSelectChangedImpl
    with DiagnosticableTreeMixin
    implements ItemSelectChanged {
  const _$ItemSelectChangedImpl({required this.itemId});

  @override
  final String itemId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ItemEvent.selectChanged(itemId: $itemId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ItemEvent.selectChanged'))
      ..add(DiagnosticsProperty('itemId', itemId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemSelectChangedImpl &&
            (identical(other.itemId, itemId) || other.itemId == itemId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, itemId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemSelectChangedImplCopyWith<_$ItemSelectChangedImpl> get copyWith =>
      __$$ItemSelectChangedImplCopyWithImpl<_$ItemSelectChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool loadAll) loadStarted,
    required TResult Function() loadMoreStarted,
    required TResult Function(String itemId) selectChanged,
  }) {
    return selectChanged(itemId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool loadAll)? loadStarted,
    TResult? Function()? loadMoreStarted,
    TResult? Function(String itemId)? selectChanged,
  }) {
    return selectChanged?.call(itemId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool loadAll)? loadStarted,
    TResult Function()? loadMoreStarted,
    TResult Function(String itemId)? selectChanged,
    required TResult orElse(),
  }) {
    if (selectChanged != null) {
      return selectChanged(itemId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ItemLoadStarted value) loadStarted,
    required TResult Function(ItemLoadMoreStarted value) loadMoreStarted,
    required TResult Function(ItemSelectChanged value) selectChanged,
  }) {
    return selectChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ItemLoadStarted value)? loadStarted,
    TResult? Function(ItemLoadMoreStarted value)? loadMoreStarted,
    TResult? Function(ItemSelectChanged value)? selectChanged,
  }) {
    return selectChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ItemLoadStarted value)? loadStarted,
    TResult Function(ItemLoadMoreStarted value)? loadMoreStarted,
    TResult Function(ItemSelectChanged value)? selectChanged,
    required TResult orElse(),
  }) {
    if (selectChanged != null) {
      return selectChanged(this);
    }
    return orElse();
  }
}

abstract class ItemSelectChanged implements ItemEvent {
  const factory ItemSelectChanged({required final String itemId}) =
      _$ItemSelectChangedImpl;

  String get itemId;
  @JsonKey(ignore: true)
  _$$ItemSelectChangedImplCopyWith<_$ItemSelectChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
