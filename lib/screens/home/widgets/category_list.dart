import 'package:flutter/cupertino.dart';
import 'package:pokedex/configs/AppColors.dart';
import 'package:pokedex/widgets/poke_category_card.dart';

class CategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2.44,
        crossAxisSpacing: 10,
        mainAxisSpacing: 12,
      ),
      padding: EdgeInsets.only(left: 28, right: 28, bottom: 58),
      children: <Widget>[
        PokeCategoryCard(
          title: "Pokedex",
          backgroundColor: AppColors.teal,
          shadowColor: AppColors.lightTeal,
        ),
        PokeCategoryCard(
          title: "Moves",
          backgroundColor: AppColors.red,
          shadowColor: AppColors.lightRed,
        ),
        PokeCategoryCard(
          title: "Abilities",
          backgroundColor: AppColors.blue,
          shadowColor: AppColors.lightBlue,
        ),
        PokeCategoryCard(
          title: "Items",
          backgroundColor: AppColors.yellow,
          shadowColor: AppColors.lightYellow,
        ),
        PokeCategoryCard(
          title: "Locations",
          backgroundColor: AppColors.purple,
          shadowColor: AppColors.lightPurple,
        ),
        PokeCategoryCard(
          title: "Type Charts",
          backgroundColor: AppColors.brown,
          shadowColor: AppColors.lightBrown,
        ),
      ],
    );
  }
}
