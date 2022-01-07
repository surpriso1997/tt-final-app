import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:tik_tok_app/model/user.dart';
import 'package:tik_tok_app/utils/custom_exception.dart';
import 'package:tik_tok_app/utils/shared_pref.dart';

// we should use a single instance of user repository throughout the app

class UserRepository {
  Useer? userInfo;

  /// value notifer is used, so that we can propagate the cahnges to the ui
  ValueNotifier<Useer?> user = ValueNotifier(null);

  getInitialUserData() async {
    userInfo = await SharedPref.getUserData();

    if (userInfo != null) {
      user.value = userInfo;
    }
  }

  signInWithGoogle() {}

  signInWithFacebook() {}

  Future<UserCredential?> signUpWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      //  throwing custom excetion
      // throw CustomException(
      //     messsage: "This is a custom exception",
      //     description: " This is an very long description");

      return userCredential;
    } on CustomException catch (e) {
      //
      //
      print(e.messsage);
      print(e.description);
      return null;
    } on FirebaseAuthException catch (e, s) {
      print(e.toString());
      return null;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  signInWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  logOutUser() {
    // clears the user data
    userInfo = null;
    user.value = null;
  }
}
