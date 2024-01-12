import 'package:flutter/material.dart';
import 'package:pokedex/presenter/app.dart';
import 'package:pokedex/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();

  runApp(
    GlobalBlocProviders(
      child: PokedexApp(),
    ),
  );
}
