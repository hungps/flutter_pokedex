import '../configs/AppColors.dart';
import '../models/category.dart';

// Consistds of Caregories present in the home page which users can access into. For now, all lead to the Pokedex
const List<Category> categories = [
  Category(name: "Pokedex", color: AppColors.teal),
  Category(name: "Moves", color: AppColors.red),
  Category(name: "Abilities", color: AppColors.blue),
  Category(name: "Items", color: AppColors.yellow),
  Category(name: "Locations", color: AppColors.purple),
  Category(name: "Type Charts", color: AppColors.brown),
];
