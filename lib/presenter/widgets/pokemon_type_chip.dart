import 'package:flutter/material.dart';
import 'package:pokedex/data/entities/pokemon_types.dart';
import 'package:pokedex/presenter/themes/extensions.dart';

class PokemonTypeChip extends StatelessWidget {
  final PokemonTypes type;
  final String? extra;
  final bool colored;
  final EdgeInsets padding;
  final TextStyle style;

  const PokemonTypeChip(
    this.type, {
    super.key,
    this.colored = false,
    this.extra,
  })  : padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
        style = const TextStyle(
          fontSize: 8,
          height: 1,
          fontWeight: FontWeight.normal,
        );

  const PokemonTypeChip.large(
    this.type, {
    super.key,
    this.colored = false,
    this.extra,
  })  : padding = const EdgeInsets.symmetric(horizontal: 19, vertical: 5),
        style = const TextStyle(
          fontSize: 12,
          height: 1,
          fontWeight: FontWeight.bold,
        );

  @override
  Widget build(BuildContext context) {
    final backgroundColor = colored ? type.color : context.colors.background;
    final foregroundColor = colored ? type.color : context.colors.textOnPrimary;

    return Container(
      padding: padding,
      decoration: ShapeDecoration(
        shape: const StadiumBorder(),
        color: backgroundColor.withOpacity(.14),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            type.displayName,
            textScaler: TextScaler.noScaling,
            style: style.copyWith(color: foregroundColor),
          ),
          if (extra case String extra)
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text(
                extra,
                textScaler: TextScaler.noScaling,
                style: style.copyWith(color: foregroundColor),
              ),
            ),
        ],
      ),
    );
  }
}
