import 'package:flutter/material.dart';

class AnimatedFade extends StatelessWidget {
  const AnimatedFade({
    @required this.child,
    @required this.animation,
  });

  final Animation<double> animation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      child: child,
      builder: (context, widget) => IgnorePointer(
        ignoring: animation.value < 1,
        child: Opacity(
          opacity: animation.value,
          child: widget,
        ),
      ),
    );
  }
}
