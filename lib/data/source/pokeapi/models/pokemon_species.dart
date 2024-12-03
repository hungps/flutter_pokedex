import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex/data/source/pokeapi/models/flavor_text.dart';
import 'package:pokedex/data/source/pokeapi/models/genus.dart';
import 'package:pokedex/data/source/pokeapi/models/name.dart';
import 'package:pokedex/data/source/pokeapi/models/named_api_resource.dart';
import 'package:pokedex/data/source/pokeapi/models/pokemon_species_dex_entry.dart';

part 'pokemon_species.freezed.dart';
part 'pokemon_species.g.dart';

@freezed
class PokeApiPokemonSpecies with _$PokeApiPokemonSpecies {
  const factory PokeApiPokemonSpecies({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'order') required int order,
    @JsonKey(name: 'gender_rate') required int genderRate,
    @JsonKey(name: 'egg_groups')
    required List<PokeApiNamedApiResource> eggGroups,
    @JsonKey(name: 'color') required PokeApiNamedApiResource color,
    @JsonKey(name: 'generation') required PokeApiNamedApiResource generation,
    @JsonKey(name: 'names') required List<PokeApiName> names,
    @JsonKey(name: 'flavor_text_entries')
    required List<PokeApiFlavorText> flavorTextEntries,
    @JsonKey(name: 'genera') required List<PokeApiGenus> genera,
  }) = _PokeApiPokemonSpecies;

  factory PokeApiPokemonSpecies.fromJson(Map<String, dynamic> json) =>
      _$PokeApiPokemonSpeciesFromJson(json);
}
