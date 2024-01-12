import 'package:flutter/material.dart';
import 'package:pokedex/presenter/themes/extensions.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    super.key,
    this.color,
    this.backgroundColor,
    this.enableAnimation = true,
    required this.progress,
  });

  final Color? backgroundColor;
  final Color? color;
  final double progress;
  final bool enableAnimation;

  @override
  Widget build(BuildContext context) {
    final child = Container(
      decoration: ShapeDecoration(
        shape: const StadiumBorder(),
        color: color ?? context.colors.primary,
      ),
    );

    return Container(
      clipBehavior: Clip.hardEdge,
      height: 3,
      alignment: Alignment.centerLeft,
      decoration: ShapeDecoration(
        shape: const StadiumBorder(),
        color: backgroundColor ?? context.colors.border,
      ),
      child: enableAnimation
          ? AnimatedAlign(
              duration: const Duration(milliseconds: 260),
              alignment: const Alignment(1, 0),
              widthFactor: progress,
              child: child,
            )
          : FractionallySizedBox(
              widthFactor: progress,
              child: child,
            ),
    );
  }
}
