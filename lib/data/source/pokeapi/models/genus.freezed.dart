// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'genus.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PokeApiGenus _$PokeApiGenusFromJson(Map<String, dynamic> json) {
  return _PokeApiGenus.fromJson(json);
}

/// @nodoc
mixin _$PokeApiGenus {
  @JsonKey(name: 'genus')
  String get genus => throw _privateConstructorUsedError;
  @JsonKey(name: 'language')
  PokeApiNamedApiResource get language => throw _privateConstructorUsedError;

  /// Serializes this PokeApiGenus to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokeApiGenus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokeApiGenusCopyWith<PokeApiGenus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokeApiGenusCopyWith<$Res> {
  factory $PokeApiGenusCopyWith(
          PokeApiGenus value, $Res Function(PokeApiGenus) then) =
      _$PokeApiGenusCopyWithImpl<$Res, PokeApiGenus>;
  @useResult
  $Res call(
      {@JsonKey(name: 'genus') String genus,
      @JsonKey(name: 'language') PokeApiNamedApiResource language});

  $PokeApiNamedApiResourceCopyWith<$Res> get language;
}

/// @nodoc
class _$PokeApiGenusCopyWithImpl<$Res, $Val extends PokeApiGenus>
    implements $PokeApiGenusCopyWith<$Res> {
  _$PokeApiGenusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokeApiGenus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? genus = null,
    Object? language = null,
  }) {
    return _then(_value.copyWith(
      genus: null == genus
          ? _value.genus
          : genus // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as PokeApiNamedApiResource,
    ) as $Val);
  }

  /// Create a copy of PokeApiGenus
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
abstract class _$$PokeApiGenusImplCopyWith<$Res>
    implements $PokeApiGenusCopyWith<$Res> {
  factory _$$PokeApiGenusImplCopyWith(
          _$PokeApiGenusImpl value, $Res Function(_$PokeApiGenusImpl) then) =
      __$$PokeApiGenusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'genus') String genus,
      @JsonKey(name: 'language') PokeApiNamedApiResource language});

  @override
  $PokeApiNamedApiResourceCopyWith<$Res> get language;
}

/// @nodoc
class __$$PokeApiGenusImplCopyWithImpl<$Res>
    extends _$PokeApiGenusCopyWithImpl<$Res, _$PokeApiGenusImpl>
    implements _$$PokeApiGenusImplCopyWith<$Res> {
  __$$PokeApiGenusImplCopyWithImpl(
      _$PokeApiGenusImpl _value, $Res Function(_$PokeApiGenusImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokeApiGenus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? genus = null,
    Object? language = null,
  }) {
    return _then(_$PokeApiGenusImpl(
      genus: null == genus
          ? _value.genus
          : genus // ignore: cast_nullable_to_non_nullable
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
class _$PokeApiGenusImpl with DiagnosticableTreeMixin implements _PokeApiGenus {
  const _$PokeApiGenusImpl(
      {@JsonKey(name: 'genus') required this.genus,
      @JsonKey(name: 'language') required this.language});

  factory _$PokeApiGenusImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokeApiGenusImplFromJson(json);

  @override
  @JsonKey(name: 'genus')
  final String genus;
  @override
  @JsonKey(name: 'language')
  final PokeApiNamedApiResource language;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PokeApiGenus(genus: $genus, language: $language)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PokeApiGenus'))
      ..add(DiagnosticsProperty('genus', genus))
      ..add(DiagnosticsProperty('language', language));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokeApiGenusImpl &&
            (identical(other.genus, genus) || other.genus == genus) &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, genus, language);

  /// Create a copy of PokeApiGenus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokeApiGenusImplCopyWith<_$PokeApiGenusImpl> get copyWith =>
      __$$PokeApiGenusImplCopyWithImpl<_$PokeApiGenusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokeApiGenusImplToJson(
      this,
    );
  }
}

abstract class _PokeApiGenus implements PokeApiGenus {
  const factory _PokeApiGenus(
      {@JsonKey(name: 'genus') required final String genus,
      @JsonKey(name: 'language')
      required final PokeApiNamedApiResource language}) = _$PokeApiGenusImpl;

  factory _PokeApiGenus.fromJson(Map<String, dynamic> json) =
      _$PokeApiGenusImpl.fromJson;

  @override
  @JsonKey(name: 'genus')
  String get genus;
  @override
  @JsonKey(name: 'language')
  PokeApiNamedApiResource get language;

  /// Create a copy of PokeApiGenus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokeApiGenusImplCopyWith<_$PokeApiGenusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
