import 'package:flutter/material.dart';

class AppThemeTypography {
  final TextStyle headingLarge;
  final TextStyle heading;
  final TextStyle headingSmall;
  final TextStyle bodyExtraLarge;
  final TextStyle bodyLarge;
  final TextStyle body;
  final TextStyle bodySmall;
  final TextStyle bodyExtraSmall;
  final TextStyle captionLarge;
  final TextStyle caption;
  final TextStyle captionSmall;

  const AppThemeTypography({
    required this.headingLarge,
    required this.heading,
    required this.headingSmall,
    required this.bodyExtraLarge,
    required this.bodyLarge,
    required this.body,
    required this.bodySmall,
    required this.bodyExtraSmall,
    required this.captionLarge,
    required this.caption,
    required this.captionSmall,
  });

  AppThemeTypography lerp(covariant dynamic other, double t) {
    if (other is! AppThemeTypography) return this;

    return AppThemeTypography(
      headingLarge: TextStyle.lerp(headingLarge, other.headingLarge, t)!,
      heading: TextStyle.lerp(heading, other.heading, t)!,
      headingSmall: TextStyle.lerp(headingSmall, other.headingSmall, t)!,
      bodyExtraLarge: TextStyle.lerp(bodyExtraLarge, other.bodyExtraLarge, t)!,
      bodyLarge: TextStyle.lerp(bodyLarge, other.bodyLarge, t)!,
      body: TextStyle.lerp(body, other.body, t)!,
      bodySmall: TextStyle.lerp(bodySmall, other.bodySmall, t)!,
      bodyExtraSmall: TextStyle.lerp(bodyExtraSmall, other.bodyExtraSmall, t)!,
      captionLarge: TextStyle.lerp(captionLarge, other.captionLarge, t)!,
      caption: TextStyle.lerp(caption, other.caption, t)!,
      captionSmall: TextStyle.lerp(captionSmall, other.captionSmall, t)!,
    );
  }
}
