import 'package:flutter/material.dart';

class AnimatedSlide extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;

  const AnimatedSlide({
    Key key,
    @required this.child,
    @required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final slideWidth = screenWidth * 0.3;

    return AnimatedBuilder(
      animation: animation,
      child: child,
      builder: (context, widget) => Transform.translate(
        offset: Offset(slideWidth * (1 - animation.value), 0),
        child: widget,
      ),
    );
  }
}
