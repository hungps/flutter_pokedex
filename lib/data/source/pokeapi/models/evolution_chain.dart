import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex/data/source/pokeapi/models/pokemon.dart';

part 'evolution_chain.g.dart';

@JsonSerializable()
class PokeApiEvolutionChainModel {
  PokeApiEvolutionChainModel({
    required this.id,
    required this.babyTriggerItem,
    required this.chain,
  });

  factory PokeApiEvolutionChainModel.fromJson(Map<String, dynamic> json) =>
      _$PokeApiEvolutionChainModelFromJson(json);

  Map<String, dynamic> toJson() => _$PokeApiEvolutionChainModelToJson(this);

  final int id;

  @JsonKey(name: 'baby_trigger_item')
  final NamedApiResource? babyTriggerItem;

  final ChainLink chain;
}

@JsonSerializable()
class ChainLink {
  ChainLink({
    required this.isBaby,
    required this.species,
    required this.evolutionDetails,
    required this.evolvesTo,
  });

  factory ChainLink.fromJson(Map<String, dynamic> json) => _$ChainLinkFromJson(json);

  Map<String, dynamic> toJson() => _$ChainLinkToJson(this);

  @JsonKey(name: 'is_baby')
  final bool isBaby;

  final NamedApiResource species;

  @JsonKey(name: 'evolution_details')
  final List<EvolutionDetail> evolutionDetails;

  @JsonKey(name: 'evolves_to')
  final List<ChainLink> evolvesTo;
}

@JsonSerializable()
class EvolutionDetail {
  EvolutionDetail({
    required this.item,
    required this.trigger,
    required this.gender,
    required this.heldItem,
    required this.knownMove,
    required this.knownMoveType,
    required this.location,
    required this.minLevel,
    required this.minHappiness,
    required this.minBeauty,
    required this.minAffection,
    required this.needsOverworldRain,
    required this.partySpecies,
    required this.partyType,
    required this.relativePhysicalStats,
    required this.timeOfDay,
    required this.tradeSpecies,
    required this.turnUpsideDown,
  });

  factory EvolutionDetail.fromJson(Map<String, dynamic> json) =>
      _$EvolutionDetailFromJson(json);

  Map<String, dynamic> toJson() => _$EvolutionDetailToJson(this);

  final NamedApiResource? item;
  final NamedApiResource trigger;
  final int? gender;

  @JsonKey(name: 'held_item')
  final NamedApiResource? heldItem;

  @JsonKey(name: 'known_move')
  final NamedApiResource? knownMove;

  @JsonKey(name: 'known_move_type')
  final NamedApiResource? knownMoveType;

  final NamedApiResource? location;

  @JsonKey(name: 'min_level')
  final int? minLevel;

  @JsonKey(name: 'min_happiness')
  final int? minHappiness;

  @JsonKey(name: 'min_beauty')
  final int? minBeauty;

  @JsonKey(name: 'min_affection')
  final int? minAffection;

  @JsonKey(name: 'needs_overworld_rain')
  final bool needsOverworldRain;

  @JsonKey(name: 'party_species')
  final NamedApiResource? partySpecies;

  @JsonKey(name: 'party_type')
  final NamedApiResource? partyType;

  @JsonKey(name: 'relative_physical_stats')
  final int? relativePhysicalStats;

  @JsonKey(name: 'time_of_day')
  final String timeOfDay;

  @JsonKey(name: 'trade_species')
  final NamedApiResource? tradeSpecies;

  @JsonKey(name: 'turn_upside_down')
  final bool turnUpsideDown;
}
