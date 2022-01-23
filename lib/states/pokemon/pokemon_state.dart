import 'package:pokedex/domain/entities/pokemon.dart';

enum PokemonStateStatus {
  initial,
  loading,
  loadSuccess,
  loadFailure,
  loadingMore,
  loadMoreSuccess,
  loadMoreFailure,
}

class PokemonState {
  final PokemonStateStatus status;
  final List<Pokemon> pokemons;
  final int selectedPokemonIndex;
  final int page;
  final Exception? error;
  final bool canLoadMore;

  Pokemon get selectedPokemon => pokemons[selectedPokemonIndex];

  const PokemonState._({
    this.status = PokemonStateStatus.initial,
    this.pokemons = const [],
    this.selectedPokemonIndex = 0,
    this.page = 1,
    this.canLoadMore = true,
    this.error,
  });

  const PokemonState.initial() : this._();

  PokemonState asLoading() {
    return copyWith(
      status: PokemonStateStatus.loading,
    );
  }

  PokemonState asLoadSuccess(List<Pokemon> pokemons, {bool canLoadMore = true}) {
    return copyWith(
      status: PokemonStateStatus.loadSuccess,
      pokemons: pokemons,
      page: 1,
      canLoadMore: canLoadMore,
    );
  }

  PokemonState asLoadFailure(Exception e) {
    return copyWith(
      status: PokemonStateStatus.loadFailure,
      error: e,
    );
  }

  PokemonState asLoadingMore() {
    return copyWith(status: PokemonStateStatus.loadingMore);
  }

  PokemonState asLoadMoreSuccess(List<Pokemon> newPokemons, {bool canLoadMore = true}) {
    return copyWith(
      status: PokemonStateStatus.loadMoreSuccess,
      pokemons: [...pokemons, ...newPokemons],
      page: canLoadMore ? page + 1 : page,
    );
  }

  PokemonState asLoadMoreFailure(Exception e) {
    return copyWith(
      status: PokemonStateStatus.loadMoreFailure,
      error: e,
    );
  }

  PokemonState copyWith({
    PokemonStateStatus? status,
    List<Pokemon>? pokemons,
    int? selectedPokemonIndex,
    int? page,
    bool? canLoadMore,
    Exception? error,
  }) {
    return PokemonState._(
      status: status ?? this.status,
      pokemons: pokemons ?? this.pokemons,
      selectedPokemonIndex: selectedPokemonIndex ?? this.selectedPokemonIndex,
      page: page ?? this.page,
      canLoadMore: canLoadMore ?? this.canLoadMore,
      error: error ?? this.error,
    );
  }
}
