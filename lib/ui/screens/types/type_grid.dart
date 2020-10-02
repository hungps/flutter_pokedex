import 'package:flutter/material.dart';
import 'package:pokedex/configs/types.dart';
import 'package:pokedex/ui/screens/types/type_card.dart';

class TypeEffectGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Expanded(
      child: GridView.builder(
        itemCount: types.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (builder, i) {
          return TypeEffectCard(width: w, i: i);
        },
      ),
    );
  }
}
