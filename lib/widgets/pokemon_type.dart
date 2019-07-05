import 'package:flutter/material.dart';

class PokemonType extends StatelessWidget {
  final String label;

  const PokemonType(this.label, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 4,
      ),
      decoration: ShapeDecoration(
        shape: StadiumBorder(),
        color: Colors.white.withOpacity(0.2),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 8,
          height: 0.8,
          color: Colors.white,
        ),
      ),
    );
  }
}
