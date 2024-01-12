// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_generation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PokemonGeneration _$PokemonGenerationFromJson(Map<String, dynamic> json) {
  return _PokemonGeneration.fromJson(json);
}

/// @nodoc
mixin _$PokemonGeneration {
  String get title => throw _privateConstructorUsedError;
  List<String> get pokemonImages => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PokemonGenerationCopyWith<PokemonGeneration> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonGenerationCopyWith<$Res> {
  factory $PokemonGenerationCopyWith(
          PokemonGeneration value, $Res Function(PokemonGeneration) then) =
      _$PokemonGenerationCopyWithImpl<$Res, PokemonGeneration>;
  @useResult
  $Res call({String title, List<String> pokemonImages});
}

/// @nodoc
class _$PokemonGenerationCopyWithImpl<$Res, $Val extends PokemonGeneration>
    implements $PokemonGenerationCopyWith<$Res> {
  _$PokemonGenerationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? pokemonImages = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      pokemonImages: null == pokemonImages
          ? _value.pokemonImages
          : pokemonImages // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PokemonGenerationImplCopyWith<$Res>
    implements $PokemonGenerationCopyWith<$Res> {
  factory _$$PokemonGenerationImplCopyWith(_$PokemonGenerationImpl value,
          $Res Function(_$PokemonGenerationImpl) then) =
      __$$PokemonGenerationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, List<String> pokemonImages});
}

/// @nodoc
class __$$PokemonGenerationImplCopyWithImpl<$Res>
    extends _$PokemonGenerationCopyWithImpl<$Res, _$PokemonGenerationImpl>
    implements _$$PokemonGenerationImplCopyWith<$Res> {
  __$$PokemonGenerationImplCopyWithImpl(_$PokemonGenerationImpl _value,
      $Res Function(_$PokemonGenerationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? pokemonImages = null,
  }) {
    return _then(_$PokemonGenerationImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      pokemonImages: null == pokemonImages
          ? _value._pokemonImages
          : pokemonImages // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonGenerationImpl
    with DiagnosticableTreeMixin
    implements _PokemonGeneration {
  const _$PokemonGenerationImpl(
      {required this.title, required final List<String> pokemonImages})
      : _pokemonImages = pokemonImages;

  factory _$PokemonGenerationImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonGenerationImplFromJson(json);

  @override
  final String title;
  final List<String> _pokemonImages;
  @override
  List<String> get pokemonImages {
    if (_pokemonImages is EqualUnmodifiableListView) return _pokemonImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pokemonImages);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PokemonGeneration(title: $title, pokemonImages: $pokemonImages)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PokemonGeneration'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('pokemonImages', pokemonImages));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonGenerationImpl &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality()
                .equals(other._pokemonImages, _pokemonImages));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, title, const DeepCollectionEquality().hash(_pokemonImages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonGenerationImplCopyWith<_$PokemonGenerationImpl> get copyWith =>
      __$$PokemonGenerationImplCopyWithImpl<_$PokemonGenerationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonGenerationImplToJson(
      this,
    );
  }
}

abstract class _PokemonGeneration implements PokemonGeneration {
  const factory _PokemonGeneration(
      {required final String title,
      required final List<String> pokemonImages}) = _$PokemonGenerationImpl;

  factory _PokemonGeneration.fromJson(Map<String, dynamic> json) =
      _$PokemonGenerationImpl.fromJson;

  @override
  String get title;
  @override
  List<String> get pokemonImages;
  @override
  @JsonKey(ignore: true)
  _$$PokemonGenerationImplCopyWith<_$PokemonGenerationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
