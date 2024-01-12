import 'package:pokedex/presenter/themes/themes.dart';
import 'package:pokedex/presenter/themes/themes/themes.light.dart';

class SettingsState {
  final AppTheme theme;

  const SettingsState({
    this.theme = const LightAppTheme(),
  });

  SettingsState copyWith({
    AppTheme? theme,
  }) {
    return SettingsState(
      theme: theme ?? this.theme,
    );
  }
}
