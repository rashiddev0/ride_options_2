import 'package:bloc/bloc.dart';

import 'onboard_state.dart';

class OnboardCubit extends Cubit<OnboardState> {
  int boardingIndex = 0;
  OnboardCubit() : super(OnboardState().init());

  getBoardingIndex(){
    boardingIndex += 1;
    emit(ChangeScreen());
  }
}
