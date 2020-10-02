import 'package:flutter/foundation.dart';

// Class that describes type and its effect from various types
class EffectiveType {
  const EffectiveType({
    @required this.name,
    @required this.superEffective,
    @required this.notEffective,
    @required this.immune,
  });

  final String name;
  final List<String> superEffective;
  final List<String> notEffective;
  final List<String> immune;
}
