part of 'providers.dart';

final githubSourceProvider = Provider<GithubDataSource>((ref) {
  final networkManager = ref.read(networkProvider);

  return GithubDataSource(networkManager);
});

final localSourceProvider = Provider<LocalDataSource>((_) {
  return LocalDataSource();
});
