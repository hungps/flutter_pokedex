import 'package:flutter/material.dart';

class Pokemon {
  final String name;
  final List<String> types;
  final String image;
  final Color color;

  const Pokemon({
    this.name,
    this.types,
    this.image,
    this.color,
  });
}
