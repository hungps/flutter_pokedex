import 'package:hive/hive.dart';

import 'pokemon_gender.dart';
import 'pokemon_stats.dart';

part 'pokemon.g.dart';

@HiveType(typeId: 1)
class PokemonHiveModel extends HiveObject {
  static const String boxKey = 'pokemon';

  @HiveField(0)
  String number;

  @HiveField(1)
  String name;

  @HiveField(2)
  String description;

  @HiveField(3)
  List<String> types;

  @HiveField(4)
  String image;

  @HiveField(5)
  String height;

  @HiveField(6)
  String weight;

  @HiveField(7)
  String genera;

  @HiveField(8)
  List<String> eggGroups;

  @HiveField(9)
  PokemonGenderHiveModel gender;

  @HiveField(10)
  PokemonStatsHiveModel stats;

  @HiveField(11)
  double baseExp;

  @HiveField(12)
  List<String> evolutions;

  @HiveField(13)
  String evolutionReason;
}
