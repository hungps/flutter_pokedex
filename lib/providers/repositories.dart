part of 'providers.dart';

final pokemonRepositoryProvider = Provider<PokemonRepository>((ref) {
  final githubDataSource = ref.read(githubSourceProvider);
  final localDataSource = ref.read(localSourceProvider);

  return PokemonDefaultRepository(
    githubDataSource: githubDataSource,
    localDataSource: localDataSource,
  );
});
