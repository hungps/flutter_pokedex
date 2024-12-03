import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/core/exceptions.dart';
import 'package:pokedex/data/entities/pagination.dart';
import 'package:pokedex/data/usecases/get_basic_pokemon_use_case.dart';
import 'package:pokedex/data/usecases/pokemon_usecases.dart';
import 'package:pokedex/presenter/pages/pokedex/pokedex_event.dart';
import 'package:pokedex/presenter/pages/pokedex/pokedex_state.dart';

@injectable
class PokedexBloc extends Bloc<PokedexEvent, PokedexState> {
  final GetBasicPokemonsUseCase _getBasicPokemons;

  PokedexBloc({
    required GetPokemonsUseCase getPokemonsUseCase,
    required GetBasicPokemonsUseCase getBasicPokemonsUseCase,
  })  : _getBasicPokemons = getBasicPokemonsUseCase,
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

    const pagination = Pagination(page: 1);
    final pokemons = await _getBasicPokemons(pagination);

    if (emit.isDone) return;

    emit(state.copyWith(
      status: PokedexStatus.loaded,
      pokemons: pokemons,
      pagination: pagination,
      canLoadMore: pokemons.length >= pagination.itemsPerPage,
    ));
  }

  FutureOr<void> _onFetchMorePokemonsStarted(
    PokedexFetchMorePokemonsStarted event,
    Emitter<PokedexState> emit,
  ) async {
    emit(state.copyWith(
      status: PokedexStatus.loadingMore,
    ));

    final pagination = state.pagination.copyWith(
      page: state.pagination.page + 1,
    );

    final newPokemons = await _getBasicPokemons(pagination);

    if (emit.isDone) return;

    emit(state.copyWith(
      status: PokedexStatus.loaded,
      pokemons: [...state.pokemons, ...newPokemons],
      pagination: pagination,
      canLoadMore: newPokemons.length >= state.pagination.itemsPerPage,
    ));
  }
}
