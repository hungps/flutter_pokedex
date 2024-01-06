import 'package:flutter/material.dart';
import 'package:pokedex/routes.dart';
import 'package:pokedex/states/settings/settings_selector.dart';

class PokedexApp extends StatelessWidget {
  const PokedexApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SettingsThemeSelector(
      builder: (theme) => MaterialApp(
        color: Colors.white,
        title: 'Flutter Pokedex',
        theme: theme.themeData,
        navigatorKey: AppNavigator.navigatorKey,
        onGenerateRoute: AppNavigator.onGenerateRoute,
      ),
    );
  }
}
