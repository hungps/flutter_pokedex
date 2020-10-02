import 'package:pokedex/configs/colors.dart';
import 'package:pokedex/domain/entities/category.dart';
import 'package:pokedex/routes.dart';

const List<Category> categories = [
  Category(name: 'Pokedex', color: AppColors.teal, route: Routes.pokedex),
  Category(name: 'Moves', color: AppColors.red, route: Routes.pokedex),
  Category(name: 'Abilities', color: AppColors.blue, route: Routes.pokedex),
  Category(name: 'Items', color: AppColors.yellow, route: Routes.pokedex),
  Category(name: 'Locations', color: AppColors.purple, route: Routes.pokedex),
  Category(name: 'Type Effects', color: AppColors.brown, route: Routes.typeEffects),
];
