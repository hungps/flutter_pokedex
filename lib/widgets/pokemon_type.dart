import 'package:flutter/material.dart';
import 'package:pokedex/data/pokemons.dart';

class PokemonType extends StatelessWidget {
  const PokemonType(this.label,
      {Key key, this.large = false, this.colored = false, this.extra = ""})
      : super(key: key);

  final String label;
  final String extra;
  final bool large;
  final bool colored;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: large ? 19 : 12,
          vertical: large ? 6 : 4,
        ),
        decoration: ShapeDecoration(
          shape: StadiumBorder(),
          color: (colored ? getPokemonColor(label) : Colors.white)
              .withOpacity(0.2),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              label,
              style: TextStyle(
                fontSize: large ? 12 : 8,
                height: 0.8,
                fontWeight: large ? FontWeight.bold : FontWeight.normal,
                color: colored ? getPokemonColor(label) : Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              extra,
              style: TextStyle(
                fontSize: large ? 12 : 8,
                height: 0.8,
                fontWeight: large ? FontWeight.bold : FontWeight.normal,
                color: colored ? getPokemonColor(label) : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
