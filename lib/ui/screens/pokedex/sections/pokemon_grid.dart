part of '../pokedex.dart';

class _PokemonGrid extends StatefulWidget {
  @override
  _PokemonGridState createState() => _PokemonGridState();
}

class _PokemonGridState extends State<_PokemonGrid> {
  static const double _endReachedThreshold = 200;

  final GlobalKey<NestedScrollViewState> _scrollKey = GlobalKey();

  PokemonBloc get bloc => context.read<PokemonBloc>();
  ScrollController? get innerController => _scrollKey.currentState?.innerController;

  @override
  void initState() {
    super.initState();

    scheduleMicrotask(() {
      bloc.add(PokemonLoadStarted());
      innerController?.addListener(_onScroll);
    });
  }

  @override
  void dispose() {
    innerController?.dispose();

    super.dispose();
  }

  void _onScroll() {
    if (innerController == null || !innerController!.hasClients) return;

    final status = bloc.state.status;

    final thresholdReached = innerController!.position.extentAfter < _endReachedThreshold;
    final isLoading = [PokemonStateStatus.loading, PokemonStateStatus.loadingMore].contains(status);
    final canLoadMore = bloc.state.canLoadMore;

    if (thresholdReached && !isLoading && canLoadMore) {
      // Load more!
      bloc.add(PokemonLoadMoreStarted());
    }
  }

  Future _onRefresh() async {
    bloc.add(PokemonLoadStarted());
  }

  void _onPokemonPress(Pokemon pokemon) {
    bloc.add(PokemonSelectChanged(pokemonId: pokemon.number));

    AppNavigator.push(Routes.pokemonInfo, pokemon);
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      key: _scrollKey,
      headerSliverBuilder: (_, __) => [
        MainSliverAppBar(),
      ],
      body: BlocBuilder<PokemonBloc, PokemonState>(builder: (_, state) {
        switch (state.status) {
          case PokemonStateStatus.loading:
            return _buildLoading();

          case PokemonStateStatus.loadSuccess:
          case PokemonStateStatus.loadMoreSuccess:
          case PokemonStateStatus.loadingMore:
            return _buildGrid(state);

          case PokemonStateStatus.loadFailure:
          case PokemonStateStatus.loadMoreFailure:
            return _buildError();

          default:
            return Container();
        }
      }),
    );
  }

  Widget _buildLoading() {
    return Center(
      child: Image(image: AppImages.pikloader),
    );
  }

  Widget _buildGrid(PokemonState state) {
    final pokemons = state.pokemons;
    final canLoadMore = state.canLoadMore;

    return CustomScrollView(
      slivers: [
        PokemonRefreshControl(onRefresh: _onRefresh),
        SliverPadding(
          padding: EdgeInsets.all(28),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            delegate: SliverChildBuilderDelegate(
              (_, index) {
                return PokemonCard(
                  pokemons[index],
                  onPress: () => _onPokemonPress(pokemons[index]),
                );
              },
              childCount: pokemons.length,
            ),
          ),
        ),
        if (canLoadMore)
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.only(bottom: 28),
              alignment: Alignment.center,
              child: Image(image: AppImages.pikloader),
            ),
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
            padding: EdgeInsets.only(bottom: 28),
            alignment: Alignment.center,
            child: Icon(
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
