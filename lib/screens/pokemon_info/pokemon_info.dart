import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/screens/pokemon_info/widgets/decoration_box.dart';
import 'package:pokedex/screens/pokemon_info/widgets/info.dart';
import 'package:pokedex/screens/pokemon_info/widgets/tab.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PokemonInfo extends StatefulWidget {
  @override
  _PokemonInfoState createState() => _PokemonInfoState();
}

class _PokemonInfoState extends State<PokemonInfo> with TickerProviderStateMixin {
  final StreamController<double> _scrollProgressStreamController =
      StreamController<double>.broadcast();

  @override
  void dispose() {
    _scrollProgressStreamController.close();

    super.dispose();
  }

  Widget _buildAppBar() {
    return Padding(
      padding: EdgeInsets.only(left: 26, right: 26, top: 56, bottom: 22),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InkWell(
            child: Icon(Icons.arrow_back, color: Colors.white),
            onTap: Navigator.of(context).pop,
          ),
          Icon(Icons.favorite_border, color: Colors.white),
        ],
      ),
    );
  }

  Widget _buildPokemonInfo() {
    return StreamBuilder<double>(
      stream: _scrollProgressStreamController.stream.map((value) {
        final newValue = 1 - 2 * value;

        return newValue < 0 ? 0.0 : newValue;
      }),
      builder: (context, snapshot) {
        return IgnorePointer(
          ignoring: (snapshot.data ?? 1) < 1,
          child: Opacity(
            opacity: snapshot.data ?? 1.0,
            child: PokemonOverallInfo(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    final appBarHeight = 56 + 22 + IconTheme.of(context).size;
    final minCardHeight = screenHeight * 0.536;
    final maxCardHeight = screenHeight - appBarHeight;

    return Scaffold(
      backgroundColor: Color(0xFF48D0B0),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: -screenHeight * 0.055,
            left: -screenHeight * 0.055,
            child: DecorationBox(),
          ),
          Positioned(
            top: 4,
            left: screenHeight * 0.3,
            child: StreamBuilder(
              stream: _scrollProgressStreamController.stream,
              builder: (context, snapshot) => Opacity(
                opacity: 1 - (snapshot.data ?? 0.0),
                child: SvgPicture.asset(
                  "assets/images/dotted.svg",
                  width: screenHeight * 0.07,
                  height: screenHeight * 0.07 * 0.54,
                  color: Colors.white.withOpacity(0.3),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: SlidingUpPanel(
              onPanelSlide: _scrollProgressStreamController.add,
              color: Colors.transparent,
              isDraggable: true,
              minHeight: minCardHeight,
              maxHeight: maxCardHeight,
              panel: PokemonTabInfo(),
            ),
          ),
          Column(
            children: <Widget>[
              _buildAppBar(),
              _buildPokemonInfo(),
            ],
          ),
        ],
      ),
    );
  }
}
