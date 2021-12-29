import 'package:flutter/material.dart';
import 'package:tik_tok_app/ui/screen/login_screen.dart';
import 'package:tik_tok_app/ui/screen/splash_screen.dart';

import 'routes.dart';

Route customRouteGenerator(RouteSettings setting) {
  switch (setting.name) {
    case Routes.splashScreen:
      return MaterialPageRoute(builder: (BuildContext context) {
        return SplashScreen();
      });

    case Routes.loginScreen:
      return MaterialPageRoute(builder: (BuildContext context) {
        return LoginScreen();
      });

    default:
      return MaterialPageRoute(builder: (BuildContext context) {
        return SplashScreen();
      });
  }
}
