import 'package:pokedex/presenter/themes/themes.dart';

abstract class SettingsEvent {
  const SettingsEvent();
}

class SettingsThemeChanged extends SettingsEvent {
  final AppTheme theme;

  const SettingsThemeChanged(this.theme);
}
