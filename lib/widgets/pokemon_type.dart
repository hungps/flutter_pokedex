import 'package:flutter/material.dart';

class PokemonType extends StatelessWidget {
  final bool large;
  final String label;

  const PokemonType(this.label, {Key key, this.large = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: large ? 19 : 12,
        vertical: large ? 6 : 4,
      ),
      decoration: ShapeDecoration(
        shape: StadiumBorder(),
        color: Colors.white.withOpacity(0.2),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: large ? 12 : 8,
          height: 0.8,
          fontWeight: large ? FontWeight.bold : FontWeight.normal,
          color: Colors.white,
        ),
      ),
    );
  }
}
