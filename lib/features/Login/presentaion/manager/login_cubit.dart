import 'package:acoursa/features/Login/domain/login_repo.dart';
import 'package:acoursa/features/Login/presentaion/manager/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;

  LoginCubit(this.loginRepo) : super(InitialLoginState());

  void login({required String email, required String password}) async {
    emit(LoadingLoginState());
    try {
      await loginRepo.login(data: {'email': email, 'password': password});
      emit(SuccessLoginState());
    } catch (e) {
      emit(ErrorLoginState(e.toString()));
    }
  }
}
