import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex/data/source/pokeapi/models/pokemon.dart';

part 'pokemon_species.g.dart';

@JsonSerializable()
class PokeApiPokemonSpeciesModel {
  PokeApiPokemonSpeciesModel({
    required this.id,
    required this.name,
    required this.order,
    required this.genderRate,
    required this.captureRate,
    required this.baseHappiness,
    required this.isBaby,
    required this.isLegendary,
    required this.isMythical,
    required this.hatchCounter,
    required this.hasGenderDifferences,
    required this.formsSwitchable,
    required this.growthRate,
    required this.pokedexNumbers,
    required this.eggGroups,
    required this.color,
    required this.shape,
    required this.evolvesFromSpecies,
    required this.evolutionChain,
    required this.habitat,
    required this.generation,
    required this.names,
    required this.flavorTextEntries,
    required this.formDescriptions,
    required this.genera,
    required this.varieties,
  });

  factory PokeApiPokemonSpeciesModel.fromJson(Map<String, dynamic> json) =>
      _$PokeApiPokemonSpeciesModelFromJson(json);

  Map<String, dynamic> toJson() => _$PokeApiPokemonSpeciesModelToJson(this);

  final int id;
  final String name;
  final int order;

  @JsonKey(name: 'gender_rate')
  final int genderRate;

  @JsonKey(name: 'capture_rate')
  final int captureRate;

  @JsonKey(name: 'base_happiness')
  final int? baseHappiness;

  @JsonKey(name: 'is_baby')
  final bool isBaby;

  @JsonKey(name: 'is_legendary')
  final bool isLegendary;

  @JsonKey(name: 'is_mythical')
  final bool isMythical;

  @JsonKey(name: 'hatch_counter')
  final int? hatchCounter;

  @JsonKey(name: 'has_gender_differences')
  final bool hasGenderDifferences;

  @JsonKey(name: 'forms_switchable')
  final bool formsSwitchable;

  @JsonKey(name: 'growth_rate')
  final NamedApiResource growthRate;

  @JsonKey(name: 'pokedex_numbers')
  final List<PokemonSpeciesDexEntry> pokedexNumbers;

  @JsonKey(name: 'egg_groups')
  final List<NamedApiResource> eggGroups;

  final NamedApiResource color;
  final NamedApiResource? shape;

  @JsonKey(name: 'evolves_from_species')
  final NamedApiResource? evolvesFromSpecies;

  @JsonKey(name: 'evolution_chain')
  final ApiResource? evolutionChain;

  final NamedApiResource? habitat;
  final NamedApiResource generation;
  final List<Name> names;

  @JsonKey(name: 'flavor_text_entries')
  final List<FlavorText> flavorTextEntries;

  @JsonKey(name: 'form_descriptions')
  final List<Description> formDescriptions;

  final List<Genus> genera;
  final List<PokemonSpeciesVariety> varieties;
}

@JsonSerializable()
class PokemonSpeciesDexEntry {
  PokemonSpeciesDexEntry({
    required this.entryNumber,
    required this.pokedex,
  });

  factory PokemonSpeciesDexEntry.fromJson(Map<String, dynamic> json) =>
      _$PokemonSpeciesDexEntryFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonSpeciesDexEntryToJson(this);

  @JsonKey(name: 'entry_number')
  final int entryNumber;

  final NamedApiResource pokedex;
}

@JsonSerializable()
class Name {
  Name({
    required this.name,
    required this.language,
  });

  factory Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);

  Map<String, dynamic> toJson() => _$NameToJson(this);

  final String name;
  final NamedApiResource language;
}

@JsonSerializable()
class FlavorText {
  FlavorText({
    required this.flavorText,
    required this.language,
    required this.version,
  });

  factory FlavorText.fromJson(Map<String, dynamic> json) => _$FlavorTextFromJson(json);

  Map<String, dynamic> toJson() => _$FlavorTextToJson(this);

  @JsonKey(name: 'flavor_text')
  final String flavorText;

  final NamedApiResource language;
  final NamedApiResource version;
}

@JsonSerializable()
class Description {
  Description({
    required this.description,
    required this.language,
  });

  factory Description.fromJson(Map<String, dynamic> json) => _$DescriptionFromJson(json);

  Map<String, dynamic> toJson() => _$DescriptionToJson(this);

  final String description;
  final NamedApiResource language;
}

@JsonSerializable()
class Genus {
  Genus({
    required this.genus,
    required this.language,
  });

  factory Genus.fromJson(Map<String, dynamic> json) => _$GenusFromJson(json);

  Map<String, dynamic> toJson() => _$GenusToJson(this);

  final String genus;
  final NamedApiResource language;
}

@JsonSerializable()
class PokemonSpeciesVariety {
  PokemonSpeciesVariety({
    required this.isDefault,
    required this.pokemon,
  });

  factory PokemonSpeciesVariety.fromJson(Map<String, dynamic> json) =>
      _$PokemonSpeciesVarietyFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonSpeciesVarietyToJson(this);

  @JsonKey(name: 'is_default')
  final bool isDefault;

  final NamedApiResource pokemon;
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
