import 'package:flutter/material.dart';
import 'package:pokedex/configs/constants.dart';

extension BuildContextX on BuildContext {
  Size get screenSize => MediaQuery.of(this).size;

  double get iconSize => IconTheme.of(this).size ?? 0;

  EdgeInsets get padding => MediaQuery.of(this).padding;

  double responsive(double size, {Axis axis = Axis.vertical}) {
    final currentSize = axis == Axis.horizontal ? screenSize.width : screenSize.height;
    final designSize = axis == Axis.horizontal
        ? AppConstants.designScreenSize.width
        : AppConstants.designScreenSize.height;

    return size * currentSize / designSize;
  }
}
