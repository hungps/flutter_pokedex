import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/pokemon.dart';
import '../../widgets/slide_up_panel.dart';
import 'pokemon_info_arguments.dart';
import 'widgets/info.dart';
import 'widgets/tab.dart';

class PokemonInfo extends StatefulWidget {
  const PokemonInfo({this.pokemonInfoArguments});

  final PokemonInfoArguments pokemonInfoArguments;

  @override
  _PokemonInfoState createState() => _PokemonInfoState();
}

class _PokemonInfoState extends State<PokemonInfo> with TickerProviderStateMixin {
  Color color;

  static const double _pokemonSlideOverflow = 20;

  AnimationController _cardController;
  AnimationController _cardHeightController;
  double _cardMaxHeight = 0.0;
  double _cardMinHeight = 0.0;
  GlobalKey _pokemonInfoKey = GlobalKey();

  @override
  void dispose() {
    _cardController.dispose();
    _cardHeightController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    _cardController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    _cardHeightController = AnimationController(vsync: this, duration: Duration(milliseconds: 220));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final screenHeight = MediaQuery.of(context).size.height;
      final appBarHeight = 60 + 22 + IconTheme.of(context).size;

      final RenderBox pokemonInfoBox = _pokemonInfoKey.currentContext.findRenderObject();

      _cardMinHeight = screenHeight - pokemonInfoBox.size.height + _pokemonSlideOverflow;
      _cardMaxHeight = screenHeight - appBarHeight;

      _cardHeightController.forward();
    });

    super.initState();
  }

  void changeColor(Color changedColor) {
    setState(() {
      color = changedColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    Pokemon pokemon = widget.pokemonInfoArguments.pokemons[widget.pokemonInfoArguments.index];

    return ListenableProvider(
      builder: (context) => _cardController,
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<PokemonInfoArguments>.value(value: widget.pokemonInfoArguments),
          ListenableProvider.value(value: _cardController)
        ],
        child: Scaffold(
          body: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            color: pokemon.color,
            child: Stack(
              children: <Widget>[
                AnimatedBuilder(
                  animation: _cardHeightController,
                  child: PokemonTabInfo(),
                  builder: (context, child) {
                    return SlidingUpPanel(
                      controller: _cardController,
                      minHeight: _cardMinHeight * _cardHeightController.value,
                      maxHeight: _cardMaxHeight,
                      child: child,
                    );
                  },
                ),
                IntrinsicHeight(
                  child: Container(
                    key: _pokemonInfoKey,
                    child: PokemonOverallInfo(
                      changeColor: changeColor,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
