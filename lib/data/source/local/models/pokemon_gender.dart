import 'package:hive/hive.dart';

part 'pokemon_gender.g.dart';

@HiveType(typeId: 2)
class PokemonGenderHiveModel extends HiveObject {
  static const String boxKey = 'pokemonGender';

  @HiveField(0)
  bool genderless = false;

  @HiveField(1)
  double male = 0;

  @HiveField(2)
  double female = 0;
}
