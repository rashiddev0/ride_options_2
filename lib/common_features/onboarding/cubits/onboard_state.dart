class OnboardState {
  OnboardState init() {
    return InitState();
  }
  OnboardState clone() {
    return OnboardState();
  }
}

class InitState extends OnboardState {}

class ChangeScreen extends OnboardState {}
