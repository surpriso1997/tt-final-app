import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';
import 'package:tik_tok_app/model/user.dart';
import 'package:tik_tok_app/utils/shared_pref.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  signInWithGoogle() async {
    /////

    emit(LoginLoading());
    try {
      /// signingi out the user, so that google login
      /// accoutns are shown every single time

      final googleSignIn = await GoogleSignIn();
      await googleSignIn.signOut();

      ///

      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      ///
      await FirebaseAuth.instance.signInWithCredential(credential);

      Useer? user;
      if (googleUser != null) {
        user = new Useer(
          token: googleAuth?.accessToken ?? "randmotoken",
          email: googleUser.email,
          photoUrl: googleUser.photoUrl,
          displayName: googleUser.displayName,
          id: googleUser.id,
        );

        await SharedPref.saveUserData(user);
      }

      emit(LoginSuccess(data: user));
    } catch (e, s) {
      print(e);
      print(s);

      emit(LoginError(message: "Google sign in failed"));
    }
  }
}
