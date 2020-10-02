import 'package:flutter/cupertino.dart';

import '../../../data/categories.dart';
import '../../../widgets/poke_category_card.dart';

class CategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
// The six options displayed in the home screen is built using this builder method
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2.58,
        crossAxisSpacing: 10,
        mainAxisSpacing: 12,
      ),
      padding: EdgeInsets.only(left: 28, right: 28, bottom: 30),
      itemCount: categories.length,
      itemBuilder: (context, index) => PokeCategoryCard(
        categories[index],
        // For now, all the grid buttons lead you to the pokedex list rather than some other screen
        onPress: () => Navigator.of(context).pushNamed("/pokedex"),
      ),
    );
  }
}
