import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Size getTextSize(BuildContext context, String text, TextStyle style) {
  final textPainter = TextPainter(
    text: TextSpan(
      text: text,
      style: style,
    ),
    maxLines: 1,
    textDirection: TextDirection.ltr,
  )..layout();
  return textPainter.size;
}
