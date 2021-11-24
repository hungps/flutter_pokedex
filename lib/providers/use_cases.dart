part of 'providers.dart';

final searchPokemonUseCaseProvider = Provider<SearchPokemonUseCase>((ref) {
  final pokemonRepository = ref.watch(pokemonRepositoryProvider);

  return SearchPokemonUseCase(pokemonRepository);
});

final getPokemonUseCaseProvider = Provider<GetPokemonUseCase>((ref) {
  final pokemonRepository = ref.watch(pokemonRepositoryProvider);

  return GetPokemonUseCase(pokemonRepository);
});

final getPokemonsUseCaseProvider = Provider<GetPokemonsUseCase>((ref) {
  final pokemonRepository = ref.watch(pokemonRepositoryProvider);

  return GetPokemonsUseCase(pokemonRepository);
});
