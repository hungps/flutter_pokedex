import 'package:flutter/material.dart';

import 'configs/AppColors.dart';
import 'screens/home/home.dart';
import 'screens/pokedex/pokedex.dart';
import 'screens/pokemon_info/pokemon_info.dart';
import 'widgets/fade_page_route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Route _getRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return FadeRoute(page: Home());

      case '/pokedex':
        return FadeRoute(page: Pokedex());

      case '/pokemon-info':
        return FadeRoute(
          page: PokemonInfo(pokemonInfoArguments: settings.arguments),
        );

      default:
        return null;
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'CircularStd',
        textTheme: Theme.of(context).textTheme.apply(displayColor: AppColors.black),
        scaffoldBackgroundColor: AppColors.lightGrey,
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: _getRoute,
    );
  }
}
