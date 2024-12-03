// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flavor_text.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PokeApiFlavorText _$PokeApiFlavorTextFromJson(Map<String, dynamic> json) {
  return _PokeApiFlavorText.fromJson(json);
}

/// @nodoc
mixin _$PokeApiFlavorText {
  @JsonKey(name: 'flavor_text')
  String get flavorText => throw _privateConstructorUsedError;
  @JsonKey(name: 'language')
  PokeApiNamedApiResource get language => throw _privateConstructorUsedError;

  /// Serializes this PokeApiFlavorText to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PokeApiFlavorText
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PokeApiFlavorTextCopyWith<PokeApiFlavorText> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokeApiFlavorTextCopyWith<$Res> {
  factory $PokeApiFlavorTextCopyWith(
          PokeApiFlavorText value, $Res Function(PokeApiFlavorText) then) =
      _$PokeApiFlavorTextCopyWithImpl<$Res, PokeApiFlavorText>;
  @useResult
  $Res call(
      {@JsonKey(name: 'flavor_text') String flavorText,
      @JsonKey(name: 'language') PokeApiNamedApiResource language});

  $PokeApiNamedApiResourceCopyWith<$Res> get language;
}

/// @nodoc
class _$PokeApiFlavorTextCopyWithImpl<$Res, $Val extends PokeApiFlavorText>
    implements $PokeApiFlavorTextCopyWith<$Res> {
  _$PokeApiFlavorTextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PokeApiFlavorText
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flavorText = null,
    Object? language = null,
  }) {
    return _then(_value.copyWith(
      flavorText: null == flavorText
          ? _value.flavorText
          : flavorText // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as PokeApiNamedApiResource,
    ) as $Val);
  }

  /// Create a copy of PokeApiFlavorText
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PokeApiNamedApiResourceCopyWith<$Res> get language {
    return $PokeApiNamedApiResourceCopyWith<$Res>(_value.language, (value) {
      return _then(_value.copyWith(language: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PokeApiFlavorTextImplCopyWith<$Res>
    implements $PokeApiFlavorTextCopyWith<$Res> {
  factory _$$PokeApiFlavorTextImplCopyWith(_$PokeApiFlavorTextImpl value,
          $Res Function(_$PokeApiFlavorTextImpl) then) =
      __$$PokeApiFlavorTextImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'flavor_text') String flavorText,
      @JsonKey(name: 'language') PokeApiNamedApiResource language});

  @override
  $PokeApiNamedApiResourceCopyWith<$Res> get language;
}

/// @nodoc
class __$$PokeApiFlavorTextImplCopyWithImpl<$Res>
    extends _$PokeApiFlavorTextCopyWithImpl<$Res, _$PokeApiFlavorTextImpl>
    implements _$$PokeApiFlavorTextImplCopyWith<$Res> {
  __$$PokeApiFlavorTextImplCopyWithImpl(_$PokeApiFlavorTextImpl _value,
      $Res Function(_$PokeApiFlavorTextImpl) _then)
      : super(_value, _then);

  /// Create a copy of PokeApiFlavorText
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flavorText = null,
    Object? language = null,
  }) {
    return _then(_$PokeApiFlavorTextImpl(
      flavorText: null == flavorText
          ? _value.flavorText
          : flavorText // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as PokeApiNamedApiResource,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PokeApiFlavorTextImpl
    with DiagnosticableTreeMixin
    implements _PokeApiFlavorText {
  const _$PokeApiFlavorTextImpl(
      {@JsonKey(name: 'flavor_text') required this.flavorText,
      @JsonKey(name: 'language') required this.language});

  factory _$PokeApiFlavorTextImpl.fromJson(Map<String, dynamic> json) =>
      _$$PokeApiFlavorTextImplFromJson(json);

  @override
  @JsonKey(name: 'flavor_text')
  final String flavorText;
  @override
  @JsonKey(name: 'language')
  final PokeApiNamedApiResource language;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PokeApiFlavorText(flavorText: $flavorText, language: $language)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PokeApiFlavorText'))
      ..add(DiagnosticsProperty('flavorText', flavorText))
      ..add(DiagnosticsProperty('language', language));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokeApiFlavorTextImpl &&
            (identical(other.flavorText, flavorText) ||
                other.flavorText == flavorText) &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, flavorText, language);

  /// Create a copy of PokeApiFlavorText
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PokeApiFlavorTextImplCopyWith<_$PokeApiFlavorTextImpl> get copyWith =>
      __$$PokeApiFlavorTextImplCopyWithImpl<_$PokeApiFlavorTextImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PokeApiFlavorTextImplToJson(
      this,
    );
  }
}

abstract class _PokeApiFlavorText implements PokeApiFlavorText {
  const factory _PokeApiFlavorText(
          {@JsonKey(name: 'flavor_text') required final String flavorText,
          @JsonKey(name: 'language')
          required final PokeApiNamedApiResource language}) =
      _$PokeApiFlavorTextImpl;

  factory _PokeApiFlavorText.fromJson(Map<String, dynamic> json) =
      _$PokeApiFlavorTextImpl.fromJson;

  @override
  @JsonKey(name: 'flavor_text')
  String get flavorText;
  @override
  @JsonKey(name: 'language')
  PokeApiNamedApiResource get language;

  /// Create a copy of PokeApiFlavorText
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PokeApiFlavorTextImplCopyWith<_$PokeApiFlavorTextImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
