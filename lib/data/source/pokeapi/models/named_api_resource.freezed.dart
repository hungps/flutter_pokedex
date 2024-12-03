// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'named_api_resource.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PokeApiNamedApiResource _$PokeApiNamedApiResourceFromJson(
    Map<String, dynamic> json) {
  return _PokeApiNamedApiResource.fromJson(json);
}

/// @nodoc
mixin _$PokeApiNamedApiResource {
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'url')
  String get url => throw _privateConstructorUsedError;

  /// Serializes this PokeApiNamedApiResource to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokeApiNamedApiResource
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokeApiNamedApiResourceCopyWith<PokeApiNamedApiResource> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokeApiNamedApiResourceCopyWith<$Res> {
  factory $PokeApiNamedApiResourceCopyWith(PokeApiNamedApiResource value,
          $Res Function(PokeApiNamedApiResource) then) =
      _$PokeApiNamedApiResourceCopyWithImpl<$Res, PokeApiNamedApiResource>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String name, @JsonKey(name: 'url') String url});
}

/// @nodoc
class _$PokeApiNamedApiResourceCopyWithImpl<$Res,
        $Val extends PokeApiNamedApiResource>
    implements $PokeApiNamedApiResourceCopyWith<$Res> {
  _$PokeApiNamedApiResourceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokeApiNamedApiResource
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PokeApiNamedApiResourceImplCopyWith<$Res>
    implements $PokeApiNamedApiResourceCopyWith<$Res> {
  factory _$$PokeApiNamedApiResourceImplCopyWith(
          _$PokeApiNamedApiResourceImpl value,
          $Res Function(_$PokeApiNamedApiResourceImpl) then) =
      __$$PokeApiNamedApiResourceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String name, @JsonKey(name: 'url') String url});
}

/// @nodoc
class __$$PokeApiNamedApiResourceImplCopyWithImpl<$Res>
    extends _$PokeApiNamedApiResourceCopyWithImpl<$Res,
        _$PokeApiNamedApiResourceImpl>
    implements _$$PokeApiNamedApiResourceImplCopyWith<$Res> {
  __$$PokeApiNamedApiResourceImplCopyWithImpl(
      _$PokeApiNamedApiResourceImpl _value,
      $Res Function(_$PokeApiNamedApiResourceImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokeApiNamedApiResource
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_$PokeApiNamedApiResourceImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokeApiNamedApiResourceImpl
    with DiagnosticableTreeMixin
    implements _PokeApiNamedApiResource {
  const _$PokeApiNamedApiResourceImpl(
      {@JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'url') required this.url});

  factory _$PokeApiNamedApiResourceImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokeApiNamedApiResourceImplFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'url')
  final String url;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PokeApiNamedApiResource(name: $name, url: $url)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PokeApiNamedApiResource'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('url', url));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokeApiNamedApiResourceImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, url);

  /// Create a copy of PokeApiNamedApiResource
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokeApiNamedApiResourceImplCopyWith<_$PokeApiNamedApiResourceImpl>
      get copyWith => __$$PokeApiNamedApiResourceImplCopyWithImpl<
          _$PokeApiNamedApiResourceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokeApiNamedApiResourceImplToJson(
      this,
    );
  }
}

abstract class _PokeApiNamedApiResource implements PokeApiNamedApiResource {
  const factory _PokeApiNamedApiResource(
          {@JsonKey(name: 'name') required final String name,
          @JsonKey(name: 'url') required final String url}) =
      _$PokeApiNamedApiResourceImpl;

  factory _PokeApiNamedApiResource.fromJson(Map<String, dynamic> json) =
      _$PokeApiNamedApiResourceImpl.fromJson;

  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'url')
  String get url;

  /// Create a copy of PokeApiNamedApiResource
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokeApiNamedApiResourceImplCopyWith<_$PokeApiNamedApiResourceImpl>
      get copyWith => throw _privateConstructorUsedError;
}
