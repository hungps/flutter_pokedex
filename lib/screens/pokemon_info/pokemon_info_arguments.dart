import 'package:flutter/cupertino.dart';

import '../../models/pokemon.dart';
import '../../models/pokemon.dart';
import 'pokemon_info.dart';

class PokemonInfoArguments extends ChangeNotifier
{
  int index;
  final List<Pokemon> pokemons;
  PokemonInfoArguments({this.index,this.pokemons});
  void setIndex(int changedIndex)
  {

    index=changedIndex;
    notifyListeners();
  }
}