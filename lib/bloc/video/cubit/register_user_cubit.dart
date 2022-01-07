import 'package:bloc/bloc.dart';
import 'package:tik_tok_app/bloc/video/cubit/login_cubit.dart';
import 'package:tik_tok_app/repository/user_repository.dart';

class RegisterCubit extends Cubit<LoginState> {
  RegisterCubit({required this.userRepository}) : super(LoginInitial());

  final UserRepository userRepository;

  signUpWithEmail(String email, String password) async {
    emit(LoginLoading());

    final result = await userRepository.signUpWithEmail(email, password);

    // if result is null, it means signup has failed
    if (result == null) {
      emit(LoginError(message: "Signup failed"));
      return;
    }

    ///

    emit(LoginSuccess(data: result));
  }
}
