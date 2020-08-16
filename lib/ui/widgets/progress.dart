import 'package:flutter/material.dart';
import 'package:pokedex/configs/colors.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    this.color = AppColors.red,
    this.backgroundColor = AppColors.lighterGrey,
    @required this.progress,
  });

  final Color backgroundColor;
  final Color color;
  final double progress;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 3,
      alignment: Alignment.centerLeft,
      decoration: ShapeDecoration(
        shape: StadiumBorder(),
        color: AppColors.lighterGrey,
      ),
      child: FractionallySizedBox(
        widthFactor: progress,
        heightFactor: 1.0,
        child: Container(
          decoration: ShapeDecoration(
            shape: StadiumBorder(),
            color: color,
          ),
        ),
      ),
    );
  }
}
