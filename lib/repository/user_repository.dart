import 'package:flutter/widgets.dart';
import 'package:tik_tok_app/model/user.dart';
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

  logOutUser() {
    // clears the user data
    userInfo = null;
    user.value = null;
  }
}
