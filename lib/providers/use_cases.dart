part of 'providers.dart';

final SearchPokemonsUseCaseProvider = Provider<SearchPokemonsUseCase>((ref) {
  final pokemonRepository = ref.watch(pokemonRepositoryProvider);

  return SearchPokemonsUseCase(pokemonRepository);
});

final getPokemonUseCaseProvider = Provider<GetPokemonUseCase>((ref) {
  final pokemonRepository = ref.watch(pokemonRepositoryProvider);

  return GetPokemonUseCase(pokemonRepository);
});

final getPokemonsUseCaseProvider = Provider<GetPokemonsUseCase>((ref) {
  final pokemonRepository = ref.watch(pokemonRepositoryProvider);

  return GetPokemonsUseCase(pokemonRepository);
});

final getAllPokemonsUseCaseProvider = Provider<GetAllPokemonsUseCase>((ref) {
  final pokemonRepository = ref.watch(pokemonRepositoryProvider);

  return GetAllPokemonsUseCase(pokemonRepository);
});
