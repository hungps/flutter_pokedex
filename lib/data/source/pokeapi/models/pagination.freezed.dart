// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PokeApiPagination _$PokeApiPaginationFromJson(Map<String, dynamic> json) {
  return _PokeApiPagination.fromJson(json);
}

/// @nodoc
mixin _$PokeApiPagination {
  @JsonKey(name: 'offset')
  int get offset => throw _privateConstructorUsedError;
  @JsonKey(name: 'limit')
  int get limit => throw _privateConstructorUsedError;

  /// Serializes this PokeApiPagination to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokeApiPagination
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokeApiPaginationCopyWith<PokeApiPagination> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokeApiPaginationCopyWith<$Res> {
  factory $PokeApiPaginationCopyWith(
          PokeApiPagination value, $Res Function(PokeApiPagination) then) =
      _$PokeApiPaginationCopyWithImpl<$Res, PokeApiPagination>;
  @useResult
  $Res call(
      {@JsonKey(name: 'offset') int offset, @JsonKey(name: 'limit') int limit});
}

/// @nodoc
class _$PokeApiPaginationCopyWithImpl<$Res, $Val extends PokeApiPagination>
    implements $PokeApiPaginationCopyWith<$Res> {
  _$PokeApiPaginationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokeApiPagination
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? offset = null,
    Object? limit = null,
  }) {
    return _then(_value.copyWith(
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PokeApiPaginationImplCopyWith<$Res>
    implements $PokeApiPaginationCopyWith<$Res> {
  factory _$$PokeApiPaginationImplCopyWith(_$PokeApiPaginationImpl value,
          $Res Function(_$PokeApiPaginationImpl) then) =
      __$$PokeApiPaginationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'offset') int offset, @JsonKey(name: 'limit') int limit});
}

/// @nodoc
class __$$PokeApiPaginationImplCopyWithImpl<$Res>
    extends _$PokeApiPaginationCopyWithImpl<$Res, _$PokeApiPaginationImpl>
    implements _$$PokeApiPaginationImplCopyWith<$Res> {
  __$$PokeApiPaginationImplCopyWithImpl(_$PokeApiPaginationImpl _value,
      $Res Function(_$PokeApiPaginationImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokeApiPagination
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? offset = null,
    Object? limit = null,
  }) {
    return _then(_$PokeApiPaginationImpl(
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokeApiPaginationImpl
    with DiagnosticableTreeMixin
    implements _PokeApiPagination {
  const _$PokeApiPaginationImpl(
      {@JsonKey(name: 'offset') required this.offset,
      @JsonKey(name: 'limit') required this.limit});

  factory _$PokeApiPaginationImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokeApiPaginationImplFromJson(json);

  @override
  @JsonKey(name: 'offset')
  final int offset;
  @override
  @JsonKey(name: 'limit')
  final int limit;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PokeApiPagination(offset: $offset, limit: $limit)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PokeApiPagination'))
      ..add(DiagnosticsProperty('offset', offset))
      ..add(DiagnosticsProperty('limit', limit));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokeApiPaginationImpl &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, offset, limit);

  /// Create a copy of PokeApiPagination
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokeApiPaginationImplCopyWith<_$PokeApiPaginationImpl> get copyWith =>
      __$$PokeApiPaginationImplCopyWithImpl<_$PokeApiPaginationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokeApiPaginationImplToJson(
      this,
    );
  }
}

abstract class _PokeApiPagination implements PokeApiPagination {
  const factory _PokeApiPagination(
          {@JsonKey(name: 'offset') required final int offset,
          @JsonKey(name: 'limit') required final int limit}) =
      _$PokeApiPaginationImpl;

  factory _PokeApiPagination.fromJson(Map<String, dynamic> json) =
      _$PokeApiPaginationImpl.fromJson;

  @override
  @JsonKey(name: 'offset')
  int get offset;
  @override
  @JsonKey(name: 'limit')
  int get limit;

  /// Create a copy of PokeApiPagination
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokeApiPaginationImplCopyWith<_$PokeApiPaginationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
