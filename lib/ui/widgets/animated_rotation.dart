import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedRotation extends StatelessWidget {
  const AnimatedRotation({
    Key key,
    @required this.child,
    @required this.animation,
  });

  final Animation<double> animation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    // return child;

    return AnimatedBuilder(
      animation: animation,
      child: child,
      builder: (context, widget) => Transform.rotate(
        angle: 2 * pi * animation.value,
        child: widget,
      ),
    );
  }
}
