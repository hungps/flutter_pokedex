import 'dart:ui';

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
      maximumSize: const Size(400, 800),
      backgroundColor: Colors.black12,
      enabled: MediaQuery.sizeOf(context).shortestSide > 600,
      builder: (_) => SettingsThemeSelector(
        builder: (theme) => MaterialApp.router(
          title: 'Flutter Pokedex',
          theme: theme.themeData,
          routerConfig: _router.config(),
          scrollBehavior: AppScrollBehavior(),
        ),
      ),
    );
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
}
