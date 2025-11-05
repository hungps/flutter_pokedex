import 'package:injectable/injectable.dart';
import 'package:pokedex/data/repositories/item_repository.dart';
import 'package:pokedex/data/source/github/github_datasource.dart';
import 'package:pokedex/data/source/local/local_datasource.dart';
import 'package:pokedex/data/source/mappers/github_to_local_mapper.dart';
import 'package:pokedex/data/source/mappers/local_to_entity_mapper.dart';
import 'package:pokedex/data/entities/item.dart';

@Singleton(as: ItemRepository)
class DefaultItemRepository extends ItemRepository {
  final GithubDataSource _githubDataSource;
  final LocalDataSource _localDataSource;

  const DefaultItemRepository({
    required GithubDataSource githubDataSource,
    required LocalDataSource localDataSource,
  })  : _githubDataSource = githubDataSource,
        _localDataSource = localDataSource;

  @override
  Future<List<Item>> getAllItems() async {
    final hasCachedData = await _localDataSource.hasData();

    if (!hasCachedData) {
      final itemGithubModel = await _githubDataSource.getItems();
      final itemHiveModels = itemGithubModel.map((e) => e.toHiveModel());

      await _localDataSource.saveItems(itemHiveModels);
    }

    final itemHiveModels = await _localDataSource.getAllItems();
    final itemEntities = itemHiveModels.map((e) => e.toEntity()).toList();

    return itemEntities;
  }

  @override
  Future<List<Item>> getItems({required int limit, required int page}) async {
    final hasCachedData = await _localDataSource.hasItemData();

    if (!hasCachedData) {
      final itemGithubModels = await _githubDataSource.getItems();
      final itemHiveModels = itemGithubModels.map((e) => e.toHiveModel());

      await _localDataSource.saveItems(itemHiveModels);
    }

    final itemHiveModels = await _localDataSource.getItems(
      page: page,
      limit: limit,
    );
    final itemEntities = itemHiveModels.map((e) => e.toEntity()).toList();

    return itemEntities;
  }
}
