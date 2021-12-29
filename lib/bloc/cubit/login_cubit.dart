import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';
import 'package:tik_tok_app/model/user.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  signInWithGoogle() async {
    /////

    emit(LoginLoading());
    try {
      /// signingi out the user, so that google login
      /// accoutns are shown every single time

      // final googleSignIn = await GoogleSignIn();
      // await googleSignIn.signOut();

//

      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      Useer? user;
      if (googleUser != null) {
        user = Useer(
          email: googleUser.email,
          photoUrl: googleUser.photoUrl,
          displayName: googleUser.displayName,
          id: googleUser.id,
        );
      }

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

////
      FirebaseAuth.instance.signInWithCredential(credential);
      
      emit(LoginSuccess(data: user));
    } catch (e, s) {
      print(e);
      print(s);

      emit(LoginError(message: "Google sign in failed"));
    }
  }
}
