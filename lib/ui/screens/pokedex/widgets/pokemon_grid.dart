part of '../pokedex.dart';

class _PokemonGrid extends StatelessWidget {
  _PokemonGrid({
    @required this.pokemons,
    @required this.canLoadMore,
    @required this.controller,
    @required this.onRefresh,
    @required this.onSelectPokemon,
  });

  final ScrollController controller;
  final List<Pokemon> pokemons;
  final bool canLoadMore;
  final Future Function() onRefresh;
  final Function(int, Pokemon) onSelectPokemon;

  @override
  Widget build(BuildContext context) {
    final paddingBottom = context.responsive(max(context.padding.bottom, 28));

    return CustomScrollView(
      controller: controller,
      physics: BouncingScrollPhysics(),
      slivers: [
        CupertinoSliverRefreshControl(
          onRefresh: onRefresh,
          builder: (_, __, ___, ____, _____) => Image(
            image: AppImages.pikloader,
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: 28,
            vertical: context.responsive(28),
          ),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.4,
              crossAxisSpacing: context.responsive(10),
              mainAxisSpacing: context.responsive(10),
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) => PokemonCard(
                pokemons[index],
                index: index,
                onPress: () => onSelectPokemon(index, pokemons[index]),
              ),
              childCount: pokemons?.length ?? 0,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: canLoadMore
              ? Container(
                  padding: EdgeInsets.only(bottom: paddingBottom),
                  alignment: Alignment.center,
                  child: Image(
                    image: AppImages.pikloader,
                  ),
                )
              : SizedBox(),
        ),
      ],
    );
  }
}
