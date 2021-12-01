import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/configs/images.dart';
import 'package:pokedex/data/repositories/item_repository.dart';
import 'package:pokedex/domain/entities/item.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/providers/providers.dart';
import 'package:pokedex/ui/screens/items_list/widgets/item_card.dart';
import 'package:pokedex/ui/screens/pokedex/widgets/pokemon_card.dart';
import 'package:pokedex/ui/widgets/main_app_bar.dart';
import 'package:pokedex/ui/widgets/pokemon_refresh_control.dart';
import 'package:pokedex/routes.dart';

class ItemsGrid extends StatefulWidget {
  @override
  _ItemsGridState createState() => _ItemsGridState();
}

class _ItemsGridState extends State<ItemsGrid> {
  static const double _endReachedThreshold = 200;

  final GlobalKey<NestedScrollViewState> _scrollKey = GlobalKey();
  ScrollController get innerController => _scrollKey.currentState?.innerController;

  @override
  void initState() {
    super.initState();
    scheduleMicrotask(() {
      context.read(itemStateProvider).getItems(reset: true);
    });
  }

  @override
  void dispose() {
    innerController?.dispose();

    super.dispose();
  }

  Future _onRefresh() async {
    context.read(itemStateProvider).getItems(reset: true);
  }

  void onItemPress(int index, Pokemon pokemon) {
    context.read(currentPokemonStateProvider).setPokemon(index, pokemon);

    AppNavigator.push(Routes.pokemonInfo, pokemon);
  }

  List<Widget> _buildHeader(BuildContext context, bool innerBoxIsScrolled) {
    return [
      MainSliverAppBar(title: "Items"),
    ];
  }

  Widget _buildGrid({List<Item> items = const []}) {
    return SliverPadding(
      padding: EdgeInsets.all(28),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) => ItemCard(items[index], index: index),
          childCount: items.length,
        ),
      ),
    );
  }

  Widget _buildLoadMoreIndicator() {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.only(bottom: 28),
        alignment: Alignment.center,
        child: Image(image: AppImages.pikloader),
      ),
    );
  }

  Widget _buildError() {
    return SliverFillRemaining(
      child: Container(
        padding: EdgeInsets.only(bottom: 28),
        alignment: Alignment.center,
        child: Icon(
          Icons.warning_amber_rounded,
          size: 60,
          color: Colors.black26,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      key: _scrollKey,
      headerSliverBuilder: _buildHeader,
      body: Consumer(builder: (_, watch, __) {
        final itemState = watch(itemStateProvider);

        return CustomScrollView(
          slivers: [
            PokemonRefreshControl(onRefresh: _onRefresh),
            if (itemState.isError)
              _buildError()
            else ...[
              _buildGrid(items: itemState.items),
            ]
          ],
        );
      }),
    );
  }
}
