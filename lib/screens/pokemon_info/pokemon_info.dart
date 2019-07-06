import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex/screens/pokemon_info/widgets/decoration_box.dart';
import 'package:pokedex/screens/pokemon_info/widgets/info.dart';
import 'package:pokedex/screens/pokemon_info/widgets/tab.dart';

class PokemonInfo extends StatefulWidget {
  @override
  _PokemonInfoState createState() => _PokemonInfoState();
}

class _PokemonInfoState extends State<PokemonInfo> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

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
            child: SvgPicture.asset(
              "assets/images/dotted.svg",
              width: screenHeight * 0.07,
              height: screenHeight * 0.07 * 0.54,
              color: Colors.white.withOpacity(0.3),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: PokemonTabInfo(),
          ),
          PokemonOverallInfo(),
        ],
      ),
    );
  }
}
