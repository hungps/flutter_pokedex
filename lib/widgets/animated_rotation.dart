import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedRotation extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;

  const AnimatedRotation({
    Key key,
    @required this.child,
    @required this.animation,
  });

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
