import 'package:flutter/material.dart';
import 'package:pokedex/presenter/navigation/route_builders.dart';
import 'package:pokedex/presenter/pages/home/home.dart';
import 'package:pokedex/presenter/pages/items/items.dart';
import 'package:pokedex/presenter/pages/pokedex/pokedex.dart';
import 'package:pokedex/presenter/pages/pokemon_info/pokemon_info.dart';
import 'package:pokedex/presenter/pages/splash/splash.dart';
import 'package:pokedex/presenter/pages/types/type_screen.dart';

enum Routes { splash, home, pokedex, pokemonInfo, typeEffects, items }

class _Paths {
  static const String splash = '/';
  static const String home = '/home';
  static const String pokedex = '/home/pokedex';
  static const String pokemonInfo = '/home/pokemon';
  static const String typeEffectsScreen = '/home/type';
  static const String itemsList = '/home/items';

  static const Map<Routes, String> _pathMap = {
    Routes.splash: _Paths.splash,
    Routes.home: _Paths.home,
    Routes.pokedex: _Paths.pokedex,
    Routes.pokemonInfo: _Paths.pokemonInfo,
    Routes.typeEffects: _Paths.typeEffectsScreen,
    Routes.items: _Paths.itemsList
  };

  static String of(Routes route) => _pathMap[route] ?? splash;
}

class AppNavigator {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case _Paths.splash:
        return FadeRoute(page: const SplashScreen());

      case _Paths.pokedex:
        return FadeRoute(page: const PokedexScreen());

      case _Paths.pokemonInfo:
        return FadeRoute(page: const PokemonInfo());

      case _Paths.typeEffectsScreen:
        return FadeRoute(page: const TypeEffectScreen());

      case _Paths.itemsList:
        return FadeRoute(page: const ItemsScreen());

      case _Paths.home:
      default:
        return FadeRoute(page: const HomeScreen());
    }
  }

  static Future? push<T>(Routes route, [T? arguments]) =>
      state?.pushNamed(_Paths.of(route), arguments: arguments);

  static Future? replaceWith<T>(Routes route, [T? arguments]) =>
      state?.pushReplacementNamed(_Paths.of(route), arguments: arguments);

  static void pop() => state?.pop();

  static bool canPop() => state?.canPop() ?? false;

  static NavigatorState? get state => navigatorKey.currentState;
}