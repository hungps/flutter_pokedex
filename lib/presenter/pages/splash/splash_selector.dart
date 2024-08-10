import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/presenter/pages/splash/splash_bloc.dart';
import 'package:pokedex/presenter/pages/splash/splash_state.dart';

class SplashListener extends BlocListener<SplashBloc, SplashState> {
  const SplashListener({
    super.key,
    required super.listener,
    required super.listenWhen,
  });
}

class SplashLoadedListener extends SplashListener {
  SplashLoadedListener({
    super.key,
    required super.listener,
  }) : super(
          listenWhen: (previous, current) =>
              previous.status != current.status &&
              current.status == SplashStatus.loaded,
        );
}
