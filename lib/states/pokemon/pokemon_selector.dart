import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/states/pokemon/pokemon_bloc.dart';
import 'package:pokedex/states/pokemon/pokemon_state.dart';

class PokemonStateSelector<T> extends BlocSelector<PokemonBloc, PokemonState, T> {
  PokemonStateSelector({
    required T Function(PokemonState) selector,
    required Widget Function(T) builder,
  }) : super(
          selector: selector,
          builder: (_, value) => builder(value),
        );
}

class PokemonStateStatusSelector extends PokemonStateSelector<PokemonStateStatus> {
  PokemonStateStatusSelector(Widget Function(PokemonStateStatus) builder)
      : super(
          selector: (state) => state.status,
          builder: builder,
        );
}

class PokemonCanLoadMoreSelector extends PokemonStateSelector<bool> {
  PokemonCanLoadMoreSelector(Widget Function(bool) builder)
      : super(
          selector: (state) => state.canLoadMore,
          builder: builder,
        );
}

class NumberOfPokemonsSelector extends PokemonStateSelector<int> {
  NumberOfPokemonsSelector(Widget Function(int) builder)
      : super(
          selector: (state) => state.pokemons.length,
          builder: builder,
        );
}

class CurrentPokemonSelector extends PokemonStateSelector<Pokemon> {
  CurrentPokemonSelector(Widget Function(Pokemon) builder)
      : super(
          selector: (state) => state.selectedPokemon,
          builder: builder,
        );
}

class PokemonSelector extends PokemonStateSelector<PokemonSelectorState> {
  PokemonSelector(int index, Widget Function(Pokemon, bool) builder)
      : super(
          selector: (state) => PokemonSelectorState(
            state.pokemons[index],
            state.selectedPokemonIndex == index,
          ),
          builder: (value) => builder(value.pokemon, value.selected),
        );
}

class PokemonSelectorState {
  final Pokemon pokemon;
  final bool selected;

  const PokemonSelectorState(this.pokemon, this.selected);

  @override
  bool operator ==(Object other) =>
      other is PokemonSelectorState && pokemon == other.pokemon && selected == other.selected;
}
