part of 'states.dart';

class PokemonListState with ChangeNotifier {
  static const int _itemsPerPage = 20;

  PokemonListState(this._getPokemonsUseCase, this._getAllPokemonsUseCase);

  final GetPokemonsUseCase _getPokemonsUseCase;
  final GetAllPokemonsUseCase _getAllPokemonsUseCase;

  int page = 1;
  bool loading = true;
  bool canLoadMore = true;
  bool isError = false;
  List<Pokemon> pokemons = [];

  void getAllPokemons() async {
    isError = false;
    loading = true;
    notifyListeners();

    try {
      pokemons = await _getAllPokemonsUseCase();
    } catch (e) {
      isError = true;
    }

    loading = false;
    notifyListeners();
  }

  void getPokemons({bool reset = false}) async {
    if (reset) {
      page = 1;
      canLoadMore = true;
      pokemons = [];
    }

    isError = false;
    loading = true;
    notifyListeners();

    try {
      final newPokemons = await _getPokemonsUseCase(
        GetPokemonsParams(page: page, limit: _itemsPerPage),
      );

      pokemons = [...pokemons, ...newPokemons];
      canLoadMore = newPokemons.length >= _itemsPerPage;

      if (canLoadMore) {
        page++;
      }
    } catch (e) {
      isError = true;
      canLoadMore = false;
    }

    loading = false;

    notifyListeners();
  }
}
