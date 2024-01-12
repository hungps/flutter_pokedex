import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/data/states/item/item_bloc.dart';
import 'package:pokedex/data/states/pokemon/pokemon_bloc.dart';
import 'package:pokedex/data/states/settings/settings_bloc.dart';

import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
FutureOr<void> configureDependencies() => getIt.init();

@module
abstract class RegisterModule {
  @singleton
  Dio get dio => Dio();
}

class GlobalBlocProviders extends StatelessWidget {
  final Widget child;

  const GlobalBlocProviders({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PokemonBloc>(
          create: (context) => getIt.get<PokemonBloc>(),
        ),
        BlocProvider<ItemBloc>(
          create: (context) => getIt.get<ItemBloc>(),
        ),
        BlocProvider<SettingsBloc>(
          create: (context) => getIt.get<SettingsBloc>(),
        )
      ],
      child: child,
    );
  }
}
