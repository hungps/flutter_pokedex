part of 'providers.dart';

final githubSourceProvider = Provider<GithubDataSource>((ref) {
  final networkManager = ref.watch(networkProvider);

  return GithubDataSource(networkManager);
});

final localSourceProvider = Provider<LocalDataSource>((_) {
  return LocalDataSource();
});
