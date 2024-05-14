import 'package:bloc/bloc.dart';

import '../../const/export.dart';
import 'auth_state.dart';


class AuthCubit extends Cubit<AuthState> {

  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController otpController = TextEditingController(text: "");

  String? selectedRole;
  String? phoneNoErrorText;
  bool phoneNoErrorVisible = false;
  AuthCubit() : super(AuthState().init());

  getRole(String role){
    selectedRole = role;
    emit(RoleSelected());
  }

  getNumber(){
    if(phoneNumberController.text.isNotEmpty){
      emit(GetNumberState());
    }
  }

  getOtp(){
    if(otpController.text.isNotEmpty){
      emit(GetOtpState());
    }
  }
}
