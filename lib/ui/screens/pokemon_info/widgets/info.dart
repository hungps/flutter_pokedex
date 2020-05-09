import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/configs/durations.dart';
import 'package:pokedex/configs/images.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/domain/entities/pokemon_types.dart';
import 'package:pokedex/providers/providers.dart';
import 'package:pokedex/ui/widgets/animated_fade.dart';
import 'package:pokedex/ui/widgets/animated_rotation.dart';
import 'package:pokedex/ui/widgets/animated_slide.dart';
import 'package:pokedex/ui/widgets/poke_app_bar.dart';
import 'package:pokedex/ui/widgets/pokemon_type.dart';

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

//  PokedexBloc _bloc;
  double textDiffLeft = 0.0;
  double textDiffTop = 0.0;
  PageController _pageController;
  AnimationController _slideController;

  Pokemon get pokemon => widget.pokemon;

  AnimationController get controller => widget.controller;

  @override
  void initState() {
    _slideController = AnimationController(
      vsync: this,
      duration: animationDuration,
    );
    _slideController.forward();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final RenderBox targetTextBox = _targetTextKey.currentContext.findRenderObject();
      final targetTextPosition = targetTextBox.localToGlobal(Offset.zero);

      final currentTextBox = _currentTextKey.currentContext.findRenderObject() as RenderBox;
      final currentTextPosition = currentTextBox.localToGlobal(Offset.zero);

      textDiffLeft = targetTextPosition.dx - currentTextPosition.dx;
      textDiffTop = targetTextPosition.dy - currentTextPosition.dy;
    });

    super.initState();
  }

  @override
  void didChangeDependencies() {
    _pageController ??= PageController(
      viewportFraction: _pokemonSliderViewportFraction,
      initialPage: currentPokemonStateProvider.read(context).index,
    );

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _slideController?.dispose();
    _pageController?.dispose();

    super.dispose();
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
              final value = controller.value ?? 0.0;

              return Transform.translate(
                offset: Offset(textDiffLeft * value, textDiffTop * value),
                child: Consumer((_, read) {
                  final pokemonName = read(currentPokemonStateProvider).pokemon.name;

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
              child: Consumer((_, read) {
                final tag = read(currentPokemonStateProvider).pokemon;

                return Hero(
                  tag: tag.number,
                  child: Material(
                    color: Colors.transparent,
                    child: Text(
                      tag.number,
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
        child: Consumer((_, read) {
          final pokemon = read(currentPokemonStateProvider).pokemon;

          return Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                children: pokemon.types
                    .map(
                      (type) => Hero(
                        tag: type,
                        child: PokemonType(type.value, large: true),
                      ),
                    )
                    .toList(),
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
    final screenSize = MediaQuery.of(context).size;
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
              child: AnimatedRotation(
                animation: widget.rotateController,
                child: Image(
                  image: AppImages.pokeball,
                  width: screenSize.height * 0.24,
                  height: screenSize.height * 0.24,
                  color: Colors.white.withOpacity(0.14),
                ),
              ),
            ),
            Consumer((context, read) {
              final pokemonsState = read(pokemonsStateProvider);
              final currentPokemonState = read(currentPokemonStateProvider);

              final pokemons = pokemonsState.pokemons;

              return PageView.builder(
                physics: BouncingScrollPhysics(),
                controller: _pageController,
                itemCount: pokemons.length,
                onPageChanged: (index) {
                  currentPokemonState.setPokemon(index, pokemons[index]);

                  final thresholdReached = index >= pokemons.length - _endReachedThreshold;

                  if (pokemonsState.canLoadMore && thresholdReached) {
                    pokemonsState.getPokemons();
                  }
                },
                itemBuilder: (context, index) => Hero(
                  tag: pokemons[index].image,
                  child: AnimatedPadding(
                    duration: Duration(milliseconds: 600),
                    curve: Curves.easeOutQuint,
                    padding: EdgeInsets.only(
                      top: currentPokemonState.index == index ? 0 : screenSize.height * 0.04,
                      bottom: currentPokemonState.index == index ? 0 : screenSize.height * 0.04,
                    ),
                    child: CachedNetworkImage(
                      imageUrl: pokemons[index].image,
                      imageBuilder: (context, image) => Image(
                        image: image,
                        width: screenSize.height * 0.28,
                        height: screenSize.height * 0.28,
                        alignment: Alignment.bottomCenter,
                        color: currentPokemonState.index == index ? null : Colors.black26,
                      ),
                    ),
                  ),
                ),
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
        PokeAppBar(
          // A placeholder for easily calculate the translate of the pokemon name
          title: Text(
            pokemon.name,
            key: _targetTextKey,
            style: TextStyle(
              color: Colors.transparent,
              fontWeight: FontWeight.w900,
              fontSize: 22,
            ),
          ),
          rightIcon: Icons.favorite_border,
        ),
        SizedBox(height: 9),
        _buildPokemonName(),
        SizedBox(height: 9),
        _buildPokemonTypes(),
        SizedBox(height: 25),
        _buildPokemonSlider(),
      ],
    );
  }
}
