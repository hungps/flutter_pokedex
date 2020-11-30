import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pokedex/configs/colors.dart';
import 'package:pokedex/configs/images.dart';
import 'package:pokedex/core/extensions/context.dart';
import 'package:pokedex/data/categories.dart';
import 'package:pokedex/routes.dart';
import 'package:pokedex/ui/widgets/poke_category_card.dart';
import 'package:pokedex/ui/widgets/poke_container.dart';
import 'package:pokedex/ui/widgets/poke_news.dart';
import 'package:pokedex/ui/widgets/search_bar.dart';
import 'package:pokedex/ui/widgets/spacer.dart';

part 'widgets/header_app_bar.dart';
part 'widgets/pokemon_news.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  double appBarHeight = 0;
  bool showTitle = false;

  @override
  void initState() {
    _scrollController.addListener(_onScroll);

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;

    final offset = _scrollController.offset;

    setState(() {
      showTitle = offset > appBarHeight - kToolbarHeight;
    });
  }

  @override
  Widget build(BuildContext context) {
    appBarHeight = context.screenSize.height * _HeaderAppBar.heightFraction;

    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (_, __) => [
          _HeaderAppBar(
            height: appBarHeight,
            showTitle: showTitle,
          ),
        ],
        body: _PokemonNews(),
      ),
    );
  }
}
