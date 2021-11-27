part of 'states.dart';

class SearchPokemonsState with ChangeNotifier {

  SearchPokemonsState(this._searchPokemonsUseCase);

  final SearchPokemonsUseCase _searchPokemonsUseCase;

  bool loading = true;
  bool isError = false;
  List<Pokemon> pokemons = [];

  void searchPokemons(String pokemonName) async {
    isError = false;
    loading = true;
    notifyListeners();

    try {
      pokemons = await _searchPokemonsUseCase(
        SearchPokemonsParams(pokemonName: pokemonName),
      );
    } catch (e) {
      isError = true;
    }

    loading = false;
    notifyListeners();
  }
}