import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_frame/flutter_web_frame.dart';
import 'package:pokedex/presenter/navigation/routes.dart';
import 'package:pokedex/data/states/settings/settings_selector.dart';

class PokedexApp extends StatelessWidget {
  const PokedexApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterWebFrame(
      maximumSize: const Size.fromWidth(600),
      backgroundColor: Colors.black12,
      enabled: kIsWeb,
      builder: (_) => SettingsThemeSelector(
        builder: (theme) => MaterialApp(
          color: Colors.white,
          title: 'Flutter Pokedex',
          theme: theme.themeData,
          navigatorKey: AppNavigator.navigatorKey,
          onGenerateRoute: AppNavigator.onGenerateRoute,
        ),
      ),
    );
  }
}
