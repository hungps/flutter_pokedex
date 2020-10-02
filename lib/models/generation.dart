import 'package:flutter/foundation.dart';

// A class created to store the generations of pokemons
class Generation {
  const Generation({@required this.title, @required this.pokemons});

  final List<String> pokemons;
  final String title;
}
