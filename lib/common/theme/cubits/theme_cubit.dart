import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  bool isDarkMode = false;
  bool useSystemTheme = true; // Default to using system theme
  Brightness? themeMode;

  ThemeCubit() : super(InitState());

  void toggleTheme(bool darkMode) {
    isDarkMode = darkMode;
    useSystemTheme = false;
    emit(ChangeTheme());
  }

  void setSystemTheme(bool useSystem) {
    useSystemTheme = useSystem;
    emit(UseSystemTheme());
  }
}
