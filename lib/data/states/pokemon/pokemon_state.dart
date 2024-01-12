import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex/data/entities/pokemon.dart';

part 'pokemon_state.freezed.dart';

enum PokemonStateStatus {
  initial,
  loading,
  loadingMore,
  success,
  failure,
}

@freezed
class PokemonState with _$PokemonState {
  const factory PokemonState({
    @Default(PokemonStateStatus.initial) PokemonStateStatus status,
    @Default([]) List<Pokemon> pokemons,
    @Default(0) int selectedPokemonIndex,
    @Default(1) int page,
    @Default(true) bool canLoadMore,
    Exception? error,
  }) = _PokemonState;

  const PokemonState._();

  Pokemon get selectedPokemon => pokemons[selectedPokemonIndex];
}
