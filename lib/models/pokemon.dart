import 'package:flutter/material.dart';

class Pokemon {
  const Pokemon({
    @required this.name,
    this.types = const [],
    @required this.image,
    @required this.color,
    @required this.id,
    @required this.about,
    @required this.height,
    @required this.weight,
    @required this.evolutions,
    @required this.category
  });

  final Color color;
  final String image;
  final String name;
  final List<String> types;
  final String id;
  final String height;
  final String weight;
  final String category;
  final String about;
  final List<String> evolutions;

}
