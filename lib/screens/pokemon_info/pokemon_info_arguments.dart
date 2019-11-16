import 'package:flutter/cupertino.dart';

import '../../models/pokemon.dart';

class PokemonInfoArguments extends ChangeNotifier {
  PokemonInfoArguments({this.index, this.pokemons});

  int index;
  final List<Pokemon> pokemons;

  void setIndex(int changedIndex) {
    index = changedIndex;
    notifyListeners();
  }
}
