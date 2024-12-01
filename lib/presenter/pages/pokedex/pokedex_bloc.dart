import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/core/exceptions.dart';
import 'package:pokedex/data/usecases/pokemon_usecases.dart';
import 'package:pokedex/presenter/pages/pokedex/pokedex_event.dart';
import 'package:pokedex/presenter/pages/pokedex/pokedex_state.dart';

@injectable
class PokedexBloc extends Bloc<PokedexEvent, PokedexState> {
  final GetPokemonsUseCase _getPokemons;

  PokedexBloc({
    required GetPokemonsUseCase getPokemonsUseCase,
  })  : _getPokemons = getPokemonsUseCase,
        super(const PokedexState()) {
    on<PokedexFetchPokemonsStarted>(_onFetchPokemonsStarted,
        transformer: droppable());
    on<PokedexFetchMorePokemonsStarted>(_onFetchMorePokemonsStarted,
        transformer: droppable());
    on<PokedexErrorOccurred>(_onErrorOccurred);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    add(PokedexErrorOccurred(AppException.from(error)));
    super.onError(error, stackTrace);
  }

  FutureOr<void> _onErrorOccurred(
    PokedexErrorOccurred event,
    Emitter<PokedexState> emit,
  ) {
    emit(state.copyWith(
      status: PokedexStatus.failure,
      error: event.error,
    ));
  }

  FutureOr<void> _onFetchPokemonsStarted(
    PokedexFetchPokemonsStarted event,
    Emitter<PokedexState> emit,
  ) async {
    emit(state.copyWith(
      status: PokedexStatus.loading,
    ));

    final pokemons = await _getPokemons(GetPokemonsParams(
      page: 1,
      limit: state.pokemonsPerPage,
    ));

    if (emit.isDone) return;

    emit(state.copyWith(
      status: PokedexStatus.loaded,
      pokemons: pokemons,
      page: 1,
      canLoadMore: pokemons.length >= state.pokemonsPerPage,
    ));
  }

  FutureOr<void> _onFetchMorePokemonsStarted(
    PokedexFetchMorePokemonsStarted event,
    Emitter<PokedexState> emit,
  ) async {
    emit(state.copyWith(
      status: PokedexStatus.loadingMore,
    ));

    final nextPage = state.page + 1;

    final newPokemons = await _getPokemons(GetPokemonsParams(
      page: nextPage,
      limit: state.pokemonsPerPage,
    ));

    if (emit.isDone) return;

    emit(state.copyWith(
      status: PokedexStatus.loaded,
      pokemons: [...state.pokemons, ...newPokemons],
      page: nextPage,
      canLoadMore: newPokemons.length >= state.pokemonsPerPage,
    ));
  }
}
