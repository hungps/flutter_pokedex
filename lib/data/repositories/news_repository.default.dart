import 'package:injectable/injectable.dart';
import 'package:pokedex/data/entities/news.dart';
import 'package:pokedex/data/repositories/news_repository.dart';

@Singleton(as: NewsRepository)
class DefaultNewsRepository extends NewsRepository {
  @override
  Future<List<News>> getAllNews() async {
    return List.filled(
      10,
      News(
        title: 'Pokémon Rumble Rush Arrives Soon',
        postedAt: DateTime(2019, 5, 15),
        thumbnail: 'assets/images/thumbnail.png',
      ),
    );
  }
}
