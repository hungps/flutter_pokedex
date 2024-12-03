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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PokeApiPokemon _$PokeApiPokemonFromJson(Map<String, dynamic> json) {
  return _PokeApiPokemon.fromJson(json);
}

/// @nodoc
mixin _$PokeApiPokemon {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'base_experience')
  int get baseExperience => throw _privateConstructorUsedError;
  @JsonKey(name: 'height')
  int get height => throw _privateConstructorUsedError;
  @JsonKey(name: 'order')
  int get order => throw _privateConstructorUsedError;
  @JsonKey(name: 'weight')
  int get weight => throw _privateConstructorUsedError;
  @JsonKey(name: 'forms')
  List<PokeApiNamedApiResource> get forms => throw _privateConstructorUsedError;
  @JsonKey(name: 'species')
  PokeApiNamedApiResource get species => throw _privateConstructorUsedError;
  @JsonKey(name: 'sprites')
  PokeApiPokemonSprites get sprites => throw _privateConstructorUsedError;
  @JsonKey(name: 'stats')
  List<PokeApiPokemonStat> get stats => throw _privateConstructorUsedError;
  @JsonKey(name: 'types')
  List<PokeApiPokemonType> get types => throw _privateConstructorUsedError;

  /// Serializes this PokeApiPokemon to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokeApiPokemon
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokeApiPokemonCopyWith<PokeApiPokemon> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokeApiPokemonCopyWith<$Res> {
  factory $PokeApiPokemonCopyWith(
          PokeApiPokemon value, $Res Function(PokeApiPokemon) then) =
      _$PokeApiPokemonCopyWithImpl<$Res, PokeApiPokemon>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'base_experience') int baseExperience,
      @JsonKey(name: 'height') int height,
      @JsonKey(name: 'order') int order,
      @JsonKey(name: 'weight') int weight,
      @JsonKey(name: 'forms') List<PokeApiNamedApiResource> forms,
      @JsonKey(name: 'species') PokeApiNamedApiResource species,
      @JsonKey(name: 'sprites') PokeApiPokemonSprites sprites,
      @JsonKey(name: 'stats') List<PokeApiPokemonStat> stats,
      @JsonKey(name: 'types') List<PokeApiPokemonType> types});

  $PokeApiNamedApiResourceCopyWith<$Res> get species;
  $PokeApiPokemonSpritesCopyWith<$Res> get sprites;
}

/// @nodoc
class _$PokeApiPokemonCopyWithImpl<$Res, $Val extends PokeApiPokemon>
    implements $PokeApiPokemonCopyWith<$Res> {
  _$PokeApiPokemonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokeApiPokemon
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? baseExperience = null,
    Object? height = null,
    Object? order = null,
    Object? weight = null,
    Object? forms = null,
    Object? species = null,
    Object? sprites = null,
    Object? stats = null,
    Object? types = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      baseExperience: null == baseExperience
          ? _value.baseExperience
          : baseExperience // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int,
      forms: null == forms
          ? _value.forms
          : forms // ignore: cast_nullable_to_non_nullable
              as List<PokeApiNamedApiResource>,
      species: null == species
          ? _value.species
          : species // ignore: cast_nullable_to_non_nullable
              as PokeApiNamedApiResource,
      sprites: null == sprites
          ? _value.sprites
          : sprites // ignore: cast_nullable_to_non_nullable
              as PokeApiPokemonSprites,
      stats: null == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as List<PokeApiPokemonStat>,
      types: null == types
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
              as List<PokeApiPokemonType>,
    ) as $Val);
  }

  /// Create a copy of PokeApiPokemon
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PokeApiNamedApiResourceCopyWith<$Res> get species {
    return $PokeApiNamedApiResourceCopyWith<$Res>(_value.species, (value) {
      return _then(_value.copyWith(species: value) as $Val);
    });
  }

  /// Create a copy of PokeApiPokemon
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PokeApiPokemonSpritesCopyWith<$Res> get sprites {
    return $PokeApiPokemonSpritesCopyWith<$Res>(_value.sprites, (value) {
      return _then(_value.copyWith(sprites: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PokeApiPokemonImplCopyWith<$Res>
    implements $PokeApiPokemonCopyWith<$Res> {
  factory _$$PokeApiPokemonImplCopyWith(_$PokeApiPokemonImpl value,
          $Res Function(_$PokeApiPokemonImpl) then) =
      __$$PokeApiPokemonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'base_experience') int baseExperience,
      @JsonKey(name: 'height') int height,
      @JsonKey(name: 'order') int order,
      @JsonKey(name: 'weight') int weight,
      @JsonKey(name: 'forms') List<PokeApiNamedApiResource> forms,
      @JsonKey(name: 'species') PokeApiNamedApiResource species,
      @JsonKey(name: 'sprites') PokeApiPokemonSprites sprites,
      @JsonKey(name: 'stats') List<PokeApiPokemonStat> stats,
      @JsonKey(name: 'types') List<PokeApiPokemonType> types});

  @override
  $PokeApiNamedApiResourceCopyWith<$Res> get species;
  @override
  $PokeApiPokemonSpritesCopyWith<$Res> get sprites;
}

/// @nodoc
class __$$PokeApiPokemonImplCopyWithImpl<$Res>
    extends _$PokeApiPokemonCopyWithImpl<$Res, _$PokeApiPokemonImpl>
    implements _$$PokeApiPokemonImplCopyWith<$Res> {
  __$$PokeApiPokemonImplCopyWithImpl(
      _$PokeApiPokemonImpl _value, $Res Function(_$PokeApiPokemonImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokeApiPokemon
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? baseExperience = null,
    Object? height = null,
    Object? order = null,
    Object? weight = null,
    Object? forms = null,
    Object? species = null,
    Object? sprites = null,
    Object? stats = null,
    Object? types = null,
  }) {
    return _then(_$PokeApiPokemonImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      baseExperience: null == baseExperience
          ? _value.baseExperience
          : baseExperience // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int,
      forms: null == forms
          ? _value._forms
          : forms // ignore: cast_nullable_to_non_nullable
              as List<PokeApiNamedApiResource>,
      species: null == species
          ? _value.species
          : species // ignore: cast_nullable_to_non_nullable
              as PokeApiNamedApiResource,
      sprites: null == sprites
          ? _value.sprites
          : sprites // ignore: cast_nullable_to_non_nullable
              as PokeApiPokemonSprites,
      stats: null == stats
          ? _value._stats
          : stats // ignore: cast_nullable_to_non_nullable
              as List<PokeApiPokemonStat>,
      types: null == types
          ? _value._types
          : types // ignore: cast_nullable_to_non_nullable
              as List<PokeApiPokemonType>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokeApiPokemonImpl
    with DiagnosticableTreeMixin
    implements _PokeApiPokemon {
  const _$PokeApiPokemonImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'base_experience') required this.baseExperience,
      @JsonKey(name: 'height') required this.height,
      @JsonKey(name: 'order') required this.order,
      @JsonKey(name: 'weight') required this.weight,
      @JsonKey(name: 'forms')
      required final List<PokeApiNamedApiResource> forms,
      @JsonKey(name: 'species') required this.species,
      @JsonKey(name: 'sprites') required this.sprites,
      @JsonKey(name: 'stats') required final List<PokeApiPokemonStat> stats,
      @JsonKey(name: 'types') required final List<PokeApiPokemonType> types})
      : _forms = forms,
        _stats = stats,
        _types = types;

  factory _$PokeApiPokemonImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokeApiPokemonImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'base_experience')
  final int baseExperience;
  @override
  @JsonKey(name: 'height')
  final int height;
  @override
  @JsonKey(name: 'order')
  final int order;
  @override
  @JsonKey(name: 'weight')
  final int weight;
  final List<PokeApiNamedApiResource> _forms;
  @override
  @JsonKey(name: 'forms')
  List<PokeApiNamedApiResource> get forms {
    if (_forms is EqualUnmodifiableListView) return _forms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_forms);
  }

  @override
  @JsonKey(name: 'species')
  final PokeApiNamedApiResource species;
  @override
  @JsonKey(name: 'sprites')
  final PokeApiPokemonSprites sprites;
  final List<PokeApiPokemonStat> _stats;
  @override
  @JsonKey(name: 'stats')
  List<PokeApiPokemonStat> get stats {
    if (_stats is EqualUnmodifiableListView) return _stats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stats);
  }

  final List<PokeApiPokemonType> _types;
  @override
  @JsonKey(name: 'types')
  List<PokeApiPokemonType> get types {
    if (_types is EqualUnmodifiableListView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_types);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PokeApiPokemon(id: $id, name: $name, baseExperience: $baseExperience, height: $height, order: $order, weight: $weight, forms: $forms, species: $species, sprites: $sprites, stats: $stats, types: $types)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PokeApiPokemon'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('baseExperience', baseExperience))
      ..add(DiagnosticsProperty('height', height))
      ..add(DiagnosticsProperty('order', order))
      ..add(DiagnosticsProperty('weight', weight))
      ..add(DiagnosticsProperty('forms', forms))
      ..add(DiagnosticsProperty('species', species))
      ..add(DiagnosticsProperty('sprites', sprites))
      ..add(DiagnosticsProperty('stats', stats))
      ..add(DiagnosticsProperty('types', types));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokeApiPokemonImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.baseExperience, baseExperience) ||
                other.baseExperience == baseExperience) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            const DeepCollectionEquality().equals(other._forms, _forms) &&
            (identical(other.species, species) || other.species == species) &&
            (identical(other.sprites, sprites) || other.sprites == sprites) &&
            const DeepCollectionEquality().equals(other._stats, _stats) &&
            const DeepCollectionEquality().equals(other._types, _types));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      baseExperience,
      height,
      order,
      weight,
      const DeepCollectionEquality().hash(_forms),
      species,
      sprites,
      const DeepCollectionEquality().hash(_stats),
      const DeepCollectionEquality().hash(_types));

  /// Create a copy of PokeApiPokemon
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokeApiPokemonImplCopyWith<_$PokeApiPokemonImpl> get copyWith =>
      __$$PokeApiPokemonImplCopyWithImpl<_$PokeApiPokemonImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokeApiPokemonImplToJson(
      this,
    );
  }
}

abstract class _PokeApiPokemon implements PokeApiPokemon {
  const factory _PokeApiPokemon(
      {@JsonKey(name: 'id') required final int id,
      @JsonKey(name: 'name') required final String name,
      @JsonKey(name: 'base_experience') required final int baseExperience,
      @JsonKey(name: 'height') required final int height,
      @JsonKey(name: 'order') required final int order,
      @JsonKey(name: 'weight') required final int weight,
      @JsonKey(name: 'forms')
      required final List<PokeApiNamedApiResource> forms,
      @JsonKey(name: 'species') required final PokeApiNamedApiResource species,
      @JsonKey(name: 'sprites') required final PokeApiPokemonSprites sprites,
      @JsonKey(name: 'stats') required final List<PokeApiPokemonStat> stats,
      @JsonKey(name: 'types')
      required final List<PokeApiPokemonType> types}) = _$PokeApiPokemonImpl;

  factory _PokeApiPokemon.fromJson(Map<String, dynamic> json) =
      _$PokeApiPokemonImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'base_experience')
  int get baseExperience;
  @override
  @JsonKey(name: 'height')
  int get height;
  @override
  @JsonKey(name: 'order')
  int get order;
  @override
  @JsonKey(name: 'weight')
  int get weight;
  @override
  @JsonKey(name: 'forms')
  List<PokeApiNamedApiResource> get forms;
  @override
  @JsonKey(name: 'species')
  PokeApiNamedApiResource get species;
  @override
  @JsonKey(name: 'sprites')
  PokeApiPokemonSprites get sprites;
  @override
  @JsonKey(name: 'stats')
  List<PokeApiPokemonStat> get stats;
  @override
  @JsonKey(name: 'types')
  List<PokeApiPokemonType> get types;

  /// Create a copy of PokeApiPokemon
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokeApiPokemonImplCopyWith<_$PokeApiPokemonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
