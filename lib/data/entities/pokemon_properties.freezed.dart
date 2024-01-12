// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_properties.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PokemonGender _$PokemonGenderFromJson(Map<String, dynamic> json) {
  return _PokemonGender.fromJson(json);
}

/// @nodoc
mixin _$PokemonGender {
  bool get genderless => throw _privateConstructorUsedError;
  double get maleRate => throw _privateConstructorUsedError;
  double get femaleRate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PokemonGenderCopyWith<PokemonGender> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonGenderCopyWith<$Res> {
  factory $PokemonGenderCopyWith(
          PokemonGender value, $Res Function(PokemonGender) then) =
      _$PokemonGenderCopyWithImpl<$Res, PokemonGender>;
  @useResult
  $Res call({bool genderless, double maleRate, double femaleRate});
}

/// @nodoc
class _$PokemonGenderCopyWithImpl<$Res, $Val extends PokemonGender>
    implements $PokemonGenderCopyWith<$Res> {
  _$PokemonGenderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? genderless = null,
    Object? maleRate = null,
    Object? femaleRate = null,
  }) {
    return _then(_value.copyWith(
      genderless: null == genderless
          ? _value.genderless
          : genderless // ignore: cast_nullable_to_non_nullable
              as bool,
      maleRate: null == maleRate
          ? _value.maleRate
          : maleRate // ignore: cast_nullable_to_non_nullable
              as double,
      femaleRate: null == femaleRate
          ? _value.femaleRate
          : femaleRate // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PokemonGenderImplCopyWith<$Res>
    implements $PokemonGenderCopyWith<$Res> {
  factory _$$PokemonGenderImplCopyWith(
          _$PokemonGenderImpl value, $Res Function(_$PokemonGenderImpl) then) =
      __$$PokemonGenderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool genderless, double maleRate, double femaleRate});
}

/// @nodoc
class __$$PokemonGenderImplCopyWithImpl<$Res>
    extends _$PokemonGenderCopyWithImpl<$Res, _$PokemonGenderImpl>
    implements _$$PokemonGenderImplCopyWith<$Res> {
  __$$PokemonGenderImplCopyWithImpl(
      _$PokemonGenderImpl _value, $Res Function(_$PokemonGenderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? genderless = null,
    Object? maleRate = null,
    Object? femaleRate = null,
  }) {
    return _then(_$PokemonGenderImpl(
      genderless: null == genderless
          ? _value.genderless
          : genderless // ignore: cast_nullable_to_non_nullable
              as bool,
      maleRate: null == maleRate
          ? _value.maleRate
          : maleRate // ignore: cast_nullable_to_non_nullable
              as double,
      femaleRate: null == femaleRate
          ? _value.femaleRate
          : femaleRate // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonGenderImpl
    with DiagnosticableTreeMixin
    implements _PokemonGender {
  const _$PokemonGenderImpl(
      {required this.genderless,
      required this.maleRate,
      required this.femaleRate});

  factory _$PokemonGenderImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonGenderImplFromJson(json);

  @override
  final bool genderless;
  @override
  final double maleRate;
  @override
  final double femaleRate;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PokemonGender(genderless: $genderless, maleRate: $maleRate, femaleRate: $femaleRate)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PokemonGender'))
      ..add(DiagnosticsProperty('genderless', genderless))
      ..add(DiagnosticsProperty('maleRate', maleRate))
      ..add(DiagnosticsProperty('femaleRate', femaleRate));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonGenderImpl &&
            (identical(other.genderless, genderless) ||
                other.genderless == genderless) &&
            (identical(other.maleRate, maleRate) ||
                other.maleRate == maleRate) &&
            (identical(other.femaleRate, femaleRate) ||
                other.femaleRate == femaleRate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, genderless, maleRate, femaleRate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonGenderImplCopyWith<_$PokemonGenderImpl> get copyWith =>
      __$$PokemonGenderImplCopyWithImpl<_$PokemonGenderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonGenderImplToJson(
      this,
    );
  }
}

abstract class _PokemonGender implements PokemonGender {
  const factory _PokemonGender(
      {required final bool genderless,
      required final double maleRate,
      required final double femaleRate}) = _$PokemonGenderImpl;

  factory _PokemonGender.fromJson(Map<String, dynamic> json) =
      _$PokemonGenderImpl.fromJson;

  @override
  bool get genderless;
  @override
  double get maleRate;
  @override
  double get femaleRate;
  @override
  @JsonKey(ignore: true)
  _$$PokemonGenderImplCopyWith<_$PokemonGenderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PokemonStats _$PokemonStatsFromJson(Map<String, dynamic> json) {
  return _PokemonStats.fromJson(json);
}

/// @nodoc
mixin _$PokemonStats {
  int get attack => throw _privateConstructorUsedError;
  int get specialAttack => throw _privateConstructorUsedError;
  int get defense => throw _privateConstructorUsedError;
  int get specialDefense => throw _privateConstructorUsedError;
  int get hp => throw _privateConstructorUsedError;
  int get speed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PokemonStatsCopyWith<PokemonStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonStatsCopyWith<$Res> {
  factory $PokemonStatsCopyWith(
          PokemonStats value, $Res Function(PokemonStats) then) =
      _$PokemonStatsCopyWithImpl<$Res, PokemonStats>;
  @useResult
  $Res call(
      {int attack,
      int specialAttack,
      int defense,
      int specialDefense,
      int hp,
      int speed});
}

/// @nodoc
class _$PokemonStatsCopyWithImpl<$Res, $Val extends PokemonStats>
    implements $PokemonStatsCopyWith<$Res> {
  _$PokemonStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attack = null,
    Object? specialAttack = null,
    Object? defense = null,
    Object? specialDefense = null,
    Object? hp = null,
    Object? speed = null,
  }) {
    return _then(_value.copyWith(
      attack: null == attack
          ? _value.attack
          : attack // ignore: cast_nullable_to_non_nullable
              as int,
      specialAttack: null == specialAttack
          ? _value.specialAttack
          : specialAttack // ignore: cast_nullable_to_non_nullable
              as int,
      defense: null == defense
          ? _value.defense
          : defense // ignore: cast_nullable_to_non_nullable
              as int,
      specialDefense: null == specialDefense
          ? _value.specialDefense
          : specialDefense // ignore: cast_nullable_to_non_nullable
              as int,
      hp: null == hp
          ? _value.hp
          : hp // ignore: cast_nullable_to_non_nullable
              as int,
      speed: null == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PokemonStatsImplCopyWith<$Res>
    implements $PokemonStatsCopyWith<$Res> {
  factory _$$PokemonStatsImplCopyWith(
          _$PokemonStatsImpl value, $Res Function(_$PokemonStatsImpl) then) =
      __$$PokemonStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int attack,
      int specialAttack,
      int defense,
      int specialDefense,
      int hp,
      int speed});
}

/// @nodoc
class __$$PokemonStatsImplCopyWithImpl<$Res>
    extends _$PokemonStatsCopyWithImpl<$Res, _$PokemonStatsImpl>
    implements _$$PokemonStatsImplCopyWith<$Res> {
  __$$PokemonStatsImplCopyWithImpl(
      _$PokemonStatsImpl _value, $Res Function(_$PokemonStatsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? attack = null,
    Object? specialAttack = null,
    Object? defense = null,
    Object? specialDefense = null,
    Object? hp = null,
    Object? speed = null,
  }) {
    return _then(_$PokemonStatsImpl(
      attack: null == attack
          ? _value.attack
          : attack // ignore: cast_nullable_to_non_nullable
              as int,
      specialAttack: null == specialAttack
          ? _value.specialAttack
          : specialAttack // ignore: cast_nullable_to_non_nullable
              as int,
      defense: null == defense
          ? _value.defense
          : defense // ignore: cast_nullable_to_non_nullable
              as int,
      specialDefense: null == specialDefense
          ? _value.specialDefense
          : specialDefense // ignore: cast_nullable_to_non_nullable
              as int,
      hp: null == hp
          ? _value.hp
          : hp // ignore: cast_nullable_to_non_nullable
              as int,
      speed: null == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonStatsImpl extends _PokemonStats with DiagnosticableTreeMixin {
  const _$PokemonStatsImpl(
      {required this.attack,
      required this.specialAttack,
      required this.defense,
      required this.specialDefense,
      required this.hp,
      required this.speed})
      : super._();

  factory _$PokemonStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonStatsImplFromJson(json);

  @override
  final int attack;
  @override
  final int specialAttack;
  @override
  final int defense;
  @override
  final int specialDefense;
  @override
  final int hp;
  @override
  final int speed;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PokemonStats(attack: $attack, specialAttack: $specialAttack, defense: $defense, specialDefense: $specialDefense, hp: $hp, speed: $speed)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PokemonStats'))
      ..add(DiagnosticsProperty('attack', attack))
      ..add(DiagnosticsProperty('specialAttack', specialAttack))
      ..add(DiagnosticsProperty('defense', defense))
      ..add(DiagnosticsProperty('specialDefense', specialDefense))
      ..add(DiagnosticsProperty('hp', hp))
      ..add(DiagnosticsProperty('speed', speed));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonStatsImpl &&
            (identical(other.attack, attack) || other.attack == attack) &&
            (identical(other.specialAttack, specialAttack) ||
                other.specialAttack == specialAttack) &&
            (identical(other.defense, defense) || other.defense == defense) &&
            (identical(other.specialDefense, specialDefense) ||
                other.specialDefense == specialDefense) &&
            (identical(other.hp, hp) || other.hp == hp) &&
            (identical(other.speed, speed) || other.speed == speed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, attack, specialAttack, defense, specialDefense, hp, speed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonStatsImplCopyWith<_$PokemonStatsImpl> get copyWith =>
      __$$PokemonStatsImplCopyWithImpl<_$PokemonStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonStatsImplToJson(
      this,
    );
  }
}

abstract class _PokemonStats extends PokemonStats {
  const factory _PokemonStats(
      {required final int attack,
      required final int specialAttack,
      required final int defense,
      required final int specialDefense,
      required final int hp,
      required final int speed}) = _$PokemonStatsImpl;
  const _PokemonStats._() : super._();

  factory _PokemonStats.fromJson(Map<String, dynamic> json) =
      _$PokemonStatsImpl.fromJson;

  @override
  int get attack;
  @override
  int get specialAttack;
  @override
  int get defense;
  @override
  int get specialDefense;
  @override
  int get hp;
  @override
  int get speed;
  @override
  @JsonKey(ignore: true)
  _$$PokemonStatsImplCopyWith<_$PokemonStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
