import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:pokedex/data/repositories/pokemon_repository.dart';
import 'package:pokedex/states/pokemon/pokemon_event.dart';
import 'package:pokedex/states/pokemon/pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  static const int pokemonsPerPage = 20;

  final PokemonRepository _pokemonRepository;

  PokemonBloc(this._pokemonRepository) : super(PokemonState.initial()) {
    on<PokemonLoadStarted>(
      _onLoadStarted,
      transformer: (events, mapper) => events.switchMap(mapper),
    );
    on<PokemonLoadMoreStarted>(
      _onLoadMoreStarted,
      transformer: (events, mapper) => events.switchMap(mapper),
    );
    on<PokemonSelectChanged>(_onSelectChanged);
  }

  void _onLoadStarted(PokemonLoadStarted event, Emitter<PokemonState> emit) async {
    try {
      emit(state.asLoading());

      final pokemons = event.loadAll
          ? await _pokemonRepository.getAllPokemons()
          : await _pokemonRepository.getPokemons(page: 1, limit: pokemonsPerPage);

      final canLoadMore = pokemons.length >= pokemonsPerPage;

      emit(state.asLoadSuccess(pokemons, canLoadMore: canLoadMore));
    } on Exception catch (e) {
      emit(state.asLoadFailure(e));
    }
  }

  void _onLoadMoreStarted(PokemonLoadMoreStarted event, Emitter<PokemonState> emit) async {
    try {
      if (!state.canLoadMore) return;

      emit(state.asLoadingMore());

      final pokemons = await _pokemonRepository.getPokemons(
        page: state.page + 1,
        limit: pokemonsPerPage,
      );

      final canLoadMore = pokemons.length >= pokemonsPerPage;

      emit(state.asLoadMoreSuccess(pokemons, canLoadMore: canLoadMore));
    } on Exception catch (e) {
      emit(state.asLoadMoreFailure(e));
    }
  }

  void _onSelectChanged(PokemonSelectChanged event, Emitter<PokemonState> emit) async {
    try {
      final pokemonIndex = state.pokemons.indexWhere(
        (pokemon) => pokemon.number == event.pokemonId,
      );

      if (pokemonIndex < 0 || pokemonIndex >= state.pokemons.length) return;

      final pokemon = await _pokemonRepository.getPokemon(event.pokemonId);

      if (pokemon == null) return;

      emit(state.copyWith(
        pokemons: state.pokemons..setAll(pokemonIndex, [pokemon]),
        selectedPokemonIndex: pokemonIndex,
      ));
    } on Exception catch (e) {
      emit(state.asLoadMoreFailure(e));
    }
  }
}
