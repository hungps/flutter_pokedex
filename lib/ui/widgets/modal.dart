import 'package:flutter/material.dart';
import 'package:pokedex/configs/colors.dart';
import 'package:pokedex/core/extensions/context.dart';

class Modal extends StatelessWidget {
  static const Radius _borderRadius = Radius.circular(30.0);

  const Modal({
    this.title,
    required this.child,
  });

  final String? title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: context.responsive(14)),
      decoration: BoxDecoration(
        color: AppColors.whiteGrey,
        borderRadius: BorderRadius.only(
          topLeft: _borderRadius,
          topRight: _borderRadius,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _DragLine(),
          _Title(title),
          child,
        ],
      ),
    );
  }
}

class _DragLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = context.screenSize.width * 0.2;

    return Container(
      width: width,
      height: context.responsive(3),
      decoration: ShapeDecoration(
        shape: StadiumBorder(),
        color: AppColors.lighterGrey,
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title(this.text);

  final String? text;

  @override
  Widget build(BuildContext context) {
    if (text == null) {
      return SizedBox();
    }

    return Padding(
      padding: EdgeInsets.only(
        top: context.responsive(18),
        bottom: context.responsive(8),
      ),
      child: Text(
        text ?? '',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
