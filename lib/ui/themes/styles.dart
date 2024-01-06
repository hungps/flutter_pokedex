import 'package:flutter/material.dart';

class AppThemeStyles {
  final List<BoxShadow> cardShadow;

  final ButtonStyle buttonSmall;
  final ButtonStyle buttonMedium;
  final ButtonStyle buttonLarge;
  final ButtonStyle buttonText;

  const AppThemeStyles({
    this.cardShadow = const [
      BoxShadow(
        color: Color(0x1F000000),
        offset: Offset(0, 8),
        blurRadius: 23,
      ),
    ],
    this.buttonSmall = const ButtonStyle(
      minimumSize: MaterialStatePropertyAll(Size.zero),
      padding: MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 4, horizontal: 12)),
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6))),
      ),
      textStyle: MaterialStatePropertyAll(
        TextStyle(fontSize: 12, fontWeight: FontWeight.w500, height: 1.3),
      ),
    ),
    this.buttonMedium = const ButtonStyle(
      minimumSize: MaterialStatePropertyAll(Size.zero),
      padding: MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 8, horizontal: 24)),
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
      ),
      textStyle: MaterialStatePropertyAll(
        TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1.5),
      ),
    ),
    this.buttonLarge = const ButtonStyle(
      minimumSize: MaterialStatePropertyAll(Size.zero),
      padding: MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 12, horizontal: 24)),
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
      ),
      textStyle: MaterialStatePropertyAll(
        TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1.5),
      ),
    ),
    this.buttonText = const ButtonStyle(
      minimumSize: MaterialStatePropertyAll(Size.zero),
      backgroundColor: MaterialStatePropertyAll(Colors.transparent),
      padding: MaterialStatePropertyAll(EdgeInsets.zero),
      splashFactory: NoSplash.splashFactory,
      textStyle: MaterialStatePropertyAll(
        TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1),
      ),
    ),
  });
}
