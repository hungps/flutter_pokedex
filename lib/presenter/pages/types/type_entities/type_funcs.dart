import 'package:pokedex/data/types.dart';
import 'package:pokedex/presenter/pages/types/type_entities/type_constants.dart';

// A function that returns a list of types of pokemon that when attacked to, hit normally
List<String> normalTypeReturner(List<String> combined) {
  var normalSet = typeNames.toSet(); // Create a set from the constant list of types
  for (var i = 0; i < combined.length; i++) {
    if (normalSet.contains(combined[i].toLowerCase())) {
      normalSet.remove(combined[i].toLowerCase());
    }
  } // Removes the types that are already present as super/weak/nil effective from the set
  return normalSet.toList();
}

// A function that return the required list depending on the number given
List<String> effectreturner(int i, dynamic n) {
  if (n == 0) {
    return types[i].nilEffective;
  } else if (n == 1) {
    return normalTypeReturner(
        types[i].nilEffective + types[i].superEffective + types[i].notEffective);
  } else if (n == 0.5) {
    return types[i].notEffective;
  } else {
    return types[i].superEffective;
  }
}
