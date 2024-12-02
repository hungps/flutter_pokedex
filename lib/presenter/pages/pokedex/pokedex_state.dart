import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex/core/exceptions.dart';
import 'package:pokedex/data/entities/pokemon.dart';

part 'pokedex_state.freezed.dart';

enum PokedexStatus {
  loading,
  loadingMore,
  loaded,
  failure;
}

@freezed
class PokedexState with _$PokedexState {
  const factory PokedexState({
    @Default(PokedexStatus.loading) PokedexStatus status,
    @Default([]) List<BasicPokemon> pokemons,
    @Default(1) int page,
    @Default(20) int pokemonsPerPage,
    @Default(false) bool canLoadMore,
    AppException? error,
  }) = _PokedexState;
}
