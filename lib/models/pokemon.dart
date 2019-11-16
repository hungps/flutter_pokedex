import 'package:flutter/material.dart';

import '../data/pokemons.dart';

class Pokemon {
  const Pokemon({
    @required this.id,
    @required this.name,
    @required this.image,
    this.types = const [],
    @required this.about,
    @required this.height,
    @required this.weight,
    @required this.category,
    @required this.hp,
    @required this.attack,
    @required this.defense,
    @required this.specialAttack,
    @required this.specialDefense,
    @required this.speed,
    @required this.total,
    @required this.malePercentage,
    @required this.femalePercentage,
    @required this.genderless,
    @required this.cycles,
    @required this.eggGroups,
    @required this.baseExp,
    @required this.evolvedFrom,
    @required this.reason,
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
        reason = json['reason'];

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

  Color get color => getPokemonColor(types[0]);
}
