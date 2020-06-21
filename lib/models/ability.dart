import 'package:flutter/foundation.dart';

class Ability {
  const Ability({
    @required this.id,
    @required this.name,
    @required this.description,
    @required this.longDescription,
    @required this.generationIntroduced,
    @required this.pokemonFirstAbility,
    @required this.pokemonSecondAbility,
    @required this.pokemonHiddenAbility,
});

  final int id;
  final String name;
  final String description;
  final String longDescription;
  final int generationIntroduced;
  final List<String> pokemonFirstAbility;
  final List<String> pokemonSecondAbility;
  final List<String> pokemonHiddenAbility;
}