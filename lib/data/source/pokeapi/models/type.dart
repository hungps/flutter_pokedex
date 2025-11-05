import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex/data/source/pokeapi/models/pokemon.dart';

part 'type.g.dart';

@JsonSerializable()
class PokeApiTypeModel {
  PokeApiTypeModel({
    required this.id,
    required this.name,
    required this.damageRelations,
    required this.gameIndices,
    required this.generation,
    required this.moveDamageClass,
    required this.names,
    required this.pokemon,
    required this.moves,
  });

  factory PokeApiTypeModel.fromJson(Map<String, dynamic> json) =>
      _$PokeApiTypeModelFromJson(json);

  Map<String, dynamic> toJson() => _$PokeApiTypeModelToJson(this);

  final int id;
  final String name;

  @JsonKey(name: 'damage_relations')
  final TypeRelations damageRelations;

  @JsonKey(name: 'game_indices')
  final List<GenerationGameIndex> gameIndices;

  final NamedApiResource generation;

  @JsonKey(name: 'move_damage_class')
  final NamedApiResource? moveDamageClass;

  final List<TypeName> names;
  final List<TypePokemon> pokemon;
  final List<NamedApiResource> moves;
}

@JsonSerializable()
class TypeRelations {
  TypeRelations({
    required this.noDamageTo,
    required this.halfDamageTo,
    required this.doubleDamageTo,
    required this.noDamageFrom,
    required this.halfDamageFrom,
    required this.doubleDamageFrom,
  });

  factory TypeRelations.fromJson(Map<String, dynamic> json) =>
      _$TypeRelationsFromJson(json);

  Map<String, dynamic> toJson() => _$TypeRelationsToJson(this);

  @JsonKey(name: 'no_damage_to')
  final List<NamedApiResource> noDamageTo;

  @JsonKey(name: 'half_damage_to')
  final List<NamedApiResource> halfDamageTo;

  @JsonKey(name: 'double_damage_to')
  final List<NamedApiResource> doubleDamageTo;

  @JsonKey(name: 'no_damage_from')
  final List<NamedApiResource> noDamageFrom;

  @JsonKey(name: 'half_damage_from')
  final List<NamedApiResource> halfDamageFrom;

  @JsonKey(name: 'double_damage_from')
  final List<NamedApiResource> doubleDamageFrom;
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
class TypeName {
  TypeName({
    required this.name,
    required this.language,
  });

  factory TypeName.fromJson(Map<String, dynamic> json) => _$TypeNameFromJson(json);

  Map<String, dynamic> toJson() => _$TypeNameToJson(this);

  final String name;
  final NamedApiResource language;
}

@JsonSerializable()
class TypePokemon {
  TypePokemon({
    required this.slot,
    required this.pokemon,
  });

  factory TypePokemon.fromJson(Map<String, dynamic> json) => _$TypePokemonFromJson(json);

  Map<String, dynamic> toJson() => _$TypePokemonToJson(this);

  final int slot;
  final NamedApiResource pokemon;
}
