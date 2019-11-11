import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pokedex/data/pokemons.dart';

class Pokemon {
  const Pokemon({
    @required this.id,
    @required this.name,
    @required this.image,
    this.types = const [],
    @required this.about,
    @required this.height,
    @required this.weight,
    @required this.evolutions,
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
    @required this.baseExp
  });

  final String id;
  final String name;
  final String image;
  final List<String> types;
  final String about;
  final String height;
  final String weight;
  final List<String> evolutions;
  final String category;
  final int attack;
  final int defense;
  final int specialDefense;
  final int specialAttack;
  final int speed;
  final int hp;
  final int total;
  final String femalePercentage;
  final String malePercentage;
  final bool genderless ;
  final String cycles;
  final String eggGroups;
  final String baseExp;
  Color get color => getPokemonColor(types[0]);

  Pokemon.fromJson(dynamic json)
      : id = json["id"],
        name = json["name"],
        image = json["imageurl"],
        types = json["typeofpokemon"].cast<String>(),
        about = json["xdescription"],
        height = json["height"],
        weight = json["weight"],
        evolutions = json["evolutions"].cast<String>(),
        category = json["category"],
        hp = json['hp'],
        attack= json['attack'],
        defense= json['defense'],
        speed=json['speed'],
        specialDefense=json['special_defense'],
        specialAttack = json['special_attack'],
        total = json['total'],
        malePercentage =json['male_percentage'],
        femalePercentage=json['female_percentage'],
        genderless = json['genderless']==1 ? true :false,
        cycles = json['cycles'],
        eggGroups =json['egg_groups'],
        baseExp= json['base_exp'];
}
