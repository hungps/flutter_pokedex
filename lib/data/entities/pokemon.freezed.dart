// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Pokemon _$PokemonFromJson(Map<String, dynamic> json) {
  return _Pokemon.fromJson(json);
}

/// @nodoc
mixin _$Pokemon {
  String get number => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<PokemonTypes> get types => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String get height => throw _privateConstructorUsedError;
  String get weight => throw _privateConstructorUsedError;
  String get genera => throw _privateConstructorUsedError;
  List<String> get eggGroups => throw _privateConstructorUsedError;
  PokemonGender get gender => throw _privateConstructorUsedError;
  PokemonStats get stats => throw _privateConstructorUsedError;
  double get baseExp => throw _privateConstructorUsedError;
  List<Pokemon> get evolutions => throw _privateConstructorUsedError;
  String get evolutionReason => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PokemonCopyWith<Pokemon> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonCopyWith<$Res> {
  factory $PokemonCopyWith(Pokemon value, $Res Function(Pokemon) then) =
      _$PokemonCopyWithImpl<$Res, Pokemon>;
  @useResult
  $Res call(
      {String number,
      String name,
      String description,
      List<PokemonTypes> types,
      String image,
      String height,
      String weight,
      String genera,
      List<String> eggGroups,
      PokemonGender gender,
      PokemonStats stats,
      double baseExp,
      List<Pokemon> evolutions,
      String evolutionReason});

  $PokemonGenderCopyWith<$Res> get gender;
  $PokemonStatsCopyWith<$Res> get stats;
}

/// @nodoc
class _$PokemonCopyWithImpl<$Res, $Val extends Pokemon>
    implements $PokemonCopyWith<$Res> {
  _$PokemonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? name = null,
    Object? description = null,
    Object? types = null,
    Object? image = null,
    Object? height = null,
    Object? weight = null,
    Object? genera = null,
    Object? eggGroups = null,
    Object? gender = null,
    Object? stats = null,
    Object? baseExp = null,
    Object? evolutions = null,
    Object? evolutionReason = null,
  }) {
    return _then(_value.copyWith(
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      types: null == types
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
              as List<PokemonTypes>,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as String,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as String,
      genera: null == genera
          ? _value.genera
          : genera // ignore: cast_nullable_to_non_nullable
              as String,
      eggGroups: null == eggGroups
          ? _value.eggGroups
          : eggGroups // ignore: cast_nullable_to_non_nullable
              as List<String>,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as PokemonGender,
      stats: null == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as PokemonStats,
      baseExp: null == baseExp
          ? _value.baseExp
          : baseExp // ignore: cast_nullable_to_non_nullable
              as double,
      evolutions: null == evolutions
          ? _value.evolutions
          : evolutions // ignore: cast_nullable_to_non_nullable
              as List<Pokemon>,
      evolutionReason: null == evolutionReason
          ? _value.evolutionReason
          : evolutionReason // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PokemonGenderCopyWith<$Res> get gender {
    return $PokemonGenderCopyWith<$Res>(_value.gender, (value) {
      return _then(_value.copyWith(gender: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $PokemonStatsCopyWith<$Res> get stats {
    return $PokemonStatsCopyWith<$Res>(_value.stats, (value) {
      return _then(_value.copyWith(stats: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PokemonImplCopyWith<$Res> implements $PokemonCopyWith<$Res> {
  factory _$$PokemonImplCopyWith(
          _$PokemonImpl value, $Res Function(_$PokemonImpl) then) =
      __$$PokemonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String number,
      String name,
      String description,
      List<PokemonTypes> types,
      String image,
      String height,
      String weight,
      String genera,
      List<String> eggGroups,
      PokemonGender gender,
      PokemonStats stats,
      double baseExp,
      List<Pokemon> evolutions,
      String evolutionReason});

  @override
  $PokemonGenderCopyWith<$Res> get gender;
  @override
  $PokemonStatsCopyWith<$Res> get stats;
}

/// @nodoc
class __$$PokemonImplCopyWithImpl<$Res>
    extends _$PokemonCopyWithImpl<$Res, _$PokemonImpl>
    implements _$$PokemonImplCopyWith<$Res> {
  __$$PokemonImplCopyWithImpl(
      _$PokemonImpl _value, $Res Function(_$PokemonImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? name = null,
    Object? description = null,
    Object? types = null,
    Object? image = null,
    Object? height = null,
    Object? weight = null,
    Object? genera = null,
    Object? eggGroups = null,
    Object? gender = null,
    Object? stats = null,
    Object? baseExp = null,
    Object? evolutions = null,
    Object? evolutionReason = null,
  }) {
    return _then(_$PokemonImpl(
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      types: null == types
          ? _value._types
          : types // ignore: cast_nullable_to_non_nullable
              as List<PokemonTypes>,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as String,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as String,
      genera: null == genera
          ? _value.genera
          : genera // ignore: cast_nullable_to_non_nullable
              as String,
      eggGroups: null == eggGroups
          ? _value._eggGroups
          : eggGroups // ignore: cast_nullable_to_non_nullable
              as List<String>,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as PokemonGender,
      stats: null == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as PokemonStats,
      baseExp: null == baseExp
          ? _value.baseExp
          : baseExp // ignore: cast_nullable_to_non_nullable
              as double,
      evolutions: null == evolutions
          ? _value._evolutions
          : evolutions // ignore: cast_nullable_to_non_nullable
              as List<Pokemon>,
      evolutionReason: null == evolutionReason
          ? _value.evolutionReason
          : evolutionReason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonImpl extends _Pokemon with DiagnosticableTreeMixin {
  const _$PokemonImpl(
      {required this.number,
      required this.name,
      required this.description,
      required final List<PokemonTypes> types,
      required this.image,
      required this.height,
      required this.weight,
      required this.genera,
      required final List<String> eggGroups,
      required this.gender,
      required this.stats,
      required this.baseExp,
      required final List<Pokemon> evolutions,
      required this.evolutionReason})
      : _types = types,
        _eggGroups = eggGroups,
        _evolutions = evolutions,
        super._();

  factory _$PokemonImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonImplFromJson(json);

  @override
  final String number;
  @override
  final String name;
  @override
  final String description;
  final List<PokemonTypes> _types;
  @override
  List<PokemonTypes> get types {
    if (_types is EqualUnmodifiableListView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_types);
  }

  @override
  final String image;
  @override
  final String height;
  @override
  final String weight;
  @override
  final String genera;
  final List<String> _eggGroups;
  @override
  List<String> get eggGroups {
    if (_eggGroups is EqualUnmodifiableListView) return _eggGroups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_eggGroups);
  }

  @override
  final PokemonGender gender;
  @override
  final PokemonStats stats;
  @override
  final double baseExp;
  final List<Pokemon> _evolutions;
  @override
  List<Pokemon> get evolutions {
    if (_evolutions is EqualUnmodifiableListView) return _evolutions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_evolutions);
  }

  @override
  final String evolutionReason;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Pokemon(number: $number, name: $name, description: $description, types: $types, image: $image, height: $height, weight: $weight, genera: $genera, eggGroups: $eggGroups, gender: $gender, stats: $stats, baseExp: $baseExp, evolutions: $evolutions, evolutionReason: $evolutionReason)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Pokemon'))
      ..add(DiagnosticsProperty('number', number))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('types', types))
      ..add(DiagnosticsProperty('image', image))
      ..add(DiagnosticsProperty('height', height))
      ..add(DiagnosticsProperty('weight', weight))
      ..add(DiagnosticsProperty('genera', genera))
      ..add(DiagnosticsProperty('eggGroups', eggGroups))
      ..add(DiagnosticsProperty('gender', gender))
      ..add(DiagnosticsProperty('stats', stats))
      ..add(DiagnosticsProperty('baseExp', baseExp))
      ..add(DiagnosticsProperty('evolutions', evolutions))
      ..add(DiagnosticsProperty('evolutionReason', evolutionReason));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonImpl &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._types, _types) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.genera, genera) || other.genera == genera) &&
            const DeepCollectionEquality()
                .equals(other._eggGroups, _eggGroups) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.stats, stats) || other.stats == stats) &&
            (identical(other.baseExp, baseExp) || other.baseExp == baseExp) &&
            const DeepCollectionEquality()
                .equals(other._evolutions, _evolutions) &&
            (identical(other.evolutionReason, evolutionReason) ||
                other.evolutionReason == evolutionReason));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      number,
      name,
      description,
      const DeepCollectionEquality().hash(_types),
      image,
      height,
      weight,
      genera,
      const DeepCollectionEquality().hash(_eggGroups),
      gender,
      stats,
      baseExp,
      const DeepCollectionEquality().hash(_evolutions),
      evolutionReason);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonImplCopyWith<_$PokemonImpl> get copyWith =>
      __$$PokemonImplCopyWithImpl<_$PokemonImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonImplToJson(
      this,
    );
  }
}

abstract class _Pokemon extends Pokemon {
  const factory _Pokemon(
      {required final String number,
      required final String name,
      required final String description,
      required final List<PokemonTypes> types,
      required final String image,
      required final String height,
      required final String weight,
      required final String genera,
      required final List<String> eggGroups,
      required final PokemonGender gender,
      required final PokemonStats stats,
      required final double baseExp,
      required final List<Pokemon> evolutions,
      required final String evolutionReason}) = _$PokemonImpl;
  const _Pokemon._() : super._();

  factory _Pokemon.fromJson(Map<String, dynamic> json) = _$PokemonImpl.fromJson;

  @override
  String get number;
  @override
  String get name;
  @override
  String get description;
  @override
  List<PokemonTypes> get types;
  @override
  String get image;
  @override
  String get height;
  @override
  String get weight;
  @override
  String get genera;
  @override
  List<String> get eggGroups;
  @override
  PokemonGender get gender;
  @override
  PokemonStats get stats;
  @override
  double get baseExp;
  @override
  List<Pokemon> get evolutions;
  @override
  String get evolutionReason;
  @override
  @JsonKey(ignore: true)
  _$$PokemonImplCopyWith<_$PokemonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
