import 'package:flutter/material.dart';

class HeroText extends Hero {
  HeroText(String text, {TextStyle? style, String? tag, Key? textKey})
      : super(
          tag: tag ?? text,
          child: Material(
            color: Colors.transparent,
            child: Text(text, key: textKey, style: style),
          ),
        );
}
