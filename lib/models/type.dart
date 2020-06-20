import 'package:flutter/foundation.dart';

class Type {

  const Type({@required this.name, @required this.superEffective, @required this.notEffective, @required this.immune});

  final String name;
  final List<String> superEffective;
  final List<String> notEffective;
  final List<String> immune;
}