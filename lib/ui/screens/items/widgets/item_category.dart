import 'package:flutter/material.dart';
import 'package:pokedex/core/extensions/context.dart';
import 'package:pokedex/ui/widgets/spacer.dart';

class ItemCategory extends StatelessWidget {
  const ItemCategory(this.name, {super.key});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 3),
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 12,
            vertical: context.responsive(4),
          ),
          decoration: ShapeDecoration(
            shape: const StadiumBorder(),
            color: Colors.white.withOpacity(0.2),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                name,
                textScaler: TextScaler.noScaling,
                style: const TextStyle(
                  fontSize: 10,
                  height: 0.8,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const HSpacer(5),
            ],
          ),
        ),
      ),
    );
  }
}
