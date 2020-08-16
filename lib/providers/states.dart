part of 'providers.dart';

final currentPokemonStateProvider =
    ChangeNotifierProvider<CurrentPokemonState>((ref) {
  final getPokemonUseCase = ref.read(getPokemonUseCaseProvider);

  return CurrentPokemonState(getPokemonUseCase);
});

final pokemonsStateProvider = ChangeNotifierProvider<PokemonListState>((ref) {
  final getPokemonsUseCase = ref.read(getPokemonsUseCaseProvider);

  return PokemonListState(getPokemonsUseCase);
});
