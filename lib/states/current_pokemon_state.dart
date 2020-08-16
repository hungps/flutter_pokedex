part of 'states.dart';

class CurrentPokemonState with ChangeNotifier {
  CurrentPokemonState(this._getPokemonUseCase);

  final GetPokemonUseCase _getPokemonUseCase;

  int index;
  Pokemon pokemon;

  void setPokemon(int newIndex, Pokemon newPokemon) async {
    index = newIndex;
    pokemon = await _getPokemonUseCase(GetPokemonParam(newPokemon.number));
    notifyListeners();
  }
}
