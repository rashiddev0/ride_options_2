class AuthState {
  AuthState init() {
    return AuthState();
  }

  AuthState clone() {
    return AuthState();
  }
}

class RoleSelected extends AuthState{}
class GetNumberState extends AuthState{}
class GetOtpState extends AuthState{}
