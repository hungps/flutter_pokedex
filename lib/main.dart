import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_frame/flutter_web_frame.dart';
import 'package:pokedex/app.dart';
import 'package:pokedex/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();

  runApp(
    GlobalBlocProviders(
      child: FlutterWebFrame(
        maximumSize: const Size.fromWidth(600),
        backgroundColor: Colors.black12,
        enabled: kIsWeb,
        builder: (_) => const PokedexApp(),
      ),
    ),
  );
}
