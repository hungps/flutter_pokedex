import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/data/entities/news.dart';
import 'package:pokedex/presenter/pages/home/home_bloc.dart';
import 'package:pokedex/presenter/pages/home/home_state.dart';

abstract base class HomeSelector<T>
    extends BlocSelector<HomeBloc, HomeState, T> {
  HomeSelector({
    super.key,
    required super.selector,
    required Widget Function(T data) builder,
  }) : super(
          builder: (_, data) => builder(data),
        );
}

final class HomeNewsSelector
    extends HomeSelector<({bool loading, List<News> news})> {
  HomeNewsSelector({
    super.key,
    required Widget Function(bool loading, List<News> news) builder,
  }) : super(
          selector: (state) => (
            loading: state.status == HomeStatus.loading,
            news: state.news,
          ),
          builder: (data) => builder(data.loading, data.news),
        );
}
