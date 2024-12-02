// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PokemonState {
  PokemonStateStatus get status => throw _privateConstructorUsedError;
  List<Pokemon> get pokemons => throw _privateConstructorUsedError;
  List<BasicPokemon> get basicPokemons => throw _privateConstructorUsedError;
  int get selectedPokemonIndex => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  bool get canLoadMore => throw _privateConstructorUsedError;
  Exception? get error => throw _privateConstructorUsedError;

  /// Create a copy of PokemonState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonStateCopyWith<PokemonState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonStateCopyWith<$Res> {
  factory $PokemonStateCopyWith(
          PokemonState value, $Res Function(PokemonState) then) =
      _$PokemonStateCopyWithImpl<$Res, PokemonState>;
  @useResult
  $Res call(
      {PokemonStateStatus status,
      List<Pokemon> pokemons,
      List<BasicPokemon> basicPokemons,
      int selectedPokemonIndex,
      int page,
      bool canLoadMore,
      Exception? error});
}

/// @nodoc
class _$PokemonStateCopyWithImpl<$Res, $Val extends PokemonState>
    implements $PokemonStateCopyWith<$Res> {
  _$PokemonStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? pokemons = null,
    Object? basicPokemons = null,
    Object? selectedPokemonIndex = null,
    Object? page = null,
    Object? canLoadMore = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PokemonStateStatus,
      pokemons: null == pokemons
          ? _value.pokemons
          : pokemons // ignore: cast_nullable_to_non_nullable
              as List<Pokemon>,
      basicPokemons: null == basicPokemons
          ? _value.basicPokemons
          : basicPokemons // ignore: cast_nullable_to_non_nullable
              as List<BasicPokemon>,
      selectedPokemonIndex: null == selectedPokemonIndex
          ? _value.selectedPokemonIndex
          : selectedPokemonIndex // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PokemonStateImplCopyWith<$Res>
    implements $PokemonStateCopyWith<$Res> {
  factory _$$PokemonStateImplCopyWith(
          _$PokemonStateImpl value, $Res Function(_$PokemonStateImpl) then) =
      __$$PokemonStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PokemonStateStatus status,
      List<Pokemon> pokemons,
      List<BasicPokemon> basicPokemons,
      int selectedPokemonIndex,
      int page,
      bool canLoadMore,
      Exception? error});
}

/// @nodoc
class __$$PokemonStateImplCopyWithImpl<$Res>
    extends _$PokemonStateCopyWithImpl<$Res, _$PokemonStateImpl>
    implements _$$PokemonStateImplCopyWith<$Res> {
  __$$PokemonStateImplCopyWithImpl(
      _$PokemonStateImpl _value, $Res Function(_$PokemonStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokemonState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? pokemons = null,
    Object? basicPokemons = null,
    Object? selectedPokemonIndex = null,
    Object? page = null,
    Object? canLoadMore = null,
    Object? error = freezed,
  }) {
    return _then(_$PokemonStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PokemonStateStatus,
      pokemons: null == pokemons
          ? _value._pokemons
          : pokemons // ignore: cast_nullable_to_non_nullable
              as List<Pokemon>,
      basicPokemons: null == basicPokemons
          ? _value._basicPokemons
          : basicPokemons // ignore: cast_nullable_to_non_nullable
              as List<BasicPokemon>,
      selectedPokemonIndex: null == selectedPokemonIndex
          ? _value.selectedPokemonIndex
          : selectedPokemonIndex // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      canLoadMore: null == canLoadMore
          ? _value.canLoadMore
          : canLoadMore // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Exception?,
    ));
  }
}

/// @nodoc

class _$PokemonStateImpl extends _PokemonState with DiagnosticableTreeMixin {
  const _$PokemonStateImpl(
      {this.status = PokemonStateStatus.initial,
      final List<Pokemon> pokemons = const [],
      final List<BasicPokemon> basicPokemons = const [],
      this.selectedPokemonIndex = 0,
      this.page = 1,
      this.canLoadMore = true,
      this.error})
      : _pokemons = pokemons,
        _basicPokemons = basicPokemons,
        super._();

  @override
  @JsonKey()
  final PokemonStateStatus status;
  final List<Pokemon> _pokemons;
  @override
  @JsonKey()
  List<Pokemon> get pokemons {
    if (_pokemons is EqualUnmodifiableListView) return _pokemons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pokemons);
  }

  final List<BasicPokemon> _basicPokemons;
  @override
  @JsonKey()
  List<BasicPokemon> get basicPokemons {
    if (_basicPokemons is EqualUnmodifiableListView) return _basicPokemons;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_basicPokemons);
  }

  @override
  @JsonKey()
  final int selectedPokemonIndex;
  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final bool canLoadMore;
  @override
  final Exception? error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PokemonState(status: $status, pokemons: $pokemons, basicPokemons: $basicPokemons, selectedPokemonIndex: $selectedPokemonIndex, page: $page, canLoadMore: $canLoadMore, error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PokemonState'))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('pokemons', pokemons))
      ..add(DiagnosticsProperty('basicPokemons', basicPokemons))
      ..add(DiagnosticsProperty('selectedPokemonIndex', selectedPokemonIndex))
      ..add(DiagnosticsProperty('page', page))
      ..add(DiagnosticsProperty('canLoadMore', canLoadMore))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._pokemons, _pokemons) &&
            const DeepCollectionEquality()
                .equals(other._basicPokemons, _basicPokemons) &&
            (identical(other.selectedPokemonIndex, selectedPokemonIndex) ||
                other.selectedPokemonIndex == selectedPokemonIndex) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.canLoadMore, canLoadMore) ||
                other.canLoadMore == canLoadMore) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_pokemons),
      const DeepCollectionEquality().hash(_basicPokemons),
      selectedPokemonIndex,
      page,
      canLoadMore,
      error);

  /// Create a copy of PokemonState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonStateImplCopyWith<_$PokemonStateImpl> get copyWith =>
      __$$PokemonStateImplCopyWithImpl<_$PokemonStateImpl>(this, _$identity);
}

abstract class _PokemonState extends PokemonState {
  const factory _PokemonState(
      {final PokemonStateStatus status,
      final List<Pokemon> pokemons,
      final List<BasicPokemon> basicPokemons,
      final int selectedPokemonIndex,
      final int page,
      final bool canLoadMore,
      final Exception? error}) = _$PokemonStateImpl;
  const _PokemonState._() : super._();

  @override
  PokemonStateStatus get status;
  @override
  List<Pokemon> get pokemons;
  @override
  List<BasicPokemon> get basicPokemons;
  @override
  int get selectedPokemonIndex;
  @override
  int get page;
  @override
  bool get canLoadMore;
  @override
  Exception? get error;

  /// Create a copy of PokemonState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonStateImplCopyWith<_$PokemonStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
