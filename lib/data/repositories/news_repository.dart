import 'package:pokedex/data/entities/news.dart';

abstract class NewsRepository {
  const NewsRepository();

  Future<List<News>> getAllNews();
}
