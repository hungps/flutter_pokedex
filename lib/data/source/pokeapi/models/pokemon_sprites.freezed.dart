// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_sprites.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PokeApiPokemonSprites _$PokeApiPokemonSpritesFromJson(
    Map<String, dynamic> json) {
  return _PokeApiPokemonSprites.fromJson(json);
}

/// @nodoc
mixin _$PokeApiPokemonSprites {
  @JsonKey(name: 'other')
  PokeApiPokemonSpritesOther get other => throw _privateConstructorUsedError;

  /// Serializes this PokeApiPokemonSprites to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokeApiPokemonSprites
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokeApiPokemonSpritesCopyWith<PokeApiPokemonSprites> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokeApiPokemonSpritesCopyWith<$Res> {
  factory $PokeApiPokemonSpritesCopyWith(PokeApiPokemonSprites value,
          $Res Function(PokeApiPokemonSprites) then) =
      _$PokeApiPokemonSpritesCopyWithImpl<$Res, PokeApiPokemonSprites>;
  @useResult
  $Res call({@JsonKey(name: 'other') PokeApiPokemonSpritesOther other});

  $PokeApiPokemonSpritesOtherCopyWith<$Res> get other;
}

/// @nodoc
class _$PokeApiPokemonSpritesCopyWithImpl<$Res,
        $Val extends PokeApiPokemonSprites>
    implements $PokeApiPokemonSpritesCopyWith<$Res> {
  _$PokeApiPokemonSpritesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokeApiPokemonSprites
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? other = null,
  }) {
    return _then(_value.copyWith(
      other: null == other
          ? _value.other
          : other // ignore: cast_nullable_to_non_nullable
              as PokeApiPokemonSpritesOther,
    ) as $Val);
  }

  /// Create a copy of PokeApiPokemonSprites
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PokeApiPokemonSpritesOtherCopyWith<$Res> get other {
    return $PokeApiPokemonSpritesOtherCopyWith<$Res>(_value.other, (value) {
      return _then(_value.copyWith(other: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PokeApiPokemonSpritesImplCopyWith<$Res>
    implements $PokeApiPokemonSpritesCopyWith<$Res> {
  factory _$$PokeApiPokemonSpritesImplCopyWith(
          _$PokeApiPokemonSpritesImpl value,
          $Res Function(_$PokeApiPokemonSpritesImpl) then) =
      __$$PokeApiPokemonSpritesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'other') PokeApiPokemonSpritesOther other});

  @override
  $PokeApiPokemonSpritesOtherCopyWith<$Res> get other;
}

/// @nodoc
class __$$PokeApiPokemonSpritesImplCopyWithImpl<$Res>
    extends _$PokeApiPokemonSpritesCopyWithImpl<$Res,
        _$PokeApiPokemonSpritesImpl>
    implements _$$PokeApiPokemonSpritesImplCopyWith<$Res> {
  __$$PokeApiPokemonSpritesImplCopyWithImpl(_$PokeApiPokemonSpritesImpl _value,
      $Res Function(_$PokeApiPokemonSpritesImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokeApiPokemonSprites
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? other = null,
  }) {
    return _then(_$PokeApiPokemonSpritesImpl(
      other: null == other
          ? _value.other
          : other // ignore: cast_nullable_to_non_nullable
              as PokeApiPokemonSpritesOther,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokeApiPokemonSpritesImpl
    with DiagnosticableTreeMixin
    implements _PokeApiPokemonSprites {
  const _$PokeApiPokemonSpritesImpl(
      {@JsonKey(name: 'other') required this.other});

  factory _$PokeApiPokemonSpritesImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokeApiPokemonSpritesImplFromJson(json);

  @override
  @JsonKey(name: 'other')
  final PokeApiPokemonSpritesOther other;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PokeApiPokemonSprites(other: $other)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PokeApiPokemonSprites'))
      ..add(DiagnosticsProperty('other', other));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokeApiPokemonSpritesImpl &&
            (identical(other.other, this.other) || other.other == this.other));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, other);

  /// Create a copy of PokeApiPokemonSprites
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokeApiPokemonSpritesImplCopyWith<_$PokeApiPokemonSpritesImpl>
      get copyWith => __$$PokeApiPokemonSpritesImplCopyWithImpl<
          _$PokeApiPokemonSpritesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokeApiPokemonSpritesImplToJson(
      this,
    );
  }
}

abstract class _PokeApiPokemonSprites implements PokeApiPokemonSprites {
  const factory _PokeApiPokemonSprites(
          {@JsonKey(name: 'other')
          required final PokeApiPokemonSpritesOther other}) =
      _$PokeApiPokemonSpritesImpl;

  factory _PokeApiPokemonSprites.fromJson(Map<String, dynamic> json) =
      _$PokeApiPokemonSpritesImpl.fromJson;

  @override
  @JsonKey(name: 'other')
  PokeApiPokemonSpritesOther get other;

  /// Create a copy of PokeApiPokemonSprites
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokeApiPokemonSpritesImplCopyWith<_$PokeApiPokemonSpritesImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PokeApiPokemonSpritesOther _$PokeApiPokemonSpritesOtherFromJson(
    Map<String, dynamic> json) {
  return _PokeApiPokemonSpritesOther.fromJson(json);
}

/// @nodoc
mixin _$PokeApiPokemonSpritesOther {
  @JsonKey(name: 'official-artwork')
  PokeApiPokemonSpritesOtherOfficialArtwork get officialArtwork =>
      throw _privateConstructorUsedError;

  /// Serializes this PokeApiPokemonSpritesOther to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokeApiPokemonSpritesOther
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokeApiPokemonSpritesOtherCopyWith<PokeApiPokemonSpritesOther>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokeApiPokemonSpritesOtherCopyWith<$Res> {
  factory $PokeApiPokemonSpritesOtherCopyWith(PokeApiPokemonSpritesOther value,
          $Res Function(PokeApiPokemonSpritesOther) then) =
      _$PokeApiPokemonSpritesOtherCopyWithImpl<$Res,
          PokeApiPokemonSpritesOther>;
  @useResult
  $Res call(
      {@JsonKey(name: 'official-artwork')
      PokeApiPokemonSpritesOtherOfficialArtwork officialArtwork});

  $PokeApiPokemonSpritesOtherOfficialArtworkCopyWith<$Res> get officialArtwork;
}

/// @nodoc
class _$PokeApiPokemonSpritesOtherCopyWithImpl<$Res,
        $Val extends PokeApiPokemonSpritesOther>
    implements $PokeApiPokemonSpritesOtherCopyWith<$Res> {
  _$PokeApiPokemonSpritesOtherCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokeApiPokemonSpritesOther
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? officialArtwork = null,
  }) {
    return _then(_value.copyWith(
      officialArtwork: null == officialArtwork
          ? _value.officialArtwork
          : officialArtwork // ignore: cast_nullable_to_non_nullable
              as PokeApiPokemonSpritesOtherOfficialArtwork,
    ) as $Val);
  }

  /// Create a copy of PokeApiPokemonSpritesOther
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PokeApiPokemonSpritesOtherOfficialArtworkCopyWith<$Res> get officialArtwork {
    return $PokeApiPokemonSpritesOtherOfficialArtworkCopyWith<$Res>(
        _value.officialArtwork, (value) {
      return _then(_value.copyWith(officialArtwork: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PokeApiPokemonSpritesOtherImplCopyWith<$Res>
    implements $PokeApiPokemonSpritesOtherCopyWith<$Res> {
  factory _$$PokeApiPokemonSpritesOtherImplCopyWith(
          _$PokeApiPokemonSpritesOtherImpl value,
          $Res Function(_$PokeApiPokemonSpritesOtherImpl) then) =
      __$$PokeApiPokemonSpritesOtherImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'official-artwork')
      PokeApiPokemonSpritesOtherOfficialArtwork officialArtwork});

  @override
  $PokeApiPokemonSpritesOtherOfficialArtworkCopyWith<$Res> get officialArtwork;
}

/// @nodoc
class __$$PokeApiPokemonSpritesOtherImplCopyWithImpl<$Res>
    extends _$PokeApiPokemonSpritesOtherCopyWithImpl<$Res,
        _$PokeApiPokemonSpritesOtherImpl>
    implements _$$PokeApiPokemonSpritesOtherImplCopyWith<$Res> {
  __$$PokeApiPokemonSpritesOtherImplCopyWithImpl(
      _$PokeApiPokemonSpritesOtherImpl _value,
      $Res Function(_$PokeApiPokemonSpritesOtherImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokeApiPokemonSpritesOther
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? officialArtwork = null,
  }) {
    return _then(_$PokeApiPokemonSpritesOtherImpl(
      officialArtwork: null == officialArtwork
          ? _value.officialArtwork
          : officialArtwork // ignore: cast_nullable_to_non_nullable
              as PokeApiPokemonSpritesOtherOfficialArtwork,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokeApiPokemonSpritesOtherImpl
    with DiagnosticableTreeMixin
    implements _PokeApiPokemonSpritesOther {
  const _$PokeApiPokemonSpritesOtherImpl(
      {@JsonKey(name: 'official-artwork') required this.officialArtwork});

  factory _$PokeApiPokemonSpritesOtherImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$PokeApiPokemonSpritesOtherImplFromJson(json);

  @override
  @JsonKey(name: 'official-artwork')
  final PokeApiPokemonSpritesOtherOfficialArtwork officialArtwork;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PokeApiPokemonSpritesOther(officialArtwork: $officialArtwork)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PokeApiPokemonSpritesOther'))
      ..add(DiagnosticsProperty('officialArtwork', officialArtwork));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokeApiPokemonSpritesOtherImpl &&
            (identical(other.officialArtwork, officialArtwork) ||
                other.officialArtwork == officialArtwork));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, officialArtwork);

  /// Create a copy of PokeApiPokemonSpritesOther
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokeApiPokemonSpritesOtherImplCopyWith<_$PokeApiPokemonSpritesOtherImpl>
      get copyWith => __$$PokeApiPokemonSpritesOtherImplCopyWithImpl<
          _$PokeApiPokemonSpritesOtherImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokeApiPokemonSpritesOtherImplToJson(
      this,
    );
  }
}

abstract class _PokeApiPokemonSpritesOther
    implements PokeApiPokemonSpritesOther {
  const factory _PokeApiPokemonSpritesOther(
      {@JsonKey(name: 'official-artwork')
      required final PokeApiPokemonSpritesOtherOfficialArtwork
          officialArtwork}) = _$PokeApiPokemonSpritesOtherImpl;

  factory _PokeApiPokemonSpritesOther.fromJson(Map<String, dynamic> json) =
      _$PokeApiPokemonSpritesOtherImpl.fromJson;

  @override
  @JsonKey(name: 'official-artwork')
  PokeApiPokemonSpritesOtherOfficialArtwork get officialArtwork;

  /// Create a copy of PokeApiPokemonSpritesOther
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokeApiPokemonSpritesOtherImplCopyWith<_$PokeApiPokemonSpritesOtherImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PokeApiPokemonSpritesOtherOfficialArtwork
    _$PokeApiPokemonSpritesOtherOfficialArtworkFromJson(
        Map<String, dynamic> json) {
  return _PokeApiPokemonSpritesOtherOfficialArtwork.fromJson(json);
}

/// @nodoc
mixin _$PokeApiPokemonSpritesOtherOfficialArtwork {
  @JsonKey(name: 'front_default')
  String get frontDefault => throw _privateConstructorUsedError;

  /// Serializes this PokeApiPokemonSpritesOtherOfficialArtwork to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokeApiPokemonSpritesOtherOfficialArtwork
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokeApiPokemonSpritesOtherOfficialArtworkCopyWith<
          PokeApiPokemonSpritesOtherOfficialArtwork>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokeApiPokemonSpritesOtherOfficialArtworkCopyWith<$Res> {
  factory $PokeApiPokemonSpritesOtherOfficialArtworkCopyWith(
          PokeApiPokemonSpritesOtherOfficialArtwork value,
          $Res Function(PokeApiPokemonSpritesOtherOfficialArtwork) then) =
      _$PokeApiPokemonSpritesOtherOfficialArtworkCopyWithImpl<$Res,
          PokeApiPokemonSpritesOtherOfficialArtwork>;
  @useResult
  $Res call({@JsonKey(name: 'front_default') String frontDefault});
}

/// @nodoc
class _$PokeApiPokemonSpritesOtherOfficialArtworkCopyWithImpl<$Res,
        $Val extends PokeApiPokemonSpritesOtherOfficialArtwork>
    implements $PokeApiPokemonSpritesOtherOfficialArtworkCopyWith<$Res> {
  _$PokeApiPokemonSpritesOtherOfficialArtworkCopyWithImpl(
      this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokeApiPokemonSpritesOtherOfficialArtwork
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? frontDefault = null,
  }) {
    return _then(_value.copyWith(
      frontDefault: null == frontDefault
          ? _value.frontDefault
          : frontDefault // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PokeApiPokemonSpritesOtherOfficialArtworkImplCopyWith<$Res>
    implements $PokeApiPokemonSpritesOtherOfficialArtworkCopyWith<$Res> {
  factory _$$PokeApiPokemonSpritesOtherOfficialArtworkImplCopyWith(
          _$PokeApiPokemonSpritesOtherOfficialArtworkImpl value,
          $Res Function(_$PokeApiPokemonSpritesOtherOfficialArtworkImpl) then) =
      __$$PokeApiPokemonSpritesOtherOfficialArtworkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'front_default') String frontDefault});
}

/// @nodoc
class __$$PokeApiPokemonSpritesOtherOfficialArtworkImplCopyWithImpl<$Res>
    extends _$PokeApiPokemonSpritesOtherOfficialArtworkCopyWithImpl<$Res,
        _$PokeApiPokemonSpritesOtherOfficialArtworkImpl>
    implements _$$PokeApiPokemonSpritesOtherOfficialArtworkImplCopyWith<$Res> {
  __$$PokeApiPokemonSpritesOtherOfficialArtworkImplCopyWithImpl(
      _$PokeApiPokemonSpritesOtherOfficialArtworkImpl _value,
      $Res Function(_$PokeApiPokemonSpritesOtherOfficialArtworkImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokeApiPokemonSpritesOtherOfficialArtwork
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? frontDefault = null,
  }) {
    return _then(_$PokeApiPokemonSpritesOtherOfficialArtworkImpl(
      frontDefault: null == frontDefault
          ? _value.frontDefault
          : frontDefault // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokeApiPokemonSpritesOtherOfficialArtworkImpl
    with DiagnosticableTreeMixin
    implements _PokeApiPokemonSpritesOtherOfficialArtwork {
  const _$PokeApiPokemonSpritesOtherOfficialArtworkImpl(
      {@JsonKey(name: 'front_default') required this.frontDefault});

  factory _$PokeApiPokemonSpritesOtherOfficialArtworkImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$PokeApiPokemonSpritesOtherOfficialArtworkImplFromJson(json);

  @override
  @JsonKey(name: 'front_default')
  final String frontDefault;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PokeApiPokemonSpritesOtherOfficialArtwork(frontDefault: $frontDefault)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'PokeApiPokemonSpritesOtherOfficialArtwork'))
      ..add(DiagnosticsProperty('frontDefault', frontDefault));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokeApiPokemonSpritesOtherOfficialArtworkImpl &&
            (identical(other.frontDefault, frontDefault) ||
                other.frontDefault == frontDefault));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, frontDefault);

  /// Create a copy of PokeApiPokemonSpritesOtherOfficialArtwork
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokeApiPokemonSpritesOtherOfficialArtworkImplCopyWith<
          _$PokeApiPokemonSpritesOtherOfficialArtworkImpl>
      get copyWith =>
          __$$PokeApiPokemonSpritesOtherOfficialArtworkImplCopyWithImpl<
                  _$PokeApiPokemonSpritesOtherOfficialArtworkImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokeApiPokemonSpritesOtherOfficialArtworkImplToJson(
      this,
    );
  }
}

abstract class _PokeApiPokemonSpritesOtherOfficialArtwork
    implements PokeApiPokemonSpritesOtherOfficialArtwork {
  const factory _PokeApiPokemonSpritesOtherOfficialArtwork(
          {@JsonKey(name: 'front_default')
          required final String frontDefault}) =
      _$PokeApiPokemonSpritesOtherOfficialArtworkImpl;

  factory _PokeApiPokemonSpritesOtherOfficialArtwork.fromJson(
          Map<String, dynamic> json) =
      _$PokeApiPokemonSpritesOtherOfficialArtworkImpl.fromJson;

  @override
  @JsonKey(name: 'front_default')
  String get frontDefault;

  /// Create a copy of PokeApiPokemonSpritesOtherOfficialArtwork
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokeApiPokemonSpritesOtherOfficialArtworkImplCopyWith<
          _$PokeApiPokemonSpritesOtherOfficialArtworkImpl>
      get copyWith => throw _privateConstructorUsedError;
}
