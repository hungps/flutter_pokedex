part of 'providers.dart';

final currentPokemonStateProvider = ChangeNotifierProvider<CurrentPokemonState>((ref) {
  final getPokemonUseCase = ref.watch(getPokemonUseCaseProvider);

  return CurrentPokemonState(getPokemonUseCase);
});

final pokemonsStateProvider = ChangeNotifierProvider<PokemonListState>((ref) {
  final getPokemonsUseCase = ref.watch(getPokemonsUseCaseProvider);
  final SearchPokemonsUseCase = ref.watch(SearchPokemonsUseCaseProvider);

  return PokemonListState(getPokemonsUseCase, SearchPokemonsUseCase);
});
