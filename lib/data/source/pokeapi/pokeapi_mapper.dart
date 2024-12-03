import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/data/entities/pagination.dart';
import 'package:pokedex/data/entities/pokemon.dart';
import 'package:pokedex/data/entities/pokemon_properties.dart';
import 'package:pokedex/data/entities/pokemon_types.dart';
import 'package:pokedex/data/source/pokeapi/models/pagination.dart';
import 'package:pokedex/data/source/pokeapi/models/pokemon.dart';
import 'package:pokedex/data/source/pokeapi/models/pokemon_species.dart';

@singleton
class PokeApiMapper {
  final PokeApiPokemonMapper pokemon;
  final PokeApiPaginationMapper pagination;

  PokeApiMapper({
    required Locale locale,
  })  : pokemon = PokeApiPokemonMapper(locale: locale),
        pagination = const PokeApiPaginationMapper();
}

class PokeApiPokemonMapper {
  final Locale _locale;

  const PokeApiPokemonMapper({
    required Locale locale,
  }) : _locale = locale;

  BasicPokemon toBasicPokemon(
    PokeApiPokemon model,
    PokeApiPokemonSpecies species,
  ) {
    return BasicPokemon(
      id: model.name,
      name: species.names
              .firstWhereOrNull((e) => e.language.name == _locale.languageCode)
              ?.name ??
          model.name,
      number: '#${model.order.toString().padLeft(3, '0')}',
      image: model.sprites.other.officialArtwork.frontDefault,
      types: model.types
          .map((type) => PokemonTypes.parse(type.type.name))
          .toList(),
    );
  }

  Pokemon toPokemon(PokeApiPokemon pokemon, PokeApiPokemonSpecies species) {
    return Pokemon(
      number: "#${pokemon.order.toString().padLeft(3, '0')}",
      name: pokemon.name,
      description: species.flavorTextEntries
              .firstWhereOrNull((e) => e.language.name == _locale.languageCode)
              ?.flavorText ??
          '',
      types: pokemon.types.map((e) => PokemonTypes.parse(e.type.name)).toList(),
      image: pokemon.sprites.other.officialArtwork.frontDefault,
      height: pokemon.height.toString(),
      weight: pokemon.weight.toString(),
      genera: species.genera
              .firstWhereOrNull((e) => e.language.name == _locale.languageCode)
              ?.genus ??
          '',
      eggGroups: species.eggGroups.map((e) => e.name).toList(),
      gender: PokemonGender(
        genderless: species.genderRate == -1,
        maleRate: 1 - species.genderRate / 8,
        femaleRate: species.genderRate / 8,
      ),
      stats: PokemonStats(
        hp: pokemon.stats
                .firstWhereOrNull((e) => e.stat.name == 'hp')
                ?.baseStat ??
            0,
        speed: pokemon.stats
                .firstWhereOrNull((e) => e.stat.name == 'speed')
                ?.baseStat ??
            0,
        attack: pokemon.stats
                .firstWhereOrNull((e) => e.stat.name == 'attack')
                ?.baseStat ??
            0,
        defense: pokemon.stats
                .firstWhereOrNull((e) => e.stat.name == 'defense')
                ?.baseStat ??
            0,
        specialAttack: pokemon.stats
                .firstWhereOrNull((e) => e.stat.name == 'special-attack')
                ?.baseStat ??
            0,
        specialDefense: pokemon.stats
                .firstWhereOrNull((e) => e.stat.name == 'special-defense')
                ?.baseStat ??
            0,
      ),
      baseExp: pokemon.baseExperience.toDouble(),
      evolutions: [],
      evolutionReason: '',
    );
  }
}

class PokeApiPaginationMapper {
  const PokeApiPaginationMapper();

  PokeApiPagination fromPagination(Pagination pagination) {
    return PokeApiPagination(
      offset: (pagination.page - 1) * pagination.itemsPerPage,
      limit: pagination.itemsPerPage,
    );
  }
}
