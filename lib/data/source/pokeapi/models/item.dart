import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex/data/source/pokeapi/models/pokemon.dart';

part 'item.g.dart';

@JsonSerializable()
class PokeApiItemModel {
  PokeApiItemModel({
    required this.id,
    required this.name,
    required this.cost,
    required this.flingPower,
    required this.flingEffect,
    required this.attributes,
    required this.category,
    required this.effectEntries,
    required this.flavorTextEntries,
    required this.gameIndices,
    required this.names,
    required this.sprites,
    required this.heldByPokemon,
    required this.babyTriggerFor,
    required this.machines,
  });

  factory PokeApiItemModel.fromJson(Map<String, dynamic> json) =>
      _$PokeApiItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$PokeApiItemModelToJson(this);

  final int id;
  final String name;
  final int cost;

  @JsonKey(name: 'fling_power')
  final int? flingPower;

  @JsonKey(name: 'fling_effect')
  final NamedApiResource? flingEffect;

  final List<NamedApiResource> attributes;
  final NamedApiResource category;

  @JsonKey(name: 'effect_entries')
  final List<VerboseEffect> effectEntries;

  @JsonKey(name: 'flavor_text_entries')
  final List<VersionGroupFlavorText> flavorTextEntries;

  @JsonKey(name: 'game_indices')
  final List<GenerationGameIndex> gameIndices;

  final List<ItemName> names;
  final ItemSprites sprites;

  @JsonKey(name: 'held_by_pokemon')
  final List<ItemHolderPokemon> heldByPokemon;

  @JsonKey(name: 'baby_trigger_for')
  final ApiResource? babyTriggerFor;

  final List<MachineVersionDetail> machines;
}

@JsonSerializable()
class VerboseEffect {
  VerboseEffect({
    required this.effect,
    required this.shortEffect,
    required this.language,
  });

  factory VerboseEffect.fromJson(Map<String, dynamic> json) =>
      _$VerboseEffectFromJson(json);

  Map<String, dynamic> toJson() => _$VerboseEffectToJson(this);

  final String effect;

  @JsonKey(name: 'short_effect')
  final String shortEffect;

  final NamedApiResource language;
}

@JsonSerializable()
class VersionGroupFlavorText {
  VersionGroupFlavorText({
    required this.text,
    required this.language,
    required this.versionGroup,
  });

  factory VersionGroupFlavorText.fromJson(Map<String, dynamic> json) =>
      _$VersionGroupFlavorTextFromJson(json);

  Map<String, dynamic> toJson() => _$VersionGroupFlavorTextToJson(this);

  final String text;
  final NamedApiResource language;

  @JsonKey(name: 'version_group')
  final NamedApiResource versionGroup;
}

@JsonSerializable()
class GenerationGameIndex {
  GenerationGameIndex({
    required this.gameIndex,
    required this.generation,
  });

  factory GenerationGameIndex.fromJson(Map<String, dynamic> json) =>
      _$GenerationGameIndexFromJson(json);

  Map<String, dynamic> toJson() => _$GenerationGameIndexToJson(this);

  @JsonKey(name: 'game_index')
  final int gameIndex;

  final NamedApiResource generation;
}

@JsonSerializable()
class ItemName {
  ItemName({
    required this.name,
    required this.language,
  });

  factory ItemName.fromJson(Map<String, dynamic> json) => _$ItemNameFromJson(json);

  Map<String, dynamic> toJson() => _$ItemNameToJson(this);

  final String name;
  final NamedApiResource language;
}

@JsonSerializable()
class ItemSprites {
  ItemSprites({
    this.default_,
  });

  factory ItemSprites.fromJson(Map<String, dynamic> json) => _$ItemSpritesFromJson(json);

  Map<String, dynamic> toJson() => _$ItemSpritesToJson(this);

  @JsonKey(name: 'default')
  final String? default_;
}

@JsonSerializable()
class ItemHolderPokemon {
  ItemHolderPokemon({
    required this.pokemon,
    required this.versionDetails,
  });

  factory ItemHolderPokemon.fromJson(Map<String, dynamic> json) =>
      _$ItemHolderPokemonFromJson(json);

  Map<String, dynamic> toJson() => _$ItemHolderPokemonToJson(this);

  final NamedApiResource pokemon;

  @JsonKey(name: 'version_details')
  final List<ItemHolderPokemonVersionDetail> versionDetails;
}

@JsonSerializable()
class ItemHolderPokemonVersionDetail {
  ItemHolderPokemonVersionDetail({
    required this.rarity,
    required this.version,
  });

  factory ItemHolderPokemonVersionDetail.fromJson(Map<String, dynamic> json) =>
      _$ItemHolderPokemonVersionDetailFromJson(json);

  Map<String, dynamic> toJson() => _$ItemHolderPokemonVersionDetailToJson(this);

  final int rarity;
  final NamedApiResource version;
}

@JsonSerializable()
class MachineVersionDetail {
  MachineVersionDetail({
    required this.machine,
    required this.versionGroup,
  });

  factory MachineVersionDetail.fromJson(Map<String, dynamic> json) =>
      _$MachineVersionDetailFromJson(json);

  Map<String, dynamic> toJson() => _$MachineVersionDetailToJson(this);

  final ApiResource machine;

  @JsonKey(name: 'version_group')
  final NamedApiResource versionGroup;
}

@JsonSerializable()
class ApiResource {
  ApiResource({
    required this.url,
  });

  factory ApiResource.fromJson(Map<String, dynamic> json) => _$ApiResourceFromJson(json);

  Map<String, dynamic> toJson() => _$ApiResourceToJson(this);

  final String url;
}
