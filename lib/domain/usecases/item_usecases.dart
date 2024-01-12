import 'package:injectable/injectable.dart';
import 'package:pokedex/core/usecase.dart';
import 'package:pokedex/data/repositories/item_repository.dart';
import 'package:pokedex/domain/entities/item.dart';

@singleton
class GetItemUseCase extends NoParamsUseCase<List<Item>> {
  final ItemRepository _itemRepository;

  const GetItemUseCase({
    required ItemRepository itemRepository,
  }) : _itemRepository = itemRepository;

  @override
  Future<List<Item>> call() {
    return _itemRepository.getAllItems();
  }
}
