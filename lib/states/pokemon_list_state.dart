part of 'states.dart';

class PokemonListState with ChangeNotifier {
  static const int _itemsPerPage = 20;

  PokemonListState(this._getPokemonsUseCase, this._SearchPokemonsUseCase);

  final GetPokemonsUseCase _getPokemonsUseCase;
  final SearchPokemonsUseCase _SearchPokemonsUseCase;

  int page = 1;
  bool loading = true;
  bool canLoadMore = true;
  bool isError = false;
  List<Pokemon> pokemons = [];

  void searchPokemons(String pokemonName) async {
    isError = false;
    loading = true;
    notifyListeners();

    try {
      pokemons = await _SearchPokemonsUseCase(
        SearchPokemonsParams(pokemonName: pokemonName),
      );
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
