part of 'providers.dart';

final currentPokemonStateProvider = ChangeNotifierProvider<CurrentPokemonState>((ref) {
  final getPokemonUseCase = ref.watch(getPokemonUseCaseProvider);

  return CurrentPokemonState(getPokemonUseCase);
});

final pokemonsStateProvider = ChangeNotifierProvider<PokemonListState>((ref) {
  final getPokemonsUseCase = ref.watch(getPokemonsUseCaseProvider);

  return PokemonListState(getPokemonsUseCase);
});

final allPokemonsStateProvider = ChangeNotifierProvider<AllPokemonListState>((ref) {
  final getAllPokemonsUseCase = ref.watch(getAllPokemonsUseCaseProvider);

  return AllPokemonListState(getAllPokemonsUseCase);
});

final searchPokemonsStateProvider = ChangeNotifierProvider<SearchPokemonsState>((ref) {
  final SearchPokemonsUseCase = ref.watch(SearchPokemonsUseCaseProvider);

  return SearchPokemonsState(SearchPokemonsUseCase);
});
