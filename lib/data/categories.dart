import 'package:pokedex/data/entities/category.dart';
import 'package:pokedex/presenter/navigation/routes.dart';
import 'package:pokedex/presenter/themes/colors.dart';

const List<Category> categories = [
  Category(name: 'Pokedex', color: AppColors.teal, route: Routes.pokedex),
  Category(name: 'Moves', color: AppColors.red, route: Routes.pokedex),
  Category(name: 'Abilities', color: AppColors.blue, route: Routes.pokedex),
  Category(name: 'Items', color: AppColors.yellow, route: Routes.items),
  Category(name: 'Locations', color: AppColors.purple, route: Routes.pokedex),
  Category(name: 'Type Effects', color: AppColors.brown, route: Routes.typeEffects),
];
