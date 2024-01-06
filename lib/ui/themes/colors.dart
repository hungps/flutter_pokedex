import 'package:flutter/material.dart';

class AppThemeColors {
  final MaterialColor primarySwatch;
  final Color primary;
  final Color secondary;
  final Color accent;
  final Color background;
  final Color backgroundDark;
  final Color disabled;
  final Color information;
  final Color success;
  final Color alert;
  final Color warning;
  final Color error;
  final Color text;
  final Color textOnPrimary;
  final Color border;
  final Color hint;

  const AppThemeColors({
    required this.primarySwatch,
    required this.primary,
    required this.secondary,
    required this.accent,
    required this.background,
    required this.backgroundDark,
    required this.disabled,
    required this.information,
    required this.success,
    required this.alert,
    required this.warning,
    required this.error,
    required this.text,
    required this.textOnPrimary,
    required this.border,
    required this.hint,
  });

  AppThemeColors lerp(covariant dynamic other, double t) {
    if (other is! AppThemeColors) {
      return this;
    }
    return AppThemeColors(
      primarySwatch: primarySwatch,
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      background: Color.lerp(background, other.background, t)!,
      backgroundDark: Color.lerp(backgroundDark, other.backgroundDark, t)!,
      disabled: Color.lerp(disabled, other.disabled, t)!,
      information: Color.lerp(information, other.information, t)!,
      success: Color.lerp(success, other.success, t)!,
      alert: Color.lerp(alert, other.alert, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      error: Color.lerp(error, other.error, t)!,
      text: Color.lerp(text, other.text, t)!,
      textOnPrimary: Color.lerp(textOnPrimary, other.textOnPrimary, t)!,
      border: Color.lerp(border, other.border, t)!,
      hint: Color.lerp(hint, other.hint, t)!,
    );
  }

  AppThemeColors copyWith({
    MaterialColor? primarySwatch,
    Color? primary,
    Color? secondary,
    Color? accent,
    Color? background,
    Color? backgroundDark,
    Color? disabled,
    Color? information,
    Color? success,
    Color? alert,
    Color? warning,
    Color? error,
    Color? text,
    Color? textOnPrimary,
    Color? border,
    Color? hint,
  }) {
    return AppThemeColors(
      primarySwatch: primarySwatch ?? this.primarySwatch,
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      accent: accent ?? this.accent,
      background: background ?? this.background,
      backgroundDark: backgroundDark ?? this.backgroundDark,
      disabled: disabled ?? this.disabled,
      information: information ?? this.information,
      success: success ?? this.success,
      alert: alert ?? this.alert,
      warning: warning ?? this.warning,
      error: error ?? this.error,
      text: text ?? this.text,
      textOnPrimary: textOnPrimary ?? this.textOnPrimary,
      border: border ?? this.border,
      hint: hint ?? this.hint,
    );
  }
}
