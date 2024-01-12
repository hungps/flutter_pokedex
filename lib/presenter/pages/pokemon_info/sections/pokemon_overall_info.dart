part of '../pokemon_info.dart';

class _PokemonOverallInfo extends StatefulWidget {
  const _PokemonOverallInfo();

  @override
  _PokemonOverallInfoState createState() => _PokemonOverallInfoState();
}

class _PokemonOverallInfoState extends State<_PokemonOverallInfo> with TickerProviderStateMixin {
  static const double _pokemonSliderViewportFraction = 0.56;
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
        curve: const Interval(0.0, 0.5, curve: Curves.ease),
      ));

  @override
  void initState() {
    _horizontalSlideController = AnimationController(
      vsync: this,
      duration: const Duration(microseconds: 300),
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
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

  void _onSelectedPokemonChanged(int index) {
    final pokemons = pokemonBloc.state.pokemons;
    final selectedPokemon = pokemons[index];

    pokemonBloc.add(PokemonSelectChanged(pokemonId: selectedPokemon.number));

    final shouldLoadMore = index >= pokemons.length - _endReachedThreshold;

    if (shouldLoadMore) {
      pokemonBloc.add(const PokemonLoadMoreStarted());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _buildAppBar(),
        const SizedBox(height: 9),
        _buildPokemonName(),
        const SizedBox(height: 9),
        _buildPokemonTypes(),
        const SizedBox(height: 25),
        _buildPokemonSlider(),
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppAppBar(
      foregroundColor: context.colors.textOnPrimary,
      // A placeholder for easily calculate the transformation of the pokemon name
      title: CurrentPokemonSelector((pokemon) {
        _calculatePokemonNamePosition();

        return Text(
          pokemon.name,
          key: _targetTextKey,
          style: const TextStyle(
            color: Colors.transparent,
            fontWeight: FontWeight.w900,
            fontSize: 22,
          ),
        );
      }),
      // rightIcon: Icons.favorite_border,
    );
  }

  Widget _buildPokemonName() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26),
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
                child: CurrentPokemonSelector((pokemon) {
                  return HeroText(
                    pokemon.name,
                    textKey: _currentTextKey,
                    style: TextStyle(
                      color: context.colors.textOnPrimary,
                      fontWeight: FontWeight.w900,
                      fontSize: 36 - (36 - 22) * value,
                    ),
                  );
                }),
              );
            },
          ),
          AnimatedSlide(
            animation: _horizontalSlideController,
            child: AnimatedFade(
              animation: textFadeAnimation,
              child: CurrentPokemonSelector((pokemon) {
                return HeroText(
                  pokemon.number,
                  style: TextStyle(
                    color: context.colors.textOnPrimary,
                    fontWeight: FontWeight.w900,
                    fontSize: 18,
                  ),
                );
              }),
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
        padding: const EdgeInsets.symmetric(horizontal: 26),
        child: CurrentPokemonSelector((pokemon) {
          return Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children:
                      pokemon.types.take(3).map((type) => PokemonType(type, large: true)).toList(),
                ),
              ),
              AnimatedSlide(
                animation: _horizontalSlideController,
                child: Text(
                  pokemon.genera,
                  style: TextStyle(color: context.colors.textOnPrimary),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildPokemonSlider() {
    final screenSize = MediaQuery.sizeOf(context);
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
                  image: Assets.images.pokeball.provider(),
                  width: pokeballSize,
                  height: pokeballSize,
                  color: context.colors.background.withOpacity(0.12),
                ),
              ),
            ),
            NumberOfPokemonsSelector((numberOfPokemons) {
              return PageView.builder(
                allowImplicitScrolling: true,
                physics: const BouncingScrollPhysics(),
                controller: _pageController,
                itemCount: numberOfPokemons,
                onPageChanged: _onSelectedPokemonChanged,
                itemBuilder: (_, index) {
                  return PokemonSelector(index, (pokemon, selected) {
                    return PokemonImage(
                      pokemon: pokemon,
                      size: Size.square(pokemonSize),
                      padding: EdgeInsets.symmetric(
                        vertical: selected ? 0 : screenSize.height * 0.04,
                      ),
                      tintColor: selected ? null : Colors.black26,
                      useHero: selected,
                    );
                  });
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
