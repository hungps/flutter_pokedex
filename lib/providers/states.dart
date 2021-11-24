part of 'providers.dart';

final currentPokemonStateProvider = ChangeNotifierProvider<CurrentPokemonState>((ref) {
  final getPokemonUseCase = ref.watch(getPokemonUseCaseProvider);

  return CurrentPokemonState(getPokemonUseCase);
});

final pokemonsStateProvider = ChangeNotifierProvider<PokemonListState>((ref) {
  final getPokemonsUseCase = ref.watch(getPokemonsUseCaseProvider);

  return PokemonListState(getPokemonsUseCase);
});

final itemStateProvider = ChangeNotifierProvider<ItemListState>((ref) {
  final getItemUseCase = ref.watch(getItemsUseCaseProvider);

  return ItemListState(getItemUseCase);
});
