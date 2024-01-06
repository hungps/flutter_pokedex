import 'package:pokedex/ui/themes/themes.dart';
import 'package:pokedex/ui/themes/themes/themes.light.dart';

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
