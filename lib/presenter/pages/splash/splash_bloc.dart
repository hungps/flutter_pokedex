import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/presenter/pages/splash/splash_event.dart';
import 'package:pokedex/presenter/pages/splash/splash_state.dart';

@injectable
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(const SplashState()) {
    on<SplashLoadStarted>(_onLoadStarted);
  }

  FutureOr<void> _onLoadStarted(
    SplashLoadStarted event,
    Emitter<SplashState> emit,
  ) async {
    emit(state.copyWith(status: SplashStatus.loading));

    await Future.delayed(const Duration(milliseconds: 400));

    emit(state.copyWith(status: SplashStatus.loaded));
  }
}
