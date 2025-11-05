import 'package:injectable/injectable.dart';
import 'package:pokedex/data/repositories/item_repository.dart';
import 'package:pokedex/data/source/pokeapi/pokeapi_datasource.dart';
import 'package:pokedex/data/source/local/local_datasource.dart';
import 'package:pokedex/data/source/mappers/pokeapi_to_local_mapper.dart';
import 'package:pokedex/data/source/mappers/local_to_entity_mapper.dart';
import 'package:pokedex/data/entities/item.dart';

@Singleton(as: ItemRepository)
class ItemDefaultRepository extends ItemRepository {
  static const int maxItemId = 842; // Based on current dataset

  final PokeApiDataSource _pokeApiDataSource;
  final LocalDataSource _localDataSource;

  const ItemDefaultRepository({
    required PokeApiDataSource pokeApiDataSource,
    required LocalDataSource localDataSource,
  })  : _pokeApiDataSource = pokeApiDataSource,
        _localDataSource = localDataSource;

  @override
  Future<List<Item>> getAllItems() async {
    final hasCachedData = await _localDataSource.hasItemData();

    if (!hasCachedData) {
      // Fetch first batch of items to populate the cache
      await _fetchItemBatch(1, 50);
    }

    final itemHiveModels = await _localDataSource.getAllItems();
    final itemEntities = itemHiveModels.map((e) => e.toEntity()).toList();

    return itemEntities;
  }

  @override
  Future<List<Item>> getItems({required int limit, required int page}) async {
    // Calculate which item IDs we need
    final start = (page - 1) * limit + 1;
    final end = start + limit - 1;

    // Ensure we have this range cached
    await _ensureItemRangeCached(start, end);

    final itemHiveModels = await _localDataSource.getItems(
      page: page,
      limit: limit,
    );
    final itemEntities = itemHiveModels.map((e) => e.toEntity()).toList();

    return itemEntities;
  }

  Future<void> _ensureItemRangeCached(int start, int end) async {
    final endId = end > maxItemId ? maxItemId : end;

    // Check if we already have this range
    final itemCount = (await _localDataSource.getAllItems()).length;
    
    // If we have fewer items than requested end, fetch more
    if (itemCount < endId) {
      await _fetchItemBatch(start, endId);
    }
  }

  Future<void> _fetchItemBatch(int startId, int endId) async {
    final actualEndId = endId > maxItemId ? maxItemId : endId;

    for (int id = startId; id <= actualEndId; id++) {
      await _fetchAndCacheItem(id);
    }
  }

  Future<void> _fetchAndCacheItem(int id) async {
    try {
      final item = await _pokeApiDataSource.getItem(id);

      // Convert to Hive model
      final hiveModel = PokeApiToLocalMapper.itemToHiveModel(item);

      // Save to local storage
      final currentItems = await _localDataSource.getAllItems();
      final itemsMap = {for (var i in currentItems) i.name: i};
      itemsMap[hiveModel.name] = hiveModel;
      await _localDataSource.saveItems(itemsMap.values);
    } catch (e) {
      print('Error fetching Item $id: $e');
      // Continue even if one item fails
    }
  }
}
