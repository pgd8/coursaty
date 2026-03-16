class SignupState {}

class InitialSignUpState extends SignupState {}

class LoadingSignUpState extends SignupState {}

class SuccessSignUpState extends SignupState {}

class ErrorSignUpState extends SignupState {
  final String message;

  ErrorSignUpState(this.message);
}