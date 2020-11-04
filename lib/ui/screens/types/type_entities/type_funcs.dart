import 'package:pokedex/configs/types.dart';
import 'package:pokedex/ui/screens/types/type_entities/type_indices.dart';

List<String> normalTypeReturner(List<String> combined) {
  var normalSet = typeNames.toSet();
  for (var i = 0; i < combined.length; i++) {
    if (normalSet.contains(combined[i].toLowerCase())) {
      normalSet.remove(combined[i].toLowerCase());
    }
  }
  print(normalSet);
  return normalSet.toList();
}

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
