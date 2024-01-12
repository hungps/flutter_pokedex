import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/data/entities/item.dart';
import 'package:pokedex/data/states/item/item_bloc.dart';
import 'package:pokedex/data/states/item/item_state.dart';

class ItemStateSelector<T> extends BlocSelector<ItemBloc, ItemState, T> {
  ItemStateSelector({
    super.key,
    required super.selector,
    required Widget Function(T) builder,
  }) : super(
          builder: (_, value) => builder(value),
        );
}

class ItemStateStatusSelector extends ItemStateSelector<ItemStateStatus> {
  ItemStateStatusSelector(Widget Function(ItemStateStatus) builder, {super.key})
      : super(
          selector: (state) => state.status,
          builder: builder,
        );
}

class ItemCanLoadMoreSelector extends ItemStateSelector<bool> {
  ItemCanLoadMoreSelector(Widget Function(bool) builder, {super.key})
      : super(
          selector: (state) => state.canLoadMore,
          builder: builder,
        );
}

class NumberOfItemsSelector extends ItemStateSelector<int> {
  NumberOfItemsSelector(Widget Function(int) builder, {super.key})
      : super(
          selector: (state) => state.items.length,
          builder: builder,
        );
}

class CurrentItemSelector extends ItemStateSelector<Item> {
  CurrentItemSelector(Widget Function(Item) builder, {super.key})
      : super(
          selector: (state) => state.selectedItem,
          builder: builder,
        );
}

class ItemSelector extends ItemStateSelector<ItemSelectorState> {
  ItemSelector(int index, Widget Function(Item, bool) builder, {super.key})
      : super(
          selector: (state) => ItemSelectorState(
            state.items[index],
            state.selectedItemIndex == index,
          ),
          builder: (value) => builder(value.item, value.selected),
        );
}

class ItemSelectorState {
  final Item item;
  final bool selected;

  const ItemSelectorState(this.item, this.selected);

  @override
  bool operator ==(Object other) =>
      other is ItemSelectorState && item == other.item && selected == other.selected;

  @override
  int get hashCode => item.hashCode ^ selected.hashCode;
}
