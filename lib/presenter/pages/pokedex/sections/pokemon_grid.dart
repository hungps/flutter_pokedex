part of '../pokedex.dart';

class _PokemonGrid extends StatefulWidget {
  const _PokemonGrid();

  @override
  _PokemonGridState createState() => _PokemonGridState();
}

class _PokemonGridState extends State<_PokemonGrid> {
  static const double _endReachedThreshold = 200;

  final GlobalKey<NestedScrollViewState> _scrollKey = GlobalKey();

  PokemonBloc get pokemonBloc => context.read<PokemonBloc>();

  @override
  void initState() {
    super.initState();

    scheduleMicrotask(() {
      pokemonBloc.add(const PokemonLoadStarted());
      _scrollKey.currentState?.innerController.addListener(_onScroll);
    });
  }

  @override
  void dispose() {
    _scrollKey.currentState?.innerController.dispose();
    _scrollKey.currentState?.dispose();

    super.dispose();
  }

  void _onScroll() {
    final innerController = _scrollKey.currentState?.innerController;

    if (innerController == null || !innerController.hasClients) return;

    final thresholdReached = innerController.position.extentAfter < _endReachedThreshold;

    if (thresholdReached) {
      // Load more!
      pokemonBloc.add(const PokemonLoadMoreStarted());
    }
  }

  Future _onRefresh() async {
    pokemonBloc.add(const PokemonLoadStarted());

    return pokemonBloc.stream.firstWhere((e) => e.status != PokemonStateStatus.loading);
  }

  void _onPokemonPress(Pokemon pokemon) {
    pokemonBloc.add(PokemonSelectChanged(pokemonId: pokemon.number));

    context.router.push(PokemonInfoRoute(id: pokemon.number));
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      key: _scrollKey,
      headerSliverBuilder: (_, __) => [
        AppMovingTitleSliverAppBar(title: 'Pokedex'),
      ],
      body: PokemonStateStatusSelector((status) {
        switch (status) {
          case PokemonStateStatus.initial:
          case PokemonStateStatus.loading:
            return const PikaLoadingIndicator();

          case PokemonStateStatus.success:
          case PokemonStateStatus.loadingMore:
            return _buildGrid();

          case PokemonStateStatus.failure:
            return _buildError();
        }
      }),
    );
  }

  Widget _buildGrid() {
    return CustomScrollView(
      slivers: [
        PokemonRefreshControl(onRefresh: _onRefresh),
        SliverPadding(
          padding: const EdgeInsets.all(28),
          sliver: NumberOfPokemonsSelector((numberOfPokemons) {
            return SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              delegate: SliverChildBuilderDelegate(
                (_, index) {
                  return PokemonSelector(index, (pokemon, _) {
                    return PokemonCard(
                      pokemon,
                      onPress: () => _onPokemonPress(pokemon),
                    );
                  });
                },
                childCount: numberOfPokemons,
              ),
            );
          }),
        ),
        SliverToBoxAdapter(
          child: PokemonCanLoadMoreSelector((canLoadMore) {
            if (!canLoadMore) {
              return const SizedBox.shrink();
            }

            return Container(
              padding: const EdgeInsets.only(bottom: 28),
              child: const PikaLoadingIndicator(),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildError() {
    return CustomScrollView(
      slivers: [
        PokemonRefreshControl(onRefresh: _onRefresh),
        SliverFillRemaining(
          child: Container(
            padding: const EdgeInsets.only(bottom: 28),
            alignment: Alignment.center,
            child: const Icon(
              Icons.warning_amber_rounded,
              size: 60,
              color: Colors.black26,
            ),
          ),
        ),
      ],
    );
  }
}
