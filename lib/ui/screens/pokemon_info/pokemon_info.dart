import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/configs/images.dart';
import 'package:pokedex/core/extensions/context.dart';
import 'package:pokedex/domain/entities/pokemon.dart';
import 'package:pokedex/states/pokemon/pokemon_bloc.dart';
import 'package:pokedex/states/pokemon/pokemon_state.dart';
import 'package:pokedex/ui/screens/pokemon_info/widgets/decoration_box.dart';
import 'package:pokedex/ui/screens/pokemon_info/widgets/pokemon_basic_info.dart';
import 'package:pokedex/ui/screens/pokemon_info/widgets/tab.dart';
import 'package:pokedex/ui/widgets/animated_fade.dart';
import 'package:pokedex/ui/widgets/main_app_bar.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PokemonInfo extends StatefulWidget {
  const PokemonInfo(this.pokemon);

  final Pokemon pokemon;

  @override
  _PokemonInfoState createState() => _PokemonInfoState();
}

class _PokemonInfoState extends State<PokemonInfo> with TickerProviderStateMixin {
  static const double _pokemonSlideOverflow = 20;

  final GlobalKey _pokemonInfoKey = GlobalKey();

  double _cardMinHeight = 0.0;
  double _cardMaxHeight = 0.0;
  late AnimationController _cardController;
  late AnimationController _cardHeightController;
  late AnimationController _rotateController;

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

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      final screenHeight = context.screenSize.height;

      final pokemonInfoBox = _pokemonInfoKey.currentContext?.findRenderObject() as RenderBox?;

      if (pokemonInfoBox == null) return;

      _cardMinHeight = screenHeight - pokemonInfoBox.size.height;
      _cardMaxHeight = screenHeight - kToolbarHeight - context.padding.top;

      _cardHeightController.forward();
    });

    super.initState();
  }

  @override
  void dispose() {
    _cardController.dispose();
    _cardHeightController.dispose();
    _rotateController.dispose();

    super.dispose();
  }

  Widget _buildBackground() {
    return BlocBuilder<PokemonBloc, PokemonState>(builder: (_, state) {
      return AnimatedContainer(
        duration: Duration(milliseconds: 300),
        constraints: BoxConstraints.expand(),
        color: state.selectedPokemon.color,
      );
    });
  }

  Widget _buildBoxDecoration() {
    final screenSize = context.screenSize;

    return Positioned(
      top: -screenSize.height * 0.055,
      left: -screenSize.height * 0.055,
      child: DecorationBox(),
    );
  }

  Widget _buildDottedDecoration() {
    final screenSize = context.screenSize;

    return Positioned(
      top: context.responsive(4),
      left: screenSize.height * 0.3,
      child: AnimatedFade(
        animation: Tween(begin: 1.0, end: 0.0).animate(_cardController),
        child: Image(
          image: AppImages.dotted,
          width: screenSize.height * 0.07,
          height: screenSize.height * 0.07 * 0.54,
          color: Colors.white.withOpacity(0.3),
        ),
      ),
    );
  }

  Widget _buildAppBarPokeballDecoration() {
    final screenSize = context.screenSize;
    final safeAreaTop = MediaQuery.of(context).padding.top;

    final pokeSize = screenSize.width * 0.5;
    final appBarHeight = AppBar().preferredSize.height;
    final iconButtonPadding = mainAppbarPadding;
    final iconSize = IconTheme.of(context).size ?? 0;

    final pokeballTopMargin = -(pokeSize / 2 - safeAreaTop - appBarHeight / 2);
    final pokeballRightMargin = -(pokeSize / 2 - iconButtonPadding - iconSize / 2);

    return Positioned(
      top: pokeballTopMargin,
      right: pokeballRightMargin,
      child: IgnorePointer(
        ignoring: true,
        child: AnimatedFade(
          animation: _cardController,
          child: RotationTransition(
            turns: _rotateController,
            child: Image(
              image: AppImages.pokeball,
              width: pokeSize,
              height: pokeSize,
              color: Colors.white.withOpacity(0.26),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPokemon() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        key: _pokemonInfoKey,
        child: PokemonOverallInfo(widget.pokemon, _cardController, _rotateController),
      ),
    );
  }

  Widget _buildPokemonSlider() {
    return AnimatedBuilder(
      animation: _cardHeightController,
      child: PokemonTabInfo(_cardController),
      builder: (_, child) {
        return SlidingUpPanel(
          minHeight: _cardMinHeight * _cardHeightController.value + _pokemonSlideOverflow,
          maxHeight: _cardMaxHeight,
          boxShadow: null,
          color: Colors.transparent,
          panel: child,
          onPanelSlide: (position) => _cardController.value = position,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _buildBackground(),
        _buildBoxDecoration(),
        _buildDottedDecoration(),
        _buildAppBarPokeballDecoration(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: <Widget>[
              _buildPokemonSlider(),
              _buildPokemon(),
            ],
          ),
        ),
      ],
    );
  }
}
