import 'package:flutter/material.dart';
import 'package:pokedex/presenter/fonts.gen.dart';
import 'package:pokedex/presenter/themes/colors.dart';
import 'package:pokedex/presenter/themes/styles.dart';
import 'package:pokedex/presenter/themes/typography.dart';

class AppTheme extends ThemeExtension<AppTheme> {
  final String name;
  final String fontFamily;
  final Brightness brightness;
  final AppThemeColors colors;
  final AppThemeTypography typographies;
  final AppThemeStyles styles;

  const AppTheme({
    required this.name,
    required this.brightness,
    required this.colors,
    this.styles = const AppThemeStyles(),
    this.typographies = const AppThemeTypography(),
    this.fontFamily = FontFamily.circularStd,
  });

  ColorScheme get baseColorScheme => brightness == Brightness.light //
      ? const ColorScheme.light()
      : const ColorScheme.dark();

  ThemeData get themeData => ThemeData(
        useMaterial3: false,
        platform: TargetPlatform.iOS,
        extensions: [this],
        brightness: brightness,
        primarySwatch: colors.primarySwatch,
        primaryColor: colors.primary,
        unselectedWidgetColor: colors.hint,
        disabledColor: colors.disabled,
        scaffoldBackgroundColor: colors.background,
        hintColor: colors.hint,
        dividerColor: colors.border,
        fontFamily: fontFamily,
        colorScheme: baseColorScheme.copyWith(
          primary: colors.primary,
          onPrimary: colors.textOnPrimary,
          secondary: colors.secondary,
          onSecondary: colors.textOnPrimary,
          error: colors.error,
          shadow: colors.border,
        ),
        appBarTheme: AppBarTheme(
          elevation: 0,
          titleTextStyle: typographies.body,
          centerTitle: true,
          color: Colors.transparent,
          foregroundColor: colors.text,
          surfaceTintColor: colors.text,
        ),
        tabBarTheme: TabBarTheme(
          labelColor: colors.text,
          unselectedLabelColor: colors.text.withOpacity(0.4),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: styles.buttonLarge.copyWith(
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              return states.contains(MaterialState.disabled)
                  ? colors.disabled
                  : null; // Defer to the widget's default.
            }),
            foregroundColor: MaterialStateProperty.resolveWith((states) {
              return states.contains(MaterialState.disabled)
                  ? colors.disabled
                  : null; // Defer to the widget's default.
            }),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: styles.buttonLarge.copyWith(
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              return states.contains(MaterialState.disabled)
                  ? colors.disabled
                  : null; // Defer to the widget's default.
            }),
            foregroundColor: MaterialStateProperty.resolveWith((states) {
              return states.contains(MaterialState.disabled)
                  ? colors.disabled
                  : null; // Defer to the widget's default.
            }),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: styles.buttonLarge.copyWith(
            side: MaterialStateProperty.resolveWith((states) {
              return states.contains(MaterialState.disabled)
                  ? BorderSide(color: colors.disabled)
                  : null;
            }),
            foregroundColor: MaterialStateProperty.resolveWith((states) {
              return states.contains(MaterialState.disabled)
                  ? colors.disabled
                  : null; // Defer to the widget's default.
            }),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: styles.buttonLarge.copyWith(
            backgroundColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
              return states.contains(MaterialState.disabled)
                  ? colors.disabled
                  : null; // Defer to the widget's default.
            }),
            foregroundColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
              return states.contains(MaterialState.disabled)
                  ? colors.disabled
                  : null; // Defer to the widget's default.
            }),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 42),
          filled: true,
          fillColor: colors.backgroundDark,
          hintStyle: typographies.bodySmall.copyWith(
            fontWeight: FontWeight.w500,
            color: colors.text.withOpacity(0.4),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide.none,
          ),
          prefixIconColor: colors.text,
          suffixIconColor: colors.text,
        ),
        checkboxTheme: CheckboxThemeData(
          visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          side: BorderSide(color: colors.border),
        ),
        radioTheme: const RadioThemeData(
          visualDensity: VisualDensity(horizontal: -4, vertical: -4),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: colors.secondary,
          foregroundColor: colors.textOnPrimary,
          elevation: 0,
        ),
        dividerTheme: DividerThemeData(
          color: colors.border,
          thickness: 1,
          space: 1,
        ),
      );

  @override
  AppTheme copyWith({
    String? name,
    Brightness? brightness,
    AppThemeColors? colors,
    AppThemeTypography? typographies,
    AppThemeStyles? styles,
  }) {
    return AppTheme(
      brightness: brightness ?? this.brightness,
      name: name ?? this.name,
      colors: colors ?? this.colors,
      typographies: typographies ?? this.typographies,
      styles: styles ?? this.styles,
    );
  }

  @override
  AppTheme lerp(covariant ThemeExtension<AppTheme>? other, double t) {
    if (other is! AppTheme) {
      return this;
    }
    return AppTheme(
      name: name,
      brightness: brightness,
      colors: colors.lerp(other.colors, t),
      typographies: typographies.lerp(other.typographies, t),
      styles: styles,
    );
  }
}
