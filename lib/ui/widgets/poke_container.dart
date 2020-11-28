import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pokedex/configs/colors.dart';
import 'package:pokedex/configs/images.dart';
import 'package:pokedex/core/extensions/context.dart';

class PokeBackgroundProperties {
  static const double _padding = 24;
  static const double _sizeFraction = 0.664;

  const PokeBackgroundProperties._({this.size, this.top, this.right});

  final double size;
  final double top;
  final double right;

  factory PokeBackgroundProperties(BuildContext context) {
    final screenSize = context.screenSize;
    final iconSize = context.iconSize;

    final size = screenSize.width * _sizeFraction;
    final top = -(size / 2 - iconSize / 2 - context.responsive(_padding) - context.padding.top);
    final right = -(size / 2 - iconSize / 2 - _padding);

    return PokeBackgroundProperties._(size: size, top: top, right: right);
  }
}

class PokeballBackground extends StatelessWidget {
  final List<Widget> Function(PokeBackgroundProperties) buildChildren;

  const PokeballBackground({Key key, @required this.buildChildren}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final properties = PokeBackgroundProperties(context);

    return Stack(
      children: <Widget>[
        Positioned(
          top: properties.top,
          right: properties.right,
          child: Image(
            image: AppImages.pokeball,
            width: properties.size,
            height: properties.size,
            color: AppColors.black.withOpacity(0.05),
          ),
        ),
        ...buildChildren(properties),
      ],
    );
  }
}
