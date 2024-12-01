import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/data/states/settings/settings_bloc.dart';
import 'package:pokedex/data/states/settings/settings_event.dart';
import 'package:pokedex/data/states/settings/settings_selector.dart';
import 'package:pokedex/di.dart';
import 'package:pokedex/presenter/navigation/navigation.dart';
import 'package:pokedex/presenter/pages/home/home_bloc.dart';
import 'package:pokedex/presenter/pages/home/home_event.dart';
import 'package:pokedex/presenter/pages/home/home_selector.dart';
import 'package:pokedex/presenter/pages/home/widgets/category_card.dart';
import 'package:pokedex/presenter/pages/home/widgets/news_card.dart';
import 'package:pokedex/presenter/themes/colors.dart';
import 'package:pokedex/presenter/themes/extensions.dart';
import 'package:pokedex/presenter/themes/themes/themes.dark.dart';
import 'package:pokedex/presenter/themes/themes/themes.light.dart';
import 'package:pokedex/presenter/widgets/app_bar.dart';
import 'package:pokedex/presenter/widgets/button.dart';
import 'package:pokedex/presenter/widgets/input.dart';
import 'package:pokedex/presenter/widgets/loading.dart';
import 'package:pokedex/presenter/widgets/scaffold.dart';

@RoutePage()
class HomePage extends StatefulWidget implements AutoRouteWrapper {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt.get<HomeBloc>(),
      child: this,
    );
  }
}

class _HomePageState extends State<HomePage> {
  HomeBloc get _bloc => context.read<HomeBloc>();

  @override
  void initState() {
    super.initState();

    scheduleMicrotask(() {
      _bloc.add(const HomeLoadStarted());
    });
  }

  void _onThemeSwitcherPressed() {
    final settingsBloc = context.read<SettingsBloc>();
    final currentTheme = settingsBloc.state.theme;

    settingsBloc.add(SettingsThemeChanged(
      currentTheme is LightAppTheme
          ? const DarkAppTheme()
          : const LightAppTheme(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.backgroundDark,
      body: NestedScrollView(
        headerSliverBuilder: (_, innerBoxIsScrolled) => [
          AppExpandableSliverAppBar(
            expandedHeight: 552,
            backgroundColor: context.colors.primary,
            title: const Text('Pokedex'),
            showTitle: innerBoxIsScrolled,
            background: PokeballScaffold(
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SafeArea(
                    child: Container(
                      height: kToolbarHeight,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: SettingsThemeSelector(builder: (theme) {
                        return ThemeSwitcherButton(
                          isDarkTheme: theme is DarkAppTheme,
                          onPressed: _onThemeSwitcherPressed,
                        );
                      }),
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(height: 36),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: Text(
                      'What Pokemon\nare you looking for?',
                      style: context.typographies.heading,
                    ),
                  ),
                  const SizedBox(height: 36),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: AppSearchBar(
                      hintText: 'Search Pokemon, Move, Ability etc',
                    ),
                  ),
                  GridView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                      vertical: 36,
                      horizontal: 28,
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 15,
                      mainAxisExtent: 60,
                    ),
                    children: [
                      HomeCategoryCard(
                        title: 'Pokedex',
                        color: AppColors.teal,
                        onPressed: () =>
                            context.router.push(const PokedexRoute()),
                      ),
                      const HomeCategoryCard(
                        title: 'Moves',
                        color: AppColors.red,
                      ),
                      const HomeCategoryCard(
                        title: 'Abilities',
                        color: AppColors.blue,
                      ),
                      HomeCategoryCard(
                        title: 'Items',
                        color: AppColors.yellow,
                        onPressed: () =>
                            context.router.push(const ItemsRoute()),
                      ),
                      const HomeCategoryCard(
                        title: 'Locations',
                        color: AppColors.purple,
                      ),
                      HomeCategoryCard(
                        title: 'Type Effects',
                        color: AppColors.brown,
                        onPressed: () =>
                            context.router.push(const TypeEffectRoute()),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
        body: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
              sliver: SliverToBoxAdapter(
                child: Text(
                  'Pokémon News',
                  style: context.typographies.headingSmall,
                ),
              ),
            ),
            SliverSafeArea(
              top: false,
              sliver: SliverPadding(
                padding: const EdgeInsets.all(24),
                sliver: HomeNewsSelector(builder: (loading, news) {
                  if (loading) {
                    return const SliverPikaLoadingIndicator();
                  }

                  return SliverList.separated(
                    itemCount: news.length,
                    separatorBuilder: (_, __) => const Divider(height: 24),
                    itemBuilder: (_, index) => HomeNewsListTile(
                      title: news[index].title,
                      postedAt: news[index].postedAt,
                      thumbnail: AssetImage(news[index].thumbnail),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
