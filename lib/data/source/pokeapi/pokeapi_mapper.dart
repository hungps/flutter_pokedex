import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/data/entities/pagination.dart';
import 'package:pokedex/data/entities/pokemon.dart';
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
