import 'package:flutter/material.dart';
import 'package:tik_tok_app/utils/theme.dart';
import 'nav/route_generator.dart';
import 'nav/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());

  /// to check the app's platform
}

class Firebase {}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {




    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: navigatorKey,

      theme: AppTheme.lightTheme,

      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      onGenerateRoute: customRouteGenerator,
      initialRoute: Routes.splashScreen,
    );
  }
}
