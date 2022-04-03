import 'package:hive/hive.dart';

part 'item.g.dart';

@HiveType(typeId: 4)
class ItemHiveModel extends HiveObject {
  static const String boxKey = 'item';

  @HiveField(0)
  String? name;

  @HiveField(1)
  String? category;

  @HiveField(2)
  String? imageurl;

  @HiveField(3)
  String? effect;
}
