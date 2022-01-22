import 'package:flutter/material.dart';
import 'package:pokedex/configs/colors.dart';
import 'package:pokedex/core/extensions/context.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    this.color = AppColors.red,
    this.backgroundColor = AppColors.lighterGrey,
    this.enableAnimation = true,
    required this.progress,
  });

  final Color backgroundColor;
  final Color color;
  final double progress;
  final bool enableAnimation;

  @override
  Widget build(BuildContext context) {
    final child = Container(
      decoration: ShapeDecoration(
        shape: StadiumBorder(),
        color: color,
      ),
    );

    return Container(
      clipBehavior: Clip.hardEdge,
      height: context.responsive(3),
      alignment: Alignment.centerLeft,
      decoration: ShapeDecoration(
        shape: StadiumBorder(),
        color: AppColors.lighterGrey,
      ),
      child: enableAnimation
          ? AnimatedAlign(
              duration: Duration(milliseconds: 260),
              alignment: Alignment(1, 0),
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
