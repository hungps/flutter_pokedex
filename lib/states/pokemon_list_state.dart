part of 'states.dart';

class PokemonListState with ChangeNotifier {
  static const int _itemsPerPage = 20;

  final GetPokemonsUseCase _getPokemonsUseCase;

  int page = 1;
  bool loading = true;
  bool canLoadMore = true;
  List<Pokemon> pokemons = [];

  PokemonListState(this._getPokemonsUseCase);

  void getPokemons({bool reset = false}) async {
    if (reset) {
      page = 1;
      canLoadMore = true;
      pokemons = [];
    }

    loading = true;
    notifyListeners();

    final newPokemons = await _getPokemonsUseCase(
      GetPokemonsParams(page: page, limit: _itemsPerPage),
    );

    pokemons = [...pokemons, ...newPokemons];
    canLoadMore = newPokemons.length >= _itemsPerPage;
    loading = false;

    if (canLoadMore) {
      page++;
    }
    notifyListeners();
  }
}
