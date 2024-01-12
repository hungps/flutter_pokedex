abstract class ItemEvent {
  const ItemEvent();
}

class ItemLoadStarted extends ItemEvent {
  final bool loadAll;

  const ItemLoadStarted({this.loadAll = false});
}

class ItemLoadMoreStarted extends ItemEvent {}

class ItemSelectChanged extends ItemEvent {
  final String itemId;

  const ItemSelectChanged({required this.itemId});
}
