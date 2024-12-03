// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'named_api_resource_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PokeApiNamedApiResourceList _$PokeApiNamedApiResourceListFromJson(
    Map<String, dynamic> json) {
  return _PokeApiNamedApiResourceList.fromJson(json);
}

/// @nodoc
mixin _$PokeApiNamedApiResourceList {
  @JsonKey(name: 'count')
  int get count => throw _privateConstructorUsedError;
  @JsonKey(name: 'next')
  String? get next => throw _privateConstructorUsedError;
  @JsonKey(name: 'previous')
  String? get previous => throw _privateConstructorUsedError;
  @JsonKey(name: 'results')
  List<PokeApiNamedApiResource> get results =>
      throw _privateConstructorUsedError;

  /// Serializes this PokeApiNamedApiResourceList to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokeApiNamedApiResourceList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokeApiNamedApiResourceListCopyWith<PokeApiNamedApiResourceList>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokeApiNamedApiResourceListCopyWith<$Res> {
  factory $PokeApiNamedApiResourceListCopyWith(
          PokeApiNamedApiResourceList value,
          $Res Function(PokeApiNamedApiResourceList) then) =
      _$PokeApiNamedApiResourceListCopyWithImpl<$Res,
          PokeApiNamedApiResourceList>;
  @useResult
  $Res call(
      {@JsonKey(name: 'count') int count,
      @JsonKey(name: 'next') String? next,
      @JsonKey(name: 'previous') String? previous,
      @JsonKey(name: 'results') List<PokeApiNamedApiResource> results});
}

/// @nodoc
class _$PokeApiNamedApiResourceListCopyWithImpl<$Res,
        $Val extends PokeApiNamedApiResourceList>
    implements $PokeApiNamedApiResourceListCopyWith<$Res> {
  _$PokeApiNamedApiResourceListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokeApiNamedApiResourceList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = null,
  }) {
    return _then(_value.copyWith(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<PokeApiNamedApiResource>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PokeApiNamedApiResourceListImplCopyWith<$Res>
    implements $PokeApiNamedApiResourceListCopyWith<$Res> {
  factory _$$PokeApiNamedApiResourceListImplCopyWith(
          _$PokeApiNamedApiResourceListImpl value,
          $Res Function(_$PokeApiNamedApiResourceListImpl) then) =
      __$$PokeApiNamedApiResourceListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'count') int count,
      @JsonKey(name: 'next') String? next,
      @JsonKey(name: 'previous') String? previous,
      @JsonKey(name: 'results') List<PokeApiNamedApiResource> results});
}

/// @nodoc
class __$$PokeApiNamedApiResourceListImplCopyWithImpl<$Res>
    extends _$PokeApiNamedApiResourceListCopyWithImpl<$Res,
        _$PokeApiNamedApiResourceListImpl>
    implements _$$PokeApiNamedApiResourceListImplCopyWith<$Res> {
  __$$PokeApiNamedApiResourceListImplCopyWithImpl(
      _$PokeApiNamedApiResourceListImpl _value,
      $Res Function(_$PokeApiNamedApiResourceListImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokeApiNamedApiResourceList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = null,
  }) {
    return _then(_$PokeApiNamedApiResourceListImpl(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<PokeApiNamedApiResource>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokeApiNamedApiResourceListImpl
    with DiagnosticableTreeMixin
    implements _PokeApiNamedApiResourceList {
  const _$PokeApiNamedApiResourceListImpl(
      {@JsonKey(name: 'count') required this.count,
      @JsonKey(name: 'next') required this.next,
      @JsonKey(name: 'previous') required this.previous,
      @JsonKey(name: 'results')
      required final List<PokeApiNamedApiResource> results})
      : _results = results;

  factory _$PokeApiNamedApiResourceListImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$PokeApiNamedApiResourceListImplFromJson(json);

  @override
  @JsonKey(name: 'count')
  final int count;
  @override
  @JsonKey(name: 'next')
  final String? next;
  @override
  @JsonKey(name: 'previous')
  final String? previous;
  final List<PokeApiNamedApiResource> _results;
  @override
  @JsonKey(name: 'results')
  List<PokeApiNamedApiResource> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PokeApiNamedApiResourceList(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PokeApiNamedApiResourceList'))
      ..add(DiagnosticsProperty('count', count))
      ..add(DiagnosticsProperty('next', next))
      ..add(DiagnosticsProperty('previous', previous))
      ..add(DiagnosticsProperty('results', results));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokeApiNamedApiResourceListImpl &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.previous, previous) ||
                other.previous == previous) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, count, next, previous,
      const DeepCollectionEquality().hash(_results));

  /// Create a copy of PokeApiNamedApiResourceList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokeApiNamedApiResourceListImplCopyWith<_$PokeApiNamedApiResourceListImpl>
      get copyWith => __$$PokeApiNamedApiResourceListImplCopyWithImpl<
          _$PokeApiNamedApiResourceListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokeApiNamedApiResourceListImplToJson(
      this,
    );
  }
}

abstract class _PokeApiNamedApiResourceList
    implements PokeApiNamedApiResourceList {
  const factory _PokeApiNamedApiResourceList(
          {@JsonKey(name: 'count') required final int count,
          @JsonKey(name: 'next') required final String? next,
          @JsonKey(name: 'previous') required final String? previous,
          @JsonKey(name: 'results')
          required final List<PokeApiNamedApiResource> results}) =
      _$PokeApiNamedApiResourceListImpl;

  factory _PokeApiNamedApiResourceList.fromJson(Map<String, dynamic> json) =
      _$PokeApiNamedApiResourceListImpl.fromJson;

  @override
  @JsonKey(name: 'count')
  int get count;
  @override
  @JsonKey(name: 'next')
  String? get next;
  @override
  @JsonKey(name: 'previous')
  String? get previous;
  @override
  @JsonKey(name: 'results')
  List<PokeApiNamedApiResource> get results;

  /// Create a copy of PokeApiNamedApiResourceList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokeApiNamedApiResourceListImplCopyWith<_$PokeApiNamedApiResourceListImpl>
      get copyWith => throw _privateConstructorUsedError;
}
