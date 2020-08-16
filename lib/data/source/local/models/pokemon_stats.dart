import 'package:hive/hive.dart';

part 'pokemon_stats.g.dart';

@HiveType(typeId: 3)
class PokemonStatsHiveModel extends HiveObject {
  static const String boxKey = 'pokemonStats';

  @HiveField(0)
  int attack;

  @HiveField(1)
  int specialAttack;

  @HiveField(2)
  int defense;

  @HiveField(3)
  int specialDefense;

  @HiveField(4)
  int hp;

  @HiveField(5)
  int speed;
}
