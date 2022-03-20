import 'package:pokedex/domain/entities/item.dart';

enum ItemStateStatus {
  initial,
  loading,
  loadSuccess,
  loadFailure,
  loadingMore,
  loadMoreSuccess,
  loadMoreFailure,
}

class ItemState {
  final ItemStateStatus status;
  final List<Item> items;
  final int selectedItemIndex;
  final int page;
  final Exception? error;
  final bool canLoadMore;

  Item get selectedItem => items[selectedItemIndex];

  const ItemState._({
    this.status = ItemStateStatus.initial,
    this.items = const [],
    this.selectedItemIndex = 0,
    this.page = 1,
    this.canLoadMore = true,
    this.error,
  });

  const ItemState.initial() : this._();

  ItemState asLoading() {
    return copyWith(
      status: ItemStateStatus.loading,
    );
  }

  ItemState asLoadSuccess(List<Item> items, {bool canLoadMore = true}) {
    return copyWith(
      status: ItemStateStatus.loadSuccess,
      items: items,
      page: 1,
      canLoadMore: canLoadMore,
    );
  }

  ItemState asLoadFailure(Exception e) {
    return copyWith(
      status: ItemStateStatus.loadFailure,
      error: e,
    );
  }

  ItemState asLoadingMore() {
    return copyWith(status: ItemStateStatus.loadingMore);
  }

  ItemState asLoadMoreSuccess(List<Item> newItems, {bool canLoadMore = true}) {
    return copyWith(
      status: ItemStateStatus.loadMoreSuccess,
      items: [...items, ...newItems],
      page: canLoadMore ? page + 1 : page,
      canLoadMore: canLoadMore,
    );
  }

  ItemState asLoadMoreFailure(Exception e) {
    return copyWith(
      status: ItemStateStatus.loadMoreFailure,
      error: e,
    );
  }

  ItemState copyWith({
    ItemStateStatus? status,
    List<Item>? items,
    int? selectedPokemonIndex,
    int? page,
    bool? canLoadMore,
    Exception? error,
  }) {
    return ItemState._(
      status: status ?? this.status,
      items: items ?? this.items,
      selectedItemIndex: selectedItemIndex,
      page: page ?? this.page,
      canLoadMore: canLoadMore ?? this.canLoadMore,
      error: error ?? this.error,
    );
  }
}
