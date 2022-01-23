import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_image_platform_interface/cached_network_image_platform_interface.dart';
import 'package:flutter/material.dart' hide AnimatedSlide;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/configs/durations.dart';
import 'package:pokedex/configs/images.dart';
import 'package:pokedex/core/extensions/context.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/states/pokemon/pokemon_bloc.dart';
import 'package:pokedex/states/pokemon/pokemon_event.dart';
import 'package:pokedex/states/pokemon/pokemon_state.dart';
import 'package:pokedex/ui/widgets/animated_fade.dart';
import 'package:pokedex/ui/widgets/animated_slide.dart';
import 'package:pokedex/ui/widgets/main_app_bar.dart';
import 'package:pokedex/ui/widgets/pokemon_type.dart';
import 'package:pokedex/ui/widgets/spacer.dart';

class PokemonOverallInfo extends StatefulWidget {
  final Pokemon pokemon;
  final AnimationController controller;
  final AnimationController rotateController;

  const PokemonOverallInfo(this.pokemon, this.controller, this.rotateController);

  @override
  _PokemonOverallInfoState createState() => _PokemonOverallInfoState();
}

class _PokemonOverallInfoState extends State<PokemonOverallInfo> with TickerProviderStateMixin {
  static const double _pokemonSliderViewportFraction = 0.6;
  static const int _endReachedThreshold = 4;

  final GlobalKey _currentTextKey = GlobalKey();
  final GlobalKey _targetTextKey = GlobalKey();

  double textDiffLeft = 0.0;
  double textDiffTop = 0.0;
  PageController? _pageController;
  late AnimationController _slideController;

  Pokemon get pokemon => widget.pokemon;

  AnimationController get controller => widget.controller;

  @override
  void initState() {
    _slideController = AnimationController(
      vsync: this,
      duration: animationDuration,
    );
    _slideController.forward();

    _calculatePokemonNamePosition();

    super.initState();
  }

  @override
  void didChangeDependencies() {
    final pageIndex = context.read<PokemonBloc>().state.selectedPokemonIndex;

    _pageController ??= PageController(
      viewportFraction: _pokemonSliderViewportFraction,
      initialPage: pageIndex,
    );

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _slideController.dispose();
    _pageController?.dispose();

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
    final pokemonBloc = context.read<PokemonBloc>();

    pokemonBloc.add(PokemonSelectChanged(pokemonId: pokemon.number));

    if (needLoadMore) {
      pokemonBloc.add(PokemonLoadMoreStarted());
    }
  }

  AppBar _buildAppBar() {
    return MainAppBar(
      // A placeholder for easily calculate the translate of the pokemon name
      title: BlocBuilder<PokemonBloc, PokemonState>(builder: (_, state) {
        _calculatePokemonNamePosition();

        return Text(
          state.selectedPokemon.name,
          key: _targetTextKey,
          style: TextStyle(
            color: Colors.transparent,
            fontWeight: FontWeight.w900,
            fontSize: 22,
          ),
        );
      }),
      rightIcon: Icons.favorite_border,
    );
  }

  Widget _buildPokemonName() {
    final fadeAnimation = Tween(begin: 1.0, end: 0.0).animate(controller);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 26),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              final value = controller.value;

              return Transform.translate(
                offset: Offset(textDiffLeft * value, textDiffTop * value),
                child: BlocBuilder<PokemonBloc, PokemonState>(builder: (_, state) {
                  final pokemonName = state.selectedPokemon.name;

                  return Hero(
                    tag: pokemonName,
                    child: Material(
                      color: Colors.transparent,
                      child: Text(
                        pokemonName,
                        key: _currentTextKey,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 36 - (36 - 22) * value,
                        ),
                      ),
                    ),
                  );
                }),
              );
            },
          ),
          AnimatedSlide(
            animation: _slideController,
            child: AnimatedFade(
              animation: fadeAnimation,
              child: BlocBuilder<PokemonBloc, PokemonState>(builder: (_, state) {
                final pokemon = state.selectedPokemon;

                return Hero(
                  tag: pokemon.number,
                  child: Material(
                    color: Colors.transparent,
                    child: Text(
                      pokemon.number,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                      ),
                    ),
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
    final fadeAnimation = Tween(begin: 1.0, end: 0.0).animate(controller);

    return AnimatedFade(
      animation: fadeAnimation,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 26),
        child: BlocBuilder<PokemonBloc, PokemonState>(builder: (_, state) {
          final pokemon = state.selectedPokemon;

          return Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Wrap(
                  spacing: context.responsive(8),
                  runSpacing: context.responsive(8),
                  children: pokemon.types
                      .map(
                        (type) => Hero(
                          tag: type,
                          child: PokemonType(type, large: true),
                        ),
                      )
                      .toList(),
                ),
              ),
              AnimatedSlide(
                animation: _slideController,
                child: Text(
                  pokemon.genera,
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildPokemonSlider() {
    final screenSize = context.screenSize;
    final fadeAnimation = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(
          0.0,
          0.5,
          curve: Curves.ease,
        ),
      ),
    );

    return AnimatedFade(
      animation: fadeAnimation,
      child: SizedBox(
        width: screenSize.width,
        height: screenSize.height * 0.24,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomCenter,
              child: RotationTransition(
                turns: widget.rotateController,
                child: Image(
                  image: AppImages.pokeball,
                  width: screenSize.height * 0.24,
                  height: screenSize.height * 0.24,
                  color: Colors.white.withOpacity(0.14),
                ),
              ),
            ),
            BlocBuilder<PokemonBloc, PokemonState>(builder: (_, state) {
              final pokemons = state.pokemons;

              return PageView.builder(
                physics: BouncingScrollPhysics(),
                controller: _pageController,
                itemCount: pokemons.length,
                onPageChanged: (index) {
                  final needLoadMore = index >= pokemons.length - _endReachedThreshold;
                  _onSelectPokemon(pokemons[index], needLoadMore);
                },
                itemBuilder: (context, index) {
                  final selected = state.selectedPokemonIndex == index;
                  final imageSize = screenSize.height * 0.3;

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
                        imageBuilder: (context, image) => Image(
                          image: image,
                          width: imageSize,
                          height: imageSize,
                          alignment: Alignment.bottomCenter,
                          color: selected ? null : Colors.black26,
                          fit: BoxFit.contain,
                        ),
                        errorWidget: (_, __, error) => Stack(
                          alignment: Alignment.center,
                          children: [
                            Image(
                              image: AppImages.bulbasaur,
                              width: imageSize,
                              height: imageSize,
                              color: Colors.black12,
                            ),
                            Icon(
                              Icons.warning_amber_rounded,
                              size: imageSize * 0.3,
                              color: Colors.black26,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _buildAppBar(),
        VSpacer(context.responsive(9)),
        _buildPokemonName(),
        VSpacer(context.responsive(9)),
        _buildPokemonTypes(),
        VSpacer(context.responsive(25)),
        _buildPokemonSlider(),
      ],
    );
  }
}
