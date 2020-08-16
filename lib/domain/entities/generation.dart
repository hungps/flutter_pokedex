import 'package:flutter/foundation.dart';

class Generation {
  const Generation({
    @required this.title,
    @required this.pokemons,
  });

  final List<String> pokemons;
  final String title;
}
