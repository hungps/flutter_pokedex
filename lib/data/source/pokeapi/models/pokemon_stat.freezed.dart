// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_stat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PokeApiPokemonStat _$PokeApiPokemonStatFromJson(Map<String, dynamic> json) {
  return _PokeApiPokemonStat.fromJson(json);
}

/// @nodoc
mixin _$PokeApiPokemonStat {
  @JsonKey(name: 'base_stat')
  int get baseStat => throw _privateConstructorUsedError;
  @JsonKey(name: 'effort')
  int get effort => throw _privateConstructorUsedError;
  @JsonKey(name: 'stat')
  PokeApiNamedApiResource get stat => throw _privateConstructorUsedError;

  /// Serializes this PokeApiPokemonStat to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokeApiPokemonStat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokeApiPokemonStatCopyWith<PokeApiPokemonStat> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokeApiPokemonStatCopyWith<$Res> {
  factory $PokeApiPokemonStatCopyWith(
          PokeApiPokemonStat value, $Res Function(PokeApiPokemonStat) then) =
      _$PokeApiPokemonStatCopyWithImpl<$Res, PokeApiPokemonStat>;
  @useResult
  $Res call(
      {@JsonKey(name: 'base_stat') int baseStat,
      @JsonKey(name: 'effort') int effort,
      @JsonKey(name: 'stat') PokeApiNamedApiResource stat});

  $PokeApiNamedApiResourceCopyWith<$Res> get stat;
}

/// @nodoc
class _$PokeApiPokemonStatCopyWithImpl<$Res, $Val extends PokeApiPokemonStat>
    implements $PokeApiPokemonStatCopyWith<$Res> {
  _$PokeApiPokemonStatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokeApiPokemonStat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseStat = null,
    Object? effort = null,
    Object? stat = null,
  }) {
    return _then(_value.copyWith(
      baseStat: null == baseStat
          ? _value.baseStat
          : baseStat // ignore: cast_nullable_to_non_nullable
              as int,
      effort: null == effort
          ? _value.effort
          : effort // ignore: cast_nullable_to_non_nullable
              as int,
      stat: null == stat
          ? _value.stat
          : stat // ignore: cast_nullable_to_non_nullable
              as PokeApiNamedApiResource,
    ) as $Val);
  }

  /// Create a copy of PokeApiPokemonStat
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PokeApiNamedApiResourceCopyWith<$Res> get stat {
    return $PokeApiNamedApiResourceCopyWith<$Res>(_value.stat, (value) {
      return _then(_value.copyWith(stat: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PokeApiPokemonStatImplCopyWith<$Res>
    implements $PokeApiPokemonStatCopyWith<$Res> {
  factory _$$PokeApiPokemonStatImplCopyWith(_$PokeApiPokemonStatImpl value,
          $Res Function(_$PokeApiPokemonStatImpl) then) =
      __$$PokeApiPokemonStatImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'base_stat') int baseStat,
      @JsonKey(name: 'effort') int effort,
      @JsonKey(name: 'stat') PokeApiNamedApiResource stat});

  @override
  $PokeApiNamedApiResourceCopyWith<$Res> get stat;
}

/// @nodoc
class __$$PokeApiPokemonStatImplCopyWithImpl<$Res>
    extends _$PokeApiPokemonStatCopyWithImpl<$Res, _$PokeApiPokemonStatImpl>
    implements _$$PokeApiPokemonStatImplCopyWith<$Res> {
  __$$PokeApiPokemonStatImplCopyWithImpl(_$PokeApiPokemonStatImpl _value,
      $Res Function(_$PokeApiPokemonStatImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokeApiPokemonStat
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseStat = null,
    Object? effort = null,
    Object? stat = null,
  }) {
    return _then(_$PokeApiPokemonStatImpl(
      baseStat: null == baseStat
          ? _value.baseStat
          : baseStat // ignore: cast_nullable_to_non_nullable
              as int,
      effort: null == effort
          ? _value.effort
          : effort // ignore: cast_nullable_to_non_nullable
              as int,
      stat: null == stat
          ? _value.stat
          : stat // ignore: cast_nullable_to_non_nullable
              as PokeApiNamedApiResource,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokeApiPokemonStatImpl
    with DiagnosticableTreeMixin
    implements _PokeApiPokemonStat {
  const _$PokeApiPokemonStatImpl(
      {@JsonKey(name: 'base_stat') required this.baseStat,
      @JsonKey(name: 'effort') required this.effort,
      @JsonKey(name: 'stat') required this.stat});

  factory _$PokeApiPokemonStatImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokeApiPokemonStatImplFromJson(json);

  @override
  @JsonKey(name: 'base_stat')
  final int baseStat;
  @override
  @JsonKey(name: 'effort')
  final int effort;
  @override
  @JsonKey(name: 'stat')
  final PokeApiNamedApiResource stat;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PokeApiPokemonStat(baseStat: $baseStat, effort: $effort, stat: $stat)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PokeApiPokemonStat'))
      ..add(DiagnosticsProperty('baseStat', baseStat))
      ..add(DiagnosticsProperty('effort', effort))
      ..add(DiagnosticsProperty('stat', stat));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokeApiPokemonStatImpl &&
            (identical(other.baseStat, baseStat) ||
                other.baseStat == baseStat) &&
            (identical(other.effort, effort) || other.effort == effort) &&
            (identical(other.stat, stat) || other.stat == stat));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, baseStat, effort, stat);

  /// Create a copy of PokeApiPokemonStat
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokeApiPokemonStatImplCopyWith<_$PokeApiPokemonStatImpl> get copyWith =>
      __$$PokeApiPokemonStatImplCopyWithImpl<_$PokeApiPokemonStatImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokeApiPokemonStatImplToJson(
      this,
    );
  }
}

abstract class _PokeApiPokemonStat implements PokeApiPokemonStat {
  const factory _PokeApiPokemonStat(
          {@JsonKey(name: 'base_stat') required final int baseStat,
          @JsonKey(name: 'effort') required final int effort,
          @JsonKey(name: 'stat') required final PokeApiNamedApiResource stat}) =
      _$PokeApiPokemonStatImpl;

  factory _PokeApiPokemonStat.fromJson(Map<String, dynamic> json) =
      _$PokeApiPokemonStatImpl.fromJson;

  @override
  @JsonKey(name: 'base_stat')
  int get baseStat;
  @override
  @JsonKey(name: 'effort')
  int get effort;
  @override
  @JsonKey(name: 'stat')
  PokeApiNamedApiResource get stat;

  /// Create a copy of PokeApiPokemonStat
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokeApiPokemonStatImplCopyWith<_$PokeApiPokemonStatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
