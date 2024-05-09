import 'package:flutter_bloc/flutter_bloc.dart';

import 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {

  bool isDarkMode = false;

  ThemeCubit() : super(ThemeState().init());

  void toggleTheme() {
      isDarkMode = !isDarkMode;
      emit(ChangeTheme());
  }
}
