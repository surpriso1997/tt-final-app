import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tik_tok_app/model/user.dart';

class SharedPref {
  static const USER_KEY = "user";

  static  saveUserData(Useer user) async {
    final instancee = await SharedPreferences.getInstance();
    final userStringJsson = user.toJson();
    final userString = json.encode(userStringJsson);
    instancee.setString(USER_KEY, userString);
  }

  static Future<Useer?> getUserData() async {
    final instancee = await SharedPreferences.getInstance();
    final userString = instancee.getString(USER_KEY);
    if (userString == null) {
      return null;
    }
    final decodedUser = json.decode(userString);
    final Useer user = Useer.fromJson(decodedUser);
    return user;
  }
}
