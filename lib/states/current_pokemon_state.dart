part of 'states.dart';

class CurrentPokemonState with ChangeNotifier {
  final GetPokemonUseCase _getPokemonUseCase;

  int index;
  Pokemon pokemon;

  CurrentPokemonState(this._getPokemonUseCase);

  void setPokemon(int newIndex, Pokemon newPokemon) async {
    index = newIndex;
    pokemon = await _getPokemonUseCase(GetPokemonParam(newPokemon.number));
    notifyListeners();
  }
}
