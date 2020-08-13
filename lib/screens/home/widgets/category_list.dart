import 'package:flutter/cupertino.dart';

import '../../../data/categories.dart';
import '../../../widgets/poke_category_card.dart';

class CategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final screenSize = MediaQuery.of(context).size;

    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2.58,
        crossAxisSpacing: 10,
        mainAxisSpacing: 12,
      ),
      padding: EdgeInsets.only(left: 28, right: 28, bottom: 25),
      itemCount: categories.length,
      itemBuilder: (context, index) => PokeCategoryCard(
        categories[index],
        onPress: () => Navigator.of(context).pushNamed("/pokedex"),
      ),
    );
  }
}
