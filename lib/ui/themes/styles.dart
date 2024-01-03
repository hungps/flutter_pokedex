import 'package:flutter/material.dart';

class AppThemeStyles {
  final List<BoxShadow> cardShadow;

  final ButtonStyle buttonSmall;
  final ButtonStyle buttonMedium;
  final ButtonStyle buttonLarge;
  final ButtonStyle buttonText;

  const AppThemeStyles({
    required this.cardShadow,
    required this.buttonSmall,
    required this.buttonMedium,
    required this.buttonLarge,
    required this.buttonText,
  });
}
