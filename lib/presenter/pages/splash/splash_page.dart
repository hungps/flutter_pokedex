import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/di.dart';
import 'package:pokedex/presenter/navigation/navigation.dart';
import 'package:pokedex/presenter/pages/splash/splash_bloc.dart';
import 'package:pokedex/presenter/pages/splash/splash_event.dart';
import 'package:pokedex/presenter/pages/splash/splash_selector.dart';
import 'package:pokedex/presenter/pages/splash/splash_state.dart';
import 'package:pokedex/presenter/widgets/loading.dart';

@RoutePage()
class SplashPage extends StatefulWidget implements AutoRouteWrapper {
  const SplashPage({super.key});

  @override
  State<StatefulWidget> createState() => _SplashPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt.get<SplashBloc>(),
      child: this,
    );
  }
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    scheduleMicrotask(() async {
      context.read<SplashBloc>().add(const SplashLoadStarted());
    });
  }

  void _onLoaded(BuildContext context, SplashState state) {
    context.router.replaceAll([const HomeRoute()]);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        SplashLoadedListener(listener: _onLoaded),
      ],
      child: const Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PikaLoadingIndicator(),
              Text(
                'Pokedex',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
