// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PokeApiPokemonType _$PokeApiPokemonTypeFromJson(Map<String, dynamic> json) {
  return _PokeApiPokemonType.fromJson(json);
}

/// @nodoc
mixin _$PokeApiPokemonType {
  @JsonKey(name: 'slot')
  int get slot => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  PokeApiNamedApiResource get type => throw _privateConstructorUsedError;

  /// Serializes this PokeApiPokemonType to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokeApiPokemonType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokeApiPokemonTypeCopyWith<PokeApiPokemonType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokeApiPokemonTypeCopyWith<$Res> {
  factory $PokeApiPokemonTypeCopyWith(
          PokeApiPokemonType value, $Res Function(PokeApiPokemonType) then) =
      _$PokeApiPokemonTypeCopyWithImpl<$Res, PokeApiPokemonType>;
  @useResult
  $Res call(
      {@JsonKey(name: 'slot') int slot,
      @JsonKey(name: 'type') PokeApiNamedApiResource type});

  $PokeApiNamedApiResourceCopyWith<$Res> get type;
}

/// @nodoc
class _$PokeApiPokemonTypeCopyWithImpl<$Res, $Val extends PokeApiPokemonType>
    implements $PokeApiPokemonTypeCopyWith<$Res> {
  _$PokeApiPokemonTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokeApiPokemonType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slot = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      slot: null == slot
          ? _value.slot
          : slot // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PokeApiNamedApiResource,
    ) as $Val);
  }

  /// Create a copy of PokeApiPokemonType
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PokeApiNamedApiResourceCopyWith<$Res> get type {
    return $PokeApiNamedApiResourceCopyWith<$Res>(_value.type, (value) {
      return _then(_value.copyWith(type: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PokeApiPokemonTypeImplCopyWith<$Res>
    implements $PokeApiPokemonTypeCopyWith<$Res> {
  factory _$$PokeApiPokemonTypeImplCopyWith(_$PokeApiPokemonTypeImpl value,
          $Res Function(_$PokeApiPokemonTypeImpl) then) =
      __$$PokeApiPokemonTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'slot') int slot,
      @JsonKey(name: 'type') PokeApiNamedApiResource type});

  @override
  $PokeApiNamedApiResourceCopyWith<$Res> get type;
}

/// @nodoc
class __$$PokeApiPokemonTypeImplCopyWithImpl<$Res>
    extends _$PokeApiPokemonTypeCopyWithImpl<$Res, _$PokeApiPokemonTypeImpl>
    implements _$$PokeApiPokemonTypeImplCopyWith<$Res> {
  __$$PokeApiPokemonTypeImplCopyWithImpl(_$PokeApiPokemonTypeImpl _value,
      $Res Function(_$PokeApiPokemonTypeImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokeApiPokemonType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slot = null,
    Object? type = null,
  }) {
    return _then(_$PokeApiPokemonTypeImpl(
      slot: null == slot
          ? _value.slot
          : slot // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PokeApiNamedApiResource,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokeApiPokemonTypeImpl
    with DiagnosticableTreeMixin
    implements _PokeApiPokemonType {
  const _$PokeApiPokemonTypeImpl(
      {@JsonKey(name: 'slot') required this.slot,
      @JsonKey(name: 'type') required this.type});

  factory _$PokeApiPokemonTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokeApiPokemonTypeImplFromJson(json);

  @override
  @JsonKey(name: 'slot')
  final int slot;
  @override
  @JsonKey(name: 'type')
  final PokeApiNamedApiResource type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PokeApiPokemonType(slot: $slot, type: $type)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PokeApiPokemonType'))
      ..add(DiagnosticsProperty('slot', slot))
      ..add(DiagnosticsProperty('type', type));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokeApiPokemonTypeImpl &&
            (identical(other.slot, slot) || other.slot == slot) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, slot, type);

  /// Create a copy of PokeApiPokemonType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokeApiPokemonTypeImplCopyWith<_$PokeApiPokemonTypeImpl> get copyWith =>
      __$$PokeApiPokemonTypeImplCopyWithImpl<_$PokeApiPokemonTypeImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokeApiPokemonTypeImplToJson(
      this,
    );
  }
}

abstract class _PokeApiPokemonType implements PokeApiPokemonType {
  const factory _PokeApiPokemonType(
          {@JsonKey(name: 'slot') required final int slot,
          @JsonKey(name: 'type') required final PokeApiNamedApiResource type}) =
      _$PokeApiPokemonTypeImpl;

  factory _PokeApiPokemonType.fromJson(Map<String, dynamic> json) =
      _$PokeApiPokemonTypeImpl.fromJson;

  @override
  @JsonKey(name: 'slot')
  int get slot;
  @override
  @JsonKey(name: 'type')
  PokeApiNamedApiResource get type;

  /// Create a copy of PokeApiPokemonType
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokeApiPokemonTypeImplCopyWith<_$PokeApiPokemonTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
