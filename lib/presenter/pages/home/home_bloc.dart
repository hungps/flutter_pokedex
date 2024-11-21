import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex/data/usecases/get_all_news_use_case.dart';
import 'package:pokedex/presenter/pages/home/home_event.dart';
import 'package:pokedex/presenter/pages/home/home_state.dart';

@injectable
final class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetAllNewsUseCase _getAllNews;

  HomeBloc({
    required GetAllNewsUseCase getAllNews,
  })  : _getAllNews = getAllNews,
        super(const HomeState()) {
    on<HomeLoadStarted>(_onLoadStarted);
  }

  FutureOr<void> _onLoadStarted(
    HomeLoadStarted event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: HomeStatus.loading));

    final allNews = await _getAllNews();

    emit(state.copyWith(status: HomeStatus.loaded, news: allNews));
  }
}
