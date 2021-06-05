import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Size getTextSize(BuildContext context, String text, TextStyle style) => (TextPainter(
        text: TextSpan(
          text: text,
          style: style,
        ),
        maxLines: 1,
        textScaleFactor: MediaQuery.of(context).textScaleFactor,
        textDirection: TextDirection.ltr)
      ..layout())
    .size;
