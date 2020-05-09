import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/configs/colors.dart';
import 'package:pokedex/configs/images.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/providers/providers.dart';
import 'package:pokedex/ui/screens/pokemon_info/widgets/decoration_box.dart';
import 'package:pokedex/ui/screens/pokemon_info/widgets/info.dart';
import 'package:pokedex/ui/screens/pokemon_info/widgets/tab.dart';
import 'package:pokedex/ui/widgets/animated_fade.dart';
import 'package:pokedex/ui/widgets/animated_rotation.dart';
import 'package:pokedex/ui/widgets/poke_app_bar.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PokemonInfo extends StatefulWidget {
  final Pokemon pokemon;

  const PokemonInfo(this.pokemon);

  @override
  _PokemonInfoState createState() => _PokemonInfoState();
}

class _PokemonInfoState extends State<PokemonInfo> with TickerProviderStateMixin {
  static const double _pokemonSlideOverflow = 20;

  final GlobalKey _pokemonInfoKey = GlobalKey();

  AnimationController _cardController;
  AnimationController _cardHeightController;
  AnimationController _rotateController;
  double _cardMinHeight = 0.0;
  double _cardMaxHeight = 0.0;

  @override
  void dispose() {
    _cardController.dispose();
    _cardHeightController.dispose();
    _rotateController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    _cardController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _cardHeightController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 220),
    );

    _rotateController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 5000),
    );
    _rotateController.repeat();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final screenHeight = MediaQuery.of(context).size.height;

      final RenderBox pokemonInfoBox = _pokemonInfoKey.currentContext.findRenderObject();

      final appBarHeight = PokeAppBar().preferredSize.height;
      _cardMinHeight = screenHeight - pokemonInfoBox.size.height;
      _cardMaxHeight = screenHeight - appBarHeight - MediaQuery.of(context).padding.top;
      _cardHeightController.forward();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final pokeSize = screenWidth * 0.448;
    final pokeTop =
        -(pokeSize / 2 - (IconTheme.of(context).size / 2 + AppBar().preferredSize.height));
    final pokeRight = -(pokeSize / 2 - (IconTheme.of(context).size / 2 + 28));

    return Stack(
      children: <Widget>[
        Consumer((context, read) {
          final currentPokemon = read(currentPokemonStateProvider).pokemon;

          return Container(
            width: 200,
            height: 200,
            constraints: BoxConstraints.expand(),
            color: currentPokemon.color ?? AppColors.teal,
          );
        }),
        Positioned(
          top: -screenHeight * 0.055,
          left: -screenHeight * 0.055,
          child: DecorationBox(),
        ),
        Positioned(
          top: 4,
          left: screenHeight * 0.3,
          child: AnimatedFade(
            animation: Tween(begin: 1.0, end: 0.0).animate(_cardController),
            child: Image(
              image: AppImages.dotted,
              width: screenHeight * 0.07,
              height: screenHeight * 0.07 * 0.54,
              color: Colors.white.withOpacity(0.3),
            ),
          ),
        ),
        Positioned(
          top: pokeTop,
          right: pokeRight,
          child: AnimatedFade(
            animation: _cardController,
            child: AnimatedRotation(
              animation: _rotateController,
              child: Image(
                image: AppImages.pokeball,
                width: pokeSize,
                height: pokeSize,
                color: Colors.white.withOpacity(0.26),
              ),
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: <Widget>[
              AnimatedBuilder(
                animation: _cardHeightController,
                child: PokemonTabInfo(_cardController),
                builder: (context, child) {
                  return SlidingUpPanel(
                    minHeight: _cardMinHeight * _cardHeightController.value + _pokemonSlideOverflow,
                    maxHeight: _cardMaxHeight,
                    boxShadow: null,
                    color: Colors.transparent,
                    panel: child,
                    onPanelSlide: (position) => _cardController.value = position,
                  );
                },
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  key: _pokemonInfoKey,
                  child: PokemonOverallInfo(widget.pokemon, _cardController, _rotateController),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
