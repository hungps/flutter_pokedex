part of 'states.dart';

class ItemListState with ChangeNotifier {
  ItemListState(this._getItemsUseCase);

  final GetItemUseCase _getItemsUseCase;

  bool loading = true;
  bool isError = false;
  List<Item> items = [];

  void getItems({bool reset = false}) async {
    if (reset) {
      items = [];
    }

    isError = false;
    loading = true;
    notifyListeners();

    try {
      final newItems = await _getItemsUseCase();
      items = [...items, ...newItems];
    } catch (e) {
      isError = true;
    }

    loading = false;

    notifyListeners();
  }
}
