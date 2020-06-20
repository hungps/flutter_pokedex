import 'package:flutter/material.dart';
import 'package:pokedex/domain/entities/pokemon_types.dart';

class PokemonType extends StatelessWidget {
  const PokemonType(
    this.type, {
    Key key,
    this.large = false,
    this.colored = false,
    this.extra = '',
  }) : super(key: key);

  final PokemonTypes type;
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
        margin: EdgeInsets.only(right: 7),
        decoration: ShapeDecoration(
          shape: StadiumBorder(),
          color: (colored ? type.color : Colors.white).withOpacity(0.2),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              type.value,
              style: TextStyle(
                fontSize: large ? 12 : 8,
                height: 0.8,
                fontWeight: large ? FontWeight.bold : FontWeight.normal,
                color: colored ? type.color : Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(width: 5),
            Text(
              extra,
              style: TextStyle(
                fontSize: large ? 12 : 8,
                height: 0.8,
                fontWeight: large ? FontWeight.bold : FontWeight.normal,
                color: colored ? type.color : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
