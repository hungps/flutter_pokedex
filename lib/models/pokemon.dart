import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/pokemons.dart';

class Pokemon {
  const Pokemon({
    @required this.id,
    this.name,
    this.image,
    this.types = const [],
    this.about,
    this.height,
    this.weight,
    this.category,
    this.hp,
    this.attack,
    this.defense,
    this.specialAttack,
    this.specialDefense,
    this.speed,
    this.total,
    this.malePercentage,
    this.femalePercentage,
    this.genderless,
    this.cycles,
    this.eggGroups,
    this.baseExp,
    this.evolvedFrom,
    this.reason,
    this.evolutions = const [],
  });

  Pokemon.fromJson(dynamic json)
      : id = json["id"],
        name = json["name"],
        image = json["imageurl"],
        types = json["typeofpokemon"].cast<String>(),
        about = json["xdescription"],
        height = json["height"],
        weight = json["weight"],
        category = json["category"],
        hp = json['hp'],
        attack = json['attack'],
        defense = json['defense'],
        speed = json['speed'],
        specialDefense = json['special_defense'],
        specialAttack = json['special_attack'],
        total = json['total'],
        malePercentage = json['male_percentage'],
        femalePercentage = json['female_percentage'],
        genderless = json['genderless'] == 1,
        cycles = json['cycles'],
        eggGroups = json['egg_groups'],
        baseExp = json['base_exp'],
        evolvedFrom = json['evolvedfrom'],
        reason = json['reason'],
        evolutions =
            json['evolutions'].map((id) => Pokemon(id: id as String)).cast<Pokemon>().toList();

  final String about;
  final int attack;
  final String baseExp;
  final String category;
  final String cycles;
  final int defense;
  final String eggGroups;
  final String evolvedFrom;
  final String femalePercentage;
  final bool genderless;
  final String height;
  final int hp;
  final String id;
  final String image;
  final String malePercentage;
  final String name;
  final String reason;
  final int specialAttack;
  final int specialDefense;
  final int speed;
  final int total;
  final List<String> types;
  final String weight;
  final List<Pokemon> evolutions;

  Color get color => getPokemonColor(types[0]);
}

class PokemonModel extends ChangeNotifier {
  final List<Pokemon> _pokemons = [];
  int _selectedIndex = 0;

  UnmodifiableListView<Pokemon> get pokemons => UnmodifiableListView(_pokemons);

  bool get hasData => _pokemons.length > 0;

  Pokemon get pokemon => _pokemons[_selectedIndex];

  int get index => _selectedIndex;

  static PokemonModel of(BuildContext context, {bool listen = false}) =>
      Provider.of<PokemonModel>(context, listen: listen);

  void setPokemons(List<Pokemon> pokemons) {
    _pokemons.clear();
    _pokemons.addAll(pokemons);

    notifyListeners();
  }

  void setSelectedIndex(int index) {
    _selectedIndex = index;

    notifyListeners();
  }
}
