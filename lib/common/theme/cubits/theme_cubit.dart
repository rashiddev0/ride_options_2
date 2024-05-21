
import '../../const/export.dart';
import 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  bool isDarkMode = false;
  Brightness? themeMode;
  ThemeCubit() : super(InitState());

  void toggleTheme(bool darkMode) {
    //isDarkMode = !isDarkMode;
    isDarkMode = darkMode;
    emit(ChangeTheme());
  }
}
