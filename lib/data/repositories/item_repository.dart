import 'package:pokedex/data/source/github/github_datasource.dart';
import 'package:pokedex/data/source/local/local_datasource.dart';
import 'package:pokedex/data/source/mappers/github_to_local_mapper.dart';
import 'package:pokedex/data/source/mappers/local_to_entity_mapper.dart';
import 'package:pokedex/domain/entities/item.dart';

abstract class ItemRepository {
  Future<List<Item>> getItems();
}

class ItemDefaultRepository extends ItemRepository {
  ItemDefaultRepository({this.githubDataSource, this.localDataSource});

  final GithubDataSource githubDataSource;
  final LocalDataSource localDataSource;

  @override
  Future<List<Item>> getItems() async {
    final hasCachedData = await localDataSource.hasData();

    if (!hasCachedData) {
      final itemGithubModel = await githubDataSource.getItems();
      final itemHiveModels = itemGithubModel.map((e) => e.toHiveModel());

      await localDataSource.saveItems(itemHiveModels);
    }

    final itemHiveModels = await localDataSource.getItems();
    final itemEntities =
        itemHiveModels.where((element) => element != null).map((e) => e.toEntity()).toList();

    return itemEntities;
  }
}
