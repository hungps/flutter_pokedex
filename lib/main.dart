import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:provider/provider.dart';

import 'configs/AppColors.dart';
import 'screens/home/home.dart';
import 'screens/pokedex/pokedex.dart';
import 'screens/pokemon_info/pokemon_info.dart';
import 'widgets/fade_page_route.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(builder: (context) => PokemonModel()),
          // ... other provider(s)
        ],
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  Route _getRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return FadeRoute(page: Home());

      case '/pokedex':
        return FadeRoute(page: Pokedex());

      case '/pokemon-info':
        return FadeRoute(page: PokemonInfo());

      default:
        return null;
    }
  }

  void preloadAssets(BuildContext context) {
    precacheImage(AssetImage('assets/images/dotted.png'), context);
    precacheImage(AssetImage('assets/images/female.png'), context);
    precacheImage(AssetImage('assets/images/male.png'), context);
    precacheImage(AssetImage('assets/images/pokeball.png'), context);
    precacheImage(AssetImage('assets/images/thumbnail.png'), context);
    precacheImage(AssetImage('assets/images/bulbasaur.png'), context);
    precacheImage(AssetImage('assets/images/charmander.png'), context);
    precacheImage(AssetImage('assets/images/squirtle.png'), context);
  }

  @override
  Widget build(BuildContext context) {
    preloadAssets(context);

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
