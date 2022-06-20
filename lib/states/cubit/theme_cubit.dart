import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'theme_state.dart';

// Values are stored and updated here
class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeLight(message: 'Light Theme'));

  bool _isDark = false;

  bool get isDark => _isDark;

  void toggleTheme() {
    _isDark = !_isDark;
    if (_isDark) {
      emit(ThemeDark(message: 'Dark Theme'));
    } else {
      emit(ThemeLight(message: 'Light Theme'));
    }
  }
}
