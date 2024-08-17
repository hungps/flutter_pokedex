import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/data/entities/pokemon.dart';
import 'package:pokedex/presenter/pages/pokedex/pokedex_bloc.dart';
import 'package:pokedex/presenter/pages/pokedex/pokedex_state.dart';

class PokedexSelector<T> extends BlocSelector<PokedexBloc, PokedexState, T> {
  PokedexSelector({
    super.key,
    required super.selector,
    required Widget Function(T data) builder,
  }) : super(
          builder: (_, state) => builder(state),
        );
}

class PokedexStatusSelector extends PokedexSelector<PokedexStatus> {
  PokedexStatusSelector({
    super.key,
    required super.builder,
  }) : super(
          selector: (state) => state.status,
        );
}

class PokedexPokemonsSelector extends PokedexSelector<List<Pokemon>> {
  PokedexPokemonsSelector({
    super.key,
    required super.builder,
  }) : super(
          selector: (state) => state.pokemons,
        );
}

class PokedexCanLoadMoreSelector extends PokedexSelector<bool> {
  PokedexCanLoadMoreSelector({
    super.key,
    required super.builder,
  }) : super(
          selector: (state) => state.canLoadMore,
        );
}
