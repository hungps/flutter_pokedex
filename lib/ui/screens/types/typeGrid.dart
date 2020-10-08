import 'package:flutter/material.dart';
import 'package:pokedex/configs/types.dart';
import 'package:pokedex/ui/screens/types/typeCard.dart';

class TypeGrid extends StatelessWidget {
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
          return TypeCard(w: w, i: i);
        },
      ),
    );
  }
}
