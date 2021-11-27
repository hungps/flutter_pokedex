part of 'states.dart';

class AllPokemonListState with ChangeNotifier {

  AllPokemonListState(this._getAllPokemonsUseCase);

  final GetAllPokemonsUseCase _getAllPokemonsUseCase;

  bool loading = true;
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
}