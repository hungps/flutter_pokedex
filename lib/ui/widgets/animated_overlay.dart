import 'package:flutter/material.dart';

class AnimatedOverlay extends AnimatedWidget {
  final Color color;
  final Widget? child;
  final void Function()? onPress;

  const AnimatedOverlay({super.key, 
    required Animation animation,
    required this.color,
    this.child,
    this.onPress,
  }) : super(listenable: animation);

  Animation<double> get animation => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        IgnorePointer(
          ignoring: animation.value == 0,
          child: InkWell(
            onTap: onPress,
            child: Container(
              color: color.withOpacity(animation.value * 0.5),
            ),
          ),
        ),
        if (child != null) child!,
      ],
    );
  }
}
