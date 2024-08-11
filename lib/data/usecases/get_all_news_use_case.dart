import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:pokedex/core/usecase.dart';
import 'package:pokedex/data/entities/news.dart';
import 'package:pokedex/data/repositories/news_repository.dart';

abstract class GetAllNewsUseCase extends UseCase<List<News>, void> {
  @override
  FutureOr<List<News>> call([void params]);
}

@Singleton(as: GetAllNewsUseCase)
class DefaultGetAllNewsUseCase extends GetAllNewsUseCase {
  final NewsRepository _newsRepository;

  DefaultGetAllNewsUseCase({
    required NewsRepository newsRepository,
  }) : _newsRepository = newsRepository;

  @override
  FutureOr<List<News>> call([void params]) async {
    await Future.delayed(const Duration(seconds: 1));
    return _newsRepository.getAllNews();
  }
}
