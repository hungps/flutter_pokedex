import 'package:flutter/material.dart';
import 'package:pokedex/configs/colors.dart';

// A class that generates Bold Texts required for the individual types icon
class BoldText extends StatelessWidget {
  const BoldText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.whiteGrey, shadows: [
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
