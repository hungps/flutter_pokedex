import 'package:flutter/material.dart';

class ThemeSwitcherButton extends StatelessWidget {
  static const IconData _lightThemeIcon = Icons.wb_sunny_outlined;
  static const IconData _darkThemeIcon = Icons.dark_mode_outlined;

  final bool isDarkTheme;
  final VoidCallback onPressed;

  const ThemeSwitcherButton({
    super.key,
    required this.isDarkTheme,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(isDarkTheme ? _darkThemeIcon : _lightThemeIcon),
      iconSize: 25,
    );
  }
}
