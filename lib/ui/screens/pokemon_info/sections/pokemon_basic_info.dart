part of '../pokemon_info.dart';

class _PokemonOverallInfo extends StatefulWidget {
  const _PokemonOverallInfo();

  @override
  _PokemonOverallInfoState createState() => _PokemonOverallInfoState();
}

class _PokemonOverallInfoState extends State<_PokemonOverallInfo> with TickerProviderStateMixin {
  static const double _pokemonSliderViewportFraction = 0.6;
  static const int _endReachedThreshold = 4;

  final GlobalKey _currentTextKey = GlobalKey();
  final GlobalKey _targetTextKey = GlobalKey();

  double textDiffLeft = 0.0;
  double textDiffTop = 0.0;
  late PageController _pageController;
  late AnimationController _horizontalSlideController;

  PokemonBloc get pokemonBloc => context.read<PokemonBloc>();
  AnimationController get slideController => PokemonInfoStateProvider.of(context).slideController;
  AnimationController get rotateController => PokemonInfoStateProvider.of(context).rotateController;

  Animation<double> get textFadeAnimation => Tween(begin: 1.0, end: 0.0).animate(slideController);
  Animation<double> get sliderFadeAnimation => Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: slideController,
        curve: Interval(0.0, 0.5, curve: Curves.ease),
      ));

  @override
  void initState() {
    _horizontalSlideController = AnimationController(
      vsync: this,
      duration: Duration(microseconds: 300),
    )..forward();

    super.initState();
  }

  @override
  void didChangeDependencies() {
    final pageIndex = pokemonBloc.state.selectedPokemonIndex;

    _pageController = PageController(
      viewportFraction: _pokemonSliderViewportFraction,
      initialPage: pageIndex,
    );

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _horizontalSlideController.dispose();
    _pageController.dispose();

    super.dispose();
  }

  void _calculatePokemonNamePosition() {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      final targetTextBox = _targetTextKey.currentContext?.findRenderObject() as RenderBox?;
      final currentTextBox = _currentTextKey.currentContext?.findRenderObject() as RenderBox?;

      if (targetTextBox == null || currentTextBox == null) return;

      final targetTextPosition = targetTextBox.localToGlobal(Offset.zero);
      final currentTextPosition = currentTextBox.localToGlobal(Offset.zero);

      final newDiffLeft = targetTextPosition.dx - currentTextPosition.dx;
      final newDiffTop = targetTextPosition.dy - currentTextPosition.dy;

      if (newDiffLeft != textDiffLeft || newDiffTop != textDiffTop) {
        setState(() {
          textDiffLeft = newDiffLeft;
          textDiffTop = newDiffTop;
        });
      }
    });
  }

  void _onSelectPokemon(Pokemon pokemon, bool needLoadMore) {
    pokemonBloc.add(PokemonSelectChanged(pokemonId: pokemon.number));

    if (needLoadMore) {
      pokemonBloc.add(PokemonLoadMoreStarted());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _buildAppBar(),
        SizedBox(height: 9),
        _buildPokemonName(),
        SizedBox(height: 9),
        _buildPokemonTypes(),
        SizedBox(height: 25),
        _buildPokemonSlider(),
      ],
    );
  }

  AppBar _buildAppBar() {
    return MainAppBar(
      // A placeholder for easily calculate the translate of the pokemon name
      title: BlocSelector<PokemonBloc, PokemonState, String>(
        selector: (state) => state.selectedPokemon.name,
        builder: (_, pokemonName) {
          _calculatePokemonNamePosition();

          return Text(
            pokemonName,
            key: _targetTextKey,
            style: TextStyle(
              color: Colors.transparent,
              fontWeight: FontWeight.w900,
              fontSize: 22,
            ),
          );
        },
      ),
      rightIcon: Icons.favorite_border,
    );
  }

  Widget _buildPokemonName() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 26),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          AnimatedBuilder(
            animation: slideController,
            builder: (_, __) {
              final value = slideController.value;

              return Transform.translate(
                offset: Offset(textDiffLeft * value, textDiffTop * value),
                child: BlocSelector<PokemonBloc, PokemonState, Pokemon>(
                  selector: (state) => state.selectedPokemon,
                  builder: (_, pokemon) {
                    return HeroText(
                      pokemon.name,
                      textKey: _currentTextKey,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 36 - (36 - 22) * value,
                      ),
                    );
                  },
                ),
              );
            },
          ),
          AnimatedSlide(
            animation: _horizontalSlideController,
            child: AnimatedFade(
              animation: textFadeAnimation,
              child: BlocSelector<PokemonBloc, PokemonState, Pokemon>(
                selector: (state) => state.selectedPokemon,
                builder: (_, pokemon) {
                  return HeroText(
                    pokemon.number,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPokemonTypes() {
    return AnimatedFade(
      animation: textFadeAnimation,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 26),
        child: BlocSelector<PokemonBloc, PokemonState, Pokemon>(
          selector: (state) => state.selectedPokemon,
          builder: (_, pokemon) {
            return Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: pokemon.types
                        .take(3)
                        .map((type) => PokemonType(type, large: true))
                        .toList(),
                  ),
                ),
                AnimatedSlide(
                  animation: _horizontalSlideController,
                  child: Text(
                    pokemon.genera,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildPokemonSlider() {
    final screenSize = MediaQuery.of(context).size;
    final sliderHeight = screenSize.height * 0.24;
    final pokeballSize = screenSize.height * 0.24;
    final pokemonSize = screenSize.height * 0.3;

    return AnimatedFade(
      animation: sliderFadeAnimation,
      child: SizedBox(
        width: screenSize.width,
        height: sliderHeight,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomCenter,
              child: RotationTransition(
                turns: rotateController,
                child: Image(
                  image: AppImages.pokeball,
                  width: pokeballSize,
                  height: pokeballSize,
                  color: Colors.white12,
                ),
              ),
            ),
            BlocSelector<PokemonBloc, PokemonState, List<Pokemon>>(
              selector: (state) => state.pokemons,
              builder: (_, pokemons) {
                return PageView.builder(
                  physics: BouncingScrollPhysics(),
                  controller: _pageController,
                  itemCount: pokemons.length,
                  onPageChanged: (index) {
                    final needLoadMore = index >= pokemons.length - _endReachedThreshold;
                    _onSelectPokemon(pokemons[index], needLoadMore);
                  },
                  itemBuilder: (_, index) {
                    final pokemonCachedSize = (pokemonSize * 2).toInt();

                    return BlocSelector<PokemonBloc, PokemonState, bool>(
                      selector: (state) => state.selectedPokemonIndex == index,
                      builder: (_, selected) {
                        return Hero(
                          tag: selected ? pokemons[index].image : index,
                          child: AnimatedPadding(
                            duration: Duration(milliseconds: 600),
                            curve: Curves.easeOutQuint,
                            padding: EdgeInsets.only(
                              top: selected ? 0 : screenSize.height * 0.04,
                              bottom: selected ? 0 : screenSize.height * 0.04,
                            ),
                            child: CachedNetworkImage(
                              imageUrl: pokemons[index].image,
                              imageRenderMethodForWeb: ImageRenderMethodForWeb.HtmlImage,
                              useOldImageOnUrlChange: true,
                              memCacheWidth: pokemonCachedSize,
                              memCacheHeight: pokemonCachedSize,
                              imageBuilder: (_, image) => Image(
                                image: image,
                                width: pokemonSize,
                                height: pokemonSize,
                                alignment: Alignment.bottomCenter,
                                color: selected ? null : Colors.black26,
                                fit: BoxFit.contain,
                              ),
                              errorWidget: (_, __, ___) => Stack(
                                alignment: Alignment.center,
                                children: [
                                  Image(
                                    image: AppImages.bulbasaur,
                                    width: pokemonSize,
                                    height: pokemonSize,
                                    color: Colors.black12,
                                  ),
                                  Icon(
                                    Icons.warning_amber_rounded,
                                    size: pokemonSize * 0.3,
                                    color: Colors.black26,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
