import 'package:coursaty/features/Sign_Up/domain/signup_repo.dart';
import 'package:coursaty/features/Sign_Up/presentaion/manager/signup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SignupCubit extends Cubit<SignupState> {
  final SignupRepo signupRepo;

  SignupCubit(this.signupRepo) : super(InitialSignUpState());

  void createAccount({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(InitialSignUpState());
    try {
      await signupRepo.createAccount(
        data: {
          'name': name,
          'email': email.trim(),
          'role': 'student',
          'password': password.trim(),
        },
      );
      emit(SuccessSignUpState());
    } catch (e) {
      emit(ErrorSignUpState(e.toString()));
    }
  }
}
