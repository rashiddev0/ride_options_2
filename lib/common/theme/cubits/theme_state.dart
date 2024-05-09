class ThemeState {
  ThemeState init() {
    return InitState();
  }
}

class InitState extends ThemeState {}

class ChangeTheme extends ThemeState {}
