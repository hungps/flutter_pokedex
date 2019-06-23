import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class PokeContainer extends StatelessWidget {
  final List<Widget> children;
  final double height;
  final Decoration decoration;

  const PokeContainer({
    Key key,
    @required this.children,
    this.height,
    this.decoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pokeSize = MediaQuery.of(context).size.width * 0.66;
    final screenSize = MediaQuery.of(context).size;

    return Container(
      width: screenSize.width,
      decoration: decoration,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: -58,
            right: -86,
            child: SvgPicture.asset(
              "assets/images/pokeball.svg",
              width: pokeSize,
              height: pokeSize,
              color: Color(0xFF303943).withOpacity(0.05),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: children,
          ),
        ],
      ),
    );
  }
}
