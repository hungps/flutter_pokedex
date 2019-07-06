import 'dart:math';

import 'package:flutter/material.dart';

class DecorationBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Transform.rotate(
      angle: pi * 5 / 12,
      alignment: Alignment.center,
      child: Container(
        width: screenHeight * 0.176,
        height: screenHeight * 0.176,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(
            begin: Alignment(-0.2, -0.2),
            end: Alignment(1.5, -0.3),
            colors: [
              Color(0xFF48D0B0).withOpacity(0.3),
              Colors.white.withOpacity(0),
            ],
          ),
        ),
      ),
    );
  }
}
