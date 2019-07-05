import 'package:flutter/material.dart';

class Pokemon {
  final String name;
  final List<String> types;
  final String image;
  final Color color;

  const Pokemon({
    @required this.name,
    this.types = const [],
    @required this.image,
    @required this.color,
  });
}
