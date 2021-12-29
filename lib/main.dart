import 'package:flutter/material.dart';
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
      theme: ThemeData(primarySwatch: Colors.blue),
      onGenerateRoute: customRouteGenerator,
      initialRoute: Routes.loginScreen,
    );
  }
}
