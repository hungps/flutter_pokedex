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
    this.headingLarge = const TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w900,
    ),
    this.heading = const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w900,
    ),
    this.headingSmall = const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w900,
    ),
    this.bodyExtraLarge = const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),
    this.bodyLarge = const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    this.body = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    this.bodySmall = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    this.bodyExtraSmall = const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
    this.captionLarge = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700,
    ),
    this.caption = const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
    ),
    this.captionSmall = const TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w600,
    ),
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
