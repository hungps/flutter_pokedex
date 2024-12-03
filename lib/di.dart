import 'dart:async';

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
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
  @preResolve
  Future<Dio> get dio async => Dio(BaseOptions(baseUrl: 'https://pokeapi.co'))
    ..interceptors.add(DioCacheInterceptor(
      options: CacheOptions(
        store: HiveCacheStore(kIsWeb
            ? null
            : await getApplicationDocumentsDirectory().then((dir) => dir.path)),
        policy: CachePolicy.forceCache,
        hitCacheOnErrorExcept: [401, 403],
        maxStale: const Duration(days: 30),
        priority: CachePriority.high,
        allowPostMethod: false,
      ),
    ));

  @singleton
  Locale get locale => const Locale("en");
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
