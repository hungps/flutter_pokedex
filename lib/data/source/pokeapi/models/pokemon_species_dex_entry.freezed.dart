// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_species_dex_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PokemonSpeciesDexEntry _$PokemonSpeciesDexEntryFromJson(
    Map<String, dynamic> json) {
  return _PokemonSpeciesDexEntry.fromJson(json);
}

/// @nodoc
mixin _$PokemonSpeciesDexEntry {
  @JsonKey(name: 'entry_number')
  int get entryNumber => throw _privateConstructorUsedError;

  /// Serializes this PokemonSpeciesDexEntry to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokemonSpeciesDexEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokemonSpeciesDexEntryCopyWith<PokemonSpeciesDexEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonSpeciesDexEntryCopyWith<$Res> {
  factory $PokemonSpeciesDexEntryCopyWith(PokemonSpeciesDexEntry value,
          $Res Function(PokemonSpeciesDexEntry) then) =
      _$PokemonSpeciesDexEntryCopyWithImpl<$Res, PokemonSpeciesDexEntry>;
  @useResult
  $Res call({@JsonKey(name: 'entry_number') int entryNumber});
}

/// @nodoc
class _$PokemonSpeciesDexEntryCopyWithImpl<$Res,
        $Val extends PokemonSpeciesDexEntry>
    implements $PokemonSpeciesDexEntryCopyWith<$Res> {
  _$PokemonSpeciesDexEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokemonSpeciesDexEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entryNumber = null,
  }) {
    return _then(_value.copyWith(
      entryNumber: null == entryNumber
          ? _value.entryNumber
          : entryNumber // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PokemonSpeciesDexEntryImplCopyWith<$Res>
    implements $PokemonSpeciesDexEntryCopyWith<$Res> {
  factory _$$PokemonSpeciesDexEntryImplCopyWith(
          _$PokemonSpeciesDexEntryImpl value,
          $Res Function(_$PokemonSpeciesDexEntryImpl) then) =
      __$$PokemonSpeciesDexEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'entry_number') int entryNumber});
}

/// @nodoc
class __$$PokemonSpeciesDexEntryImplCopyWithImpl<$Res>
    extends _$PokemonSpeciesDexEntryCopyWithImpl<$Res,
        _$PokemonSpeciesDexEntryImpl>
    implements _$$PokemonSpeciesDexEntryImplCopyWith<$Res> {
  __$$PokemonSpeciesDexEntryImplCopyWithImpl(
      _$PokemonSpeciesDexEntryImpl _value,
      $Res Function(_$PokemonSpeciesDexEntryImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokemonSpeciesDexEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entryNumber = null,
  }) {
    return _then(_$PokemonSpeciesDexEntryImpl(
      entryNumber: null == entryNumber
          ? _value.entryNumber
          : entryNumber // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokemonSpeciesDexEntryImpl
    with DiagnosticableTreeMixin
    implements _PokemonSpeciesDexEntry {
  const _$PokemonSpeciesDexEntryImpl(
      {@JsonKey(name: 'entry_number') required this.entryNumber});

  factory _$PokemonSpeciesDexEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokemonSpeciesDexEntryImplFromJson(json);

  @override
  @JsonKey(name: 'entry_number')
  final int entryNumber;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PokemonSpeciesDexEntry(entryNumber: $entryNumber)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PokemonSpeciesDexEntry'))
      ..add(DiagnosticsProperty('entryNumber', entryNumber));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonSpeciesDexEntryImpl &&
            (identical(other.entryNumber, entryNumber) ||
                other.entryNumber == entryNumber));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, entryNumber);

  /// Create a copy of PokemonSpeciesDexEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonSpeciesDexEntryImplCopyWith<_$PokemonSpeciesDexEntryImpl>
      get copyWith => __$$PokemonSpeciesDexEntryImplCopyWithImpl<
          _$PokemonSpeciesDexEntryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokemonSpeciesDexEntryImplToJson(
      this,
    );
  }
}

abstract class _PokemonSpeciesDexEntry implements PokemonSpeciesDexEntry {
  const factory _PokemonSpeciesDexEntry(
          {@JsonKey(name: 'entry_number') required final int entryNumber}) =
      _$PokemonSpeciesDexEntryImpl;

  factory _PokemonSpeciesDexEntry.fromJson(Map<String, dynamic> json) =
      _$PokemonSpeciesDexEntryImpl.fromJson;

  @override
  @JsonKey(name: 'entry_number')
  int get entryNumber;

  /// Create a copy of PokemonSpeciesDexEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokemonSpeciesDexEntryImplCopyWith<_$PokemonSpeciesDexEntryImpl>
      get copyWith => throw _privateConstructorUsedError;
}
