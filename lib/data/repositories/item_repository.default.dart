import 'package:injectable/injectable.dart';
import 'package:pokedex/data/repositories/item_repository.dart';
import 'package:pokedex/data/source/pokeapi/pokeapi_datasource.dart';
import 'package:pokedex/data/source/local/local_datasource.dart';
import 'package:pokedex/data/source/mappers/pokeapi_to_local_mapper.dart';
import 'package:pokedex/data/source/mappers/local_to_entity_mapper.dart';
import 'package:pokedex/data/entities/item.dart';

@Singleton(as: ItemRepository)
class ItemDefaultRepository extends ItemRepository {
  static const int maxItemId = 842;

  final PokeApiDataSource _pokeApiDataSource;
  final LocalDataSource _localDataSource;

  const ItemDefaultRepository({
    required PokeApiDataSource pokeApiDataSource,
    required LocalDataSource localDataSource,
  })  : _pokeApiDataSource = pokeApiDataSource,
        _localDataSource = localDataSource;

  @override
  Future<List<Item>> getAllItems() async {
    final itemHiveModels = await _localDataSource.getAllItems();
    final itemEntities = itemHiveModels.map((e) => e.toEntity()).toList();

    return itemEntities;
  }

  @override
  Future<List<Item>> getItems({required int limit, required int page}) async {
    final start = (page - 1) * limit + 1;
    final end = start + limit - 1;
    final actualEnd = end > maxItemId ? maxItemId : end;

    final itemList = <Item>[];
    
    for (int id = start; id <= actualEnd; id++) {
      final item = await _getItem(id);
      
      if (item != null) {
        itemList.add(item);
      }
    }

    return itemList;
  }

  Future<Item?> _getItem(int id) async {
    try {
      final apiItem = await _pokeApiDataSource.getItem(id);
      final hiveModel = PokeApiToLocalMapper.itemToHiveModel(apiItem);
      
      final allItems = await _localDataSource.getAllItems();
      
      final existingItem = allItems.where((i) => i.name == hiveModel.name).firstOrNull;
      
      if (existingItem == null) {
        final itemsMap = {for (var i in allItems) i.name: i};
        itemsMap[hiveModel.name] = hiveModel;
        await _localDataSource.saveItems(itemsMap.values);
        
        return hiveModel.toEntity();
      }
      
      return existingItem.toEntity();
    } catch (e) {
      print('Error fetching Item $id: $e');
      return null;
    }
  }
}
