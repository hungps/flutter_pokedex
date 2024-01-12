import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/data/repositories/item_repository.dart';
import 'package:pokedex/data/states/item/item_event.dart';
import 'package:pokedex/data/states/item/item_state.dart';
import 'package:stream_transform/stream_transform.dart';

@singleton
class ItemBloc extends Bloc<ItemEvent, ItemState> {
  static const int itemsPerPage = 20;

  final ItemRepository _itemRepository;

  ItemBloc({
    required ItemRepository itemRepository,
  })  : _itemRepository = itemRepository,
        super(const ItemState()) {
    on<ItemLoadStarted>(
      _onLoadStarted,
      transformer: (events, mapper) => events.switchMap(mapper),
    );
    on<ItemLoadMoreStarted>(
      _onLoadMoreStarted,
      transformer: (events, mapper) => events.switchMap(mapper),
    );
  }

  void _onLoadStarted(ItemLoadStarted event, Emitter<ItemState> emit) async {
    try {
      emit(state.copyWith(
        status: ItemStateStatus.loading,
      ));

      final items = event.loadAll
          ? await _itemRepository.getAllItems()
          : await _itemRepository.getItems(page: 1, limit: itemsPerPage);

      final canLoadMore = items.length >= itemsPerPage;

      emit(state.copyWith(
        status: ItemStateStatus.success,
        items: items,
        page: 1,
        canLoadMore: canLoadMore,
      ));
    } on Exception catch (e) {
      emit(state.copyWith(
        status: ItemStateStatus.failure,
        error: e,
      ));
    }
  }

  void _onLoadMoreStarted(ItemLoadMoreStarted event, Emitter<ItemState> emit) async {
    try {
      if (!state.canLoadMore) return;

      emit(state.copyWith(
        status: ItemStateStatus.loadingMore,
      ));

      final items = await _itemRepository.getItems(
        page: state.page + 1,
        limit: itemsPerPage,
      );

      final canLoadMore = items.length >= itemsPerPage;

      emit(state.copyWith(
        status: ItemStateStatus.success,
        items: [...state.items, ...items],
        page: canLoadMore ? state.page + 1 : state.page,
        canLoadMore: canLoadMore,
      ));
    } on Exception catch (e) {
      emit(state.copyWith(
        status: ItemStateStatus.failure,
        error: e,
      ));
    }
  }
}
