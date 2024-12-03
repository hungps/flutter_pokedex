// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_species.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PokeApiPokemonSpecies _$PokeApiPokemonSpeciesFromJson(
    Map<String, dynamic> json) {
  return _PokeApiPokemonSpecies.fromJson(json);
}

/// @nodoc
mixin _$PokeApiPokemonSpecies {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'order')
  int get order => throw _privateConstructorUsedError;
  @JsonKey(name: 'gender_rate')
  int get genderRate => throw _privateConstructorUsedError;
  @JsonKey(name: 'egg_groups')
  List<PokeApiNamedApiResource> get eggGroups =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'color')
  PokeApiNamedApiResource get color => throw _privateConstructorUsedError;
  @JsonKey(name: 'generation')
  PokeApiNamedApiResource get generation => throw _privateConstructorUsedError;
  @JsonKey(name: 'names')
  List<PokeApiName> get names => throw _privateConstructorUsedError;
  @JsonKey(name: 'flavor_text_entries')
  List<PokeApiFlavorText> get flavorTextEntries =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'genera')
  List<PokeApiGenus> get genera => throw _privateConstructorUsedError;

  /// Serializes this PokeApiPokemonSpecies to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokeApiPokemonSpecies
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokeApiPokemonSpeciesCopyWith<PokeApiPokemonSpecies> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokeApiPokemonSpeciesCopyWith<$Res> {
  factory $PokeApiPokemonSpeciesCopyWith(PokeApiPokemonSpecies value,
          $Res Function(PokeApiPokemonSpecies) then) =
      _$PokeApiPokemonSpeciesCopyWithImpl<$Res, PokeApiPokemonSpecies>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'order') int order,
      @JsonKey(name: 'gender_rate') int genderRate,
      @JsonKey(name: 'egg_groups') List<PokeApiNamedApiResource> eggGroups,
      @JsonKey(name: 'color') PokeApiNamedApiResource color,
      @JsonKey(name: 'generation') PokeApiNamedApiResource generation,
      @JsonKey(name: 'names') List<PokeApiName> names,
      @JsonKey(name: 'flavor_text_entries')
      List<PokeApiFlavorText> flavorTextEntries,
      @JsonKey(name: 'genera') List<PokeApiGenus> genera});

  $PokeApiNamedApiResourceCopyWith<$Res> get color;
  $PokeApiNamedApiResourceCopyWith<$Res> get generation;
}

/// @nodoc
class _$PokeApiPokemonSpeciesCopyWithImpl<$Res,
        $Val extends PokeApiPokemonSpecies>
    implements $PokeApiPokemonSpeciesCopyWith<$Res> {
  _$PokeApiPokemonSpeciesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokeApiPokemonSpecies
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? order = null,
    Object? genderRate = null,
    Object? eggGroups = null,
    Object? color = null,
    Object? generation = null,
    Object? names = null,
    Object? flavorTextEntries = null,
    Object? genera = null,
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
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      genderRate: null == genderRate
          ? _value.genderRate
          : genderRate // ignore: cast_nullable_to_non_nullable
              as int,
      eggGroups: null == eggGroups
          ? _value.eggGroups
          : eggGroups // ignore: cast_nullable_to_non_nullable
              as List<PokeApiNamedApiResource>,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as PokeApiNamedApiResource,
      generation: null == generation
          ? _value.generation
          : generation // ignore: cast_nullable_to_non_nullable
              as PokeApiNamedApiResource,
      names: null == names
          ? _value.names
          : names // ignore: cast_nullable_to_non_nullable
              as List<PokeApiName>,
      flavorTextEntries: null == flavorTextEntries
          ? _value.flavorTextEntries
          : flavorTextEntries // ignore: cast_nullable_to_non_nullable
              as List<PokeApiFlavorText>,
      genera: null == genera
          ? _value.genera
          : genera // ignore: cast_nullable_to_non_nullable
              as List<PokeApiGenus>,
    ) as $Val);
  }

  /// Create a copy of PokeApiPokemonSpecies
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PokeApiNamedApiResourceCopyWith<$Res> get color {
    return $PokeApiNamedApiResourceCopyWith<$Res>(_value.color, (value) {
      return _then(_value.copyWith(color: value) as $Val);
    });
  }

  /// Create a copy of PokeApiPokemonSpecies
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PokeApiNamedApiResourceCopyWith<$Res> get generation {
    return $PokeApiNamedApiResourceCopyWith<$Res>(_value.generation, (value) {
      return _then(_value.copyWith(generation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PokeApiPokemonSpeciesImplCopyWith<$Res>
    implements $PokeApiPokemonSpeciesCopyWith<$Res> {
  factory _$$PokeApiPokemonSpeciesImplCopyWith(
          _$PokeApiPokemonSpeciesImpl value,
          $Res Function(_$PokeApiPokemonSpeciesImpl) then) =
      __$$PokeApiPokemonSpeciesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'order') int order,
      @JsonKey(name: 'gender_rate') int genderRate,
      @JsonKey(name: 'egg_groups') List<PokeApiNamedApiResource> eggGroups,
      @JsonKey(name: 'color') PokeApiNamedApiResource color,
      @JsonKey(name: 'generation') PokeApiNamedApiResource generation,
      @JsonKey(name: 'names') List<PokeApiName> names,
      @JsonKey(name: 'flavor_text_entries')
      List<PokeApiFlavorText> flavorTextEntries,
      @JsonKey(name: 'genera') List<PokeApiGenus> genera});

  @override
  $PokeApiNamedApiResourceCopyWith<$Res> get color;
  @override
  $PokeApiNamedApiResourceCopyWith<$Res> get generation;
}

/// @nodoc
class __$$PokeApiPokemonSpeciesImplCopyWithImpl<$Res>
    extends _$PokeApiPokemonSpeciesCopyWithImpl<$Res,
        _$PokeApiPokemonSpeciesImpl>
    implements _$$PokeApiPokemonSpeciesImplCopyWith<$Res> {
  __$$PokeApiPokemonSpeciesImplCopyWithImpl(_$PokeApiPokemonSpeciesImpl _value,
      $Res Function(_$PokeApiPokemonSpeciesImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokeApiPokemonSpecies
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? order = null,
    Object? genderRate = null,
    Object? eggGroups = null,
    Object? color = null,
    Object? generation = null,
    Object? names = null,
    Object? flavorTextEntries = null,
    Object? genera = null,
  }) {
    return _then(_$PokeApiPokemonSpeciesImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      genderRate: null == genderRate
          ? _value.genderRate
          : genderRate // ignore: cast_nullable_to_non_nullable
              as int,
      eggGroups: null == eggGroups
          ? _value._eggGroups
          : eggGroups // ignore: cast_nullable_to_non_nullable
              as List<PokeApiNamedApiResource>,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as PokeApiNamedApiResource,
      generation: null == generation
          ? _value.generation
          : generation // ignore: cast_nullable_to_non_nullable
              as PokeApiNamedApiResource,
      names: null == names
          ? _value._names
          : names // ignore: cast_nullable_to_non_nullable
              as List<PokeApiName>,
      flavorTextEntries: null == flavorTextEntries
          ? _value._flavorTextEntries
          : flavorTextEntries // ignore: cast_nullable_to_non_nullable
              as List<PokeApiFlavorText>,
      genera: null == genera
          ? _value._genera
          : genera // ignore: cast_nullable_to_non_nullable
              as List<PokeApiGenus>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokeApiPokemonSpeciesImpl
    with DiagnosticableTreeMixin
    implements _PokeApiPokemonSpecies {
  const _$PokeApiPokemonSpeciesImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'order') required this.order,
      @JsonKey(name: 'gender_rate') required this.genderRate,
      @JsonKey(name: 'egg_groups')
      required final List<PokeApiNamedApiResource> eggGroups,
      @JsonKey(name: 'color') required this.color,
      @JsonKey(name: 'generation') required this.generation,
      @JsonKey(name: 'names') required final List<PokeApiName> names,
      @JsonKey(name: 'flavor_text_entries')
      required final List<PokeApiFlavorText> flavorTextEntries,
      @JsonKey(name: 'genera') required final List<PokeApiGenus> genera})
      : _eggGroups = eggGroups,
        _names = names,
        _flavorTextEntries = flavorTextEntries,
        _genera = genera;

  factory _$PokeApiPokemonSpeciesImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokeApiPokemonSpeciesImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'order')
  final int order;
  @override
  @JsonKey(name: 'gender_rate')
  final int genderRate;
  final List<PokeApiNamedApiResource> _eggGroups;
  @override
  @JsonKey(name: 'egg_groups')
  List<PokeApiNamedApiResource> get eggGroups {
    if (_eggGroups is EqualUnmodifiableListView) return _eggGroups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_eggGroups);
  }

  @override
  @JsonKey(name: 'color')
  final PokeApiNamedApiResource color;
  @override
  @JsonKey(name: 'generation')
  final PokeApiNamedApiResource generation;
  final List<PokeApiName> _names;
  @override
  @JsonKey(name: 'names')
  List<PokeApiName> get names {
    if (_names is EqualUnmodifiableListView) return _names;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_names);
  }

  final List<PokeApiFlavorText> _flavorTextEntries;
  @override
  @JsonKey(name: 'flavor_text_entries')
  List<PokeApiFlavorText> get flavorTextEntries {
    if (_flavorTextEntries is EqualUnmodifiableListView)
      return _flavorTextEntries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_flavorTextEntries);
  }

  final List<PokeApiGenus> _genera;
  @override
  @JsonKey(name: 'genera')
  List<PokeApiGenus> get genera {
    if (_genera is EqualUnmodifiableListView) return _genera;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_genera);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PokeApiPokemonSpecies(id: $id, name: $name, order: $order, genderRate: $genderRate, eggGroups: $eggGroups, color: $color, generation: $generation, names: $names, flavorTextEntries: $flavorTextEntries, genera: $genera)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PokeApiPokemonSpecies'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('order', order))
      ..add(DiagnosticsProperty('genderRate', genderRate))
      ..add(DiagnosticsProperty('eggGroups', eggGroups))
      ..add(DiagnosticsProperty('color', color))
      ..add(DiagnosticsProperty('generation', generation))
      ..add(DiagnosticsProperty('names', names))
      ..add(DiagnosticsProperty('flavorTextEntries', flavorTextEntries))
      ..add(DiagnosticsProperty('genera', genera));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokeApiPokemonSpeciesImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.genderRate, genderRate) ||
                other.genderRate == genderRate) &&
            const DeepCollectionEquality()
                .equals(other._eggGroups, _eggGroups) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.generation, generation) ||
                other.generation == generation) &&
            const DeepCollectionEquality().equals(other._names, _names) &&
            const DeepCollectionEquality()
                .equals(other._flavorTextEntries, _flavorTextEntries) &&
            const DeepCollectionEquality().equals(other._genera, _genera));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      order,
      genderRate,
      const DeepCollectionEquality().hash(_eggGroups),
      color,
      generation,
      const DeepCollectionEquality().hash(_names),
      const DeepCollectionEquality().hash(_flavorTextEntries),
      const DeepCollectionEquality().hash(_genera));

  /// Create a copy of PokeApiPokemonSpecies
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokeApiPokemonSpeciesImplCopyWith<_$PokeApiPokemonSpeciesImpl>
      get copyWith => __$$PokeApiPokemonSpeciesImplCopyWithImpl<
          _$PokeApiPokemonSpeciesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokeApiPokemonSpeciesImplToJson(
      this,
    );
  }
}

abstract class _PokeApiPokemonSpecies implements PokeApiPokemonSpecies {
  const factory _PokeApiPokemonSpecies(
          {@JsonKey(name: 'id') required final int id,
          @JsonKey(name: 'name') required final String name,
          @JsonKey(name: 'order') required final int order,
          @JsonKey(name: 'gender_rate') required final int genderRate,
          @JsonKey(name: 'egg_groups')
          required final List<PokeApiNamedApiResource> eggGroups,
          @JsonKey(name: 'color') required final PokeApiNamedApiResource color,
          @JsonKey(name: 'generation')
          required final PokeApiNamedApiResource generation,
          @JsonKey(name: 'names') required final List<PokeApiName> names,
          @JsonKey(name: 'flavor_text_entries')
          required final List<PokeApiFlavorText> flavorTextEntries,
          @JsonKey(name: 'genera') required final List<PokeApiGenus> genera}) =
      _$PokeApiPokemonSpeciesImpl;

  factory _PokeApiPokemonSpecies.fromJson(Map<String, dynamic> json) =
      _$PokeApiPokemonSpeciesImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'order')
  int get order;
  @override
  @JsonKey(name: 'gender_rate')
  int get genderRate;
  @override
  @JsonKey(name: 'egg_groups')
  List<PokeApiNamedApiResource> get eggGroups;
  @override
  @JsonKey(name: 'color')
  PokeApiNamedApiResource get color;
  @override
  @JsonKey(name: 'generation')
  PokeApiNamedApiResource get generation;
  @override
  @JsonKey(name: 'names')
  List<PokeApiName> get names;
  @override
  @JsonKey(name: 'flavor_text_entries')
  List<PokeApiFlavorText> get flavorTextEntries;
  @override
  @JsonKey(name: 'genera')
  List<PokeApiGenus> get genera;

  /// Create a copy of PokeApiPokemonSpecies
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokeApiPokemonSpeciesImplCopyWith<_$PokeApiPokemonSpeciesImpl>
      get copyWith => throw _privateConstructorUsedError;
}
