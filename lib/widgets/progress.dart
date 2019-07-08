import 'package:flutter/material.dart';
import 'package:pokedex/configs/AppColors.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    @required this.progress,
    this.color = AppColors.red,
    this.backgroundColor = AppColors.lighterGrey,
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
