import 'package:flutter/material.dart';
import 'package:pokedex/presenter/themes/colors.dart';

// A class that generates Bold Texts required for the individual types icon
class BoldText extends StatelessWidget {
  const BoldText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.whiteGrey, shadows: [
        Shadow(
            // bottomLeft
            offset: Offset(-1, -1),
            color: Colors.black),
        Shadow(
            // bottomRight
            offset: Offset(1, -1),
            color: Colors.black),
        Shadow(
            // topRight
            offset: Offset(1, 1),
            color: Colors.black),
        Shadow(
            // topLeft
            offset: Offset(-1, 1),
            color: Colors.black),
      ]),
      textAlign: TextAlign.center,
    );
  }
}
