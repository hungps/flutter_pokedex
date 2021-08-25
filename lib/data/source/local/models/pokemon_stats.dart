import 'package:hive/hive.dart';

part 'pokemon_stats.g.dart';

@HiveType(typeId: 3)
class PokemonStatsHiveModel extends HiveObject {
  static const String boxKey = 'pokemonStats';

  @HiveField(0)
  int attack = 0;

  @HiveField(1)
  int specialAttack = 0;

  @HiveField(2)
  int defense = 0;

  @HiveField(3)
  int specialDefense = 0;

  @HiveField(4)
  int hp = 0;

  @HiveField(5)
  int speed = 0;
}
