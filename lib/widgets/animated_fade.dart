import 'package:flutter/material.dart';

class AnimatedFade extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;

  const AnimatedFade({
    @required this.child,
    @required this.animation,
  });

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
