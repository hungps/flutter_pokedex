part of 'providers.dart';

final pokemonRepositoryProvider = Provider<PokemonRepository>((ref) {
  final githubDataSource = ref.watch(githubSourceProvider);
  final localDataSource = ref.watch(localSourceProvider);

  return PokemonDefaultRepository(
    githubDataSource: githubDataSource,
    localDataSource: localDataSource,
  );
});
