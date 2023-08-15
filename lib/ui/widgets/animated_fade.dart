import 'package:flutter/material.dart';

class AnimatedFade extends AnimatedWidget {
  const AnimatedFade({super.key, 
    required this.child,
    required this.animation,
  }) : super(listenable: animation);

  final Animation<double> animation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final opacity = animation.value;

    return IgnorePointer(
      ignoring: opacity < 1,
      child: Opacity(
        opacity: opacity,
        child: child,
      ),
    );
  }
}
