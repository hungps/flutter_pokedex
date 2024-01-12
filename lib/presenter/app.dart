import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_frame/flutter_web_frame.dart';
import 'package:pokedex/presenter/navigation/navigation.dart';
import 'package:pokedex/data/states/settings/settings_selector.dart';

class PokedexApp extends StatelessWidget {
  final AppRouter _router = AppRouter();

  PokedexApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterWebFrame(
      maximumSize: const Size.fromWidth(600),
      backgroundColor: Colors.black12,
      enabled: kIsWeb,
      builder: (_) => SettingsThemeSelector(
        builder: (theme) => MaterialApp.router(
          color: Colors.white,
          title: 'Flutter Pokedex',
          theme: theme.themeData,
          routerConfig: _router.config(),
        ),
      ),
    );
  }
}
