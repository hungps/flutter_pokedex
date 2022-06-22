part of 'theme_cubit.dart';

@immutable
abstract class ThemeState {}

class ThemeDark extends ThemeState {
  final String message;

  ThemeDark({required this.message});
}

class ThemeLight extends ThemeState {
  final String message;

  ThemeLight({required this.message});
}
