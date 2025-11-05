import 'package:json_annotation/json_annotation.dart';

part 'pokemon.g.dart';

@JsonSerializable()
class PokeApiPokemonModel {
  PokeApiPokemonModel({
    required this.id,
    required this.name,
    required this.height,
    required this.weight,
    required this.baseExperience,
    required this.types,
    required this.stats,
    required this.abilities,
    required this.sprites,
    required this.species,
  });

  factory PokeApiPokemonModel.fromJson(Map<String, dynamic> json) =>
      _$PokeApiPokemonModelFromJson(json);

  Map<String, dynamic> toJson() => _$PokeApiPokemonModelToJson(this);

  @JsonKey(required: true)
  final int id;

  @JsonKey(required: true)
  final String name;

  @JsonKey(required: true)
  final int height;

  @JsonKey(required: true)
  final int weight;

  @JsonKey(name: 'base_experience')
  final int? baseExperience;

  @JsonKey(required: true)
  final List<PokemonTypeSlot> types;

  @JsonKey(required: true)
  final List<PokemonStat> stats;

  @JsonKey(required: true)
  final List<PokemonAbility> abilities;

  @JsonKey(required: true)
  final PokemonSprites sprites;

  @JsonKey(required: true)
  final NamedApiResource species;
}

@JsonSerializable()
class PokemonTypeSlot {
  PokemonTypeSlot({
    required this.slot,
    required this.type,
  });

  factory PokemonTypeSlot.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypeSlotFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonTypeSlotToJson(this);

  final int slot;
  final NamedApiResource type;
}

@JsonSerializable()
class PokemonStat {
  PokemonStat({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  factory PokemonStat.fromJson(Map<String, dynamic> json) =>
      _$PokemonStatFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonStatToJson(this);

  @JsonKey(name: 'base_stat')
  final int baseStat;

  final int effort;
  final NamedApiResource stat;
}

@JsonSerializable()
class PokemonAbility {
  PokemonAbility({
    required this.isHidden,
    required this.slot,
    required this.ability,
  });

  factory PokemonAbility.fromJson(Map<String, dynamic> json) =>
      _$PokemonAbilityFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonAbilityToJson(this);

  @JsonKey(name: 'is_hidden')
  final bool isHidden;

  final int slot;
  final NamedApiResource ability;
}

@JsonSerializable()
class PokemonSprites {
  PokemonSprites({
    this.frontDefault,
    this.other,
  });

  factory PokemonSprites.fromJson(Map<String, dynamic> json) =>
      _$PokemonSpritesFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonSpritesToJson(this);

  @JsonKey(name: 'front_default')
  final String? frontDefault;

  final OtherSprites? other;
}

@JsonSerializable()
class OtherSprites {
  OtherSprites({
    this.officialArtwork,
  });

  factory OtherSprites.fromJson(Map<String, dynamic> json) =>
      _$OtherSpritesFromJson(json);

  Map<String, dynamic> toJson() => _$OtherSpritesToJson(this);

  @JsonKey(name: 'official-artwork')
  final OfficialArtwork? officialArtwork;
}

@JsonSerializable()
class OfficialArtwork {
  OfficialArtwork({
    this.frontDefault,
  });

  factory OfficialArtwork.fromJson(Map<String, dynamic> json) =>
      _$OfficialArtworkFromJson(json);

  Map<String, dynamic> toJson() => _$OfficialArtworkToJson(this);

  @JsonKey(name: 'front_default')
  final String? frontDefault;
}

@JsonSerializable()
class NamedApiResource {
  NamedApiResource({
    required this.name,
    required this.url,
  });

  factory NamedApiResource.fromJson(Map<String, dynamic> json) =>
      _$NamedApiResourceFromJson(json);

  Map<String, dynamic> toJson() => _$NamedApiResourceToJson(this);

  final String name;
  final String url;
}
