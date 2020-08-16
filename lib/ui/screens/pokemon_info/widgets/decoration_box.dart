import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pokedex/core/extensions/context.dart';

class DecorationBox extends StatelessWidget {
  static const double boxSizeFraction = 0.176;

  @override
  Widget build(BuildContext context) {
    final boxSize = context.screenSize.height * boxSizeFraction;

    return Transform.rotate(
      angle: pi * 5 / 12,
      alignment: Alignment.center,
      child: Container(
        width: boxSize,
        height: boxSize,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(
            begin: Alignment(-0.2, -0.2),
            end: Alignment(1.5, -0.3),
            colors: [
              Colors.white.withOpacity(0.3),
              Colors.white.withOpacity(0),
            ],
          ),
        ),
      ),
    );
  }
}
