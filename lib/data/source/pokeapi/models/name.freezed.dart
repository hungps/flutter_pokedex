// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'name.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PokeApiName _$PokeApiNameFromJson(Map<String, dynamic> json) {
  return _PokeApiName.fromJson(json);
}

/// @nodoc
mixin _$PokeApiName {
  String get name => throw _privateConstructorUsedError;
  PokeApiNamedApiResource get language => throw _privateConstructorUsedError;

  /// Serializes this PokeApiName to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokeApiName
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokeApiNameCopyWith<PokeApiName> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokeApiNameCopyWith<$Res> {
  factory $PokeApiNameCopyWith(
          PokeApiName value, $Res Function(PokeApiName) then) =
      _$PokeApiNameCopyWithImpl<$Res, PokeApiName>;
  @useResult
  $Res call({String name, PokeApiNamedApiResource language});

  $PokeApiNamedApiResourceCopyWith<$Res> get language;
}

/// @nodoc
class _$PokeApiNameCopyWithImpl<$Res, $Val extends PokeApiName>
    implements $PokeApiNameCopyWith<$Res> {
  _$PokeApiNameCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokeApiName
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? language = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as PokeApiNamedApiResource,
    ) as $Val);
  }

  /// Create a copy of PokeApiName
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PokeApiNamedApiResourceCopyWith<$Res> get language {
    return $PokeApiNamedApiResourceCopyWith<$Res>(_value.language, (value) {
      return _then(_value.copyWith(language: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PokeApiNameImplCopyWith<$Res>
    implements $PokeApiNameCopyWith<$Res> {
  factory _$$PokeApiNameImplCopyWith(
          _$PokeApiNameImpl value, $Res Function(_$PokeApiNameImpl) then) =
      __$$PokeApiNameImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, PokeApiNamedApiResource language});

  @override
  $PokeApiNamedApiResourceCopyWith<$Res> get language;
}

/// @nodoc
class __$$PokeApiNameImplCopyWithImpl<$Res>
    extends _$PokeApiNameCopyWithImpl<$Res, _$PokeApiNameImpl>
    implements _$$PokeApiNameImplCopyWith<$Res> {
  __$$PokeApiNameImplCopyWithImpl(
      _$PokeApiNameImpl _value, $Res Function(_$PokeApiNameImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokeApiName
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? language = null,
  }) {
    return _then(_$PokeApiNameImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as PokeApiNamedApiResource,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokeApiNameImpl with DiagnosticableTreeMixin implements _PokeApiName {
  const _$PokeApiNameImpl({required this.name, required this.language});

  factory _$PokeApiNameImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokeApiNameImplFromJson(json);

  @override
  final String name;
  @override
  final PokeApiNamedApiResource language;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PokeApiName(name: $name, language: $language)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PokeApiName'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('language', language));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokeApiNameImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, language);

  /// Create a copy of PokeApiName
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokeApiNameImplCopyWith<_$PokeApiNameImpl> get copyWith =>
      __$$PokeApiNameImplCopyWithImpl<_$PokeApiNameImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokeApiNameImplToJson(
      this,
    );
  }
}

abstract class _PokeApiName implements PokeApiName {
  const factory _PokeApiName(
      {required final String name,
      required final PokeApiNamedApiResource language}) = _$PokeApiNameImpl;

  factory _PokeApiName.fromJson(Map<String, dynamic> json) =
      _$PokeApiNameImpl.fromJson;

  @override
  String get name;
  @override
  PokeApiNamedApiResource get language;

  /// Create a copy of PokeApiName
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokeApiNameImplCopyWith<_$PokeApiNameImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
