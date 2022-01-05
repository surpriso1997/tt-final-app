import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tik_tok_app/bloc/video/cubit/login_cubit.dart';
import 'package:tik_tok_app/bloc/video/video_cubit.dart';
import 'package:tik_tok_app/repository/user_repository.dart';
import 'package:tik_tok_app/ui/screen/timer_screen.dart';
import 'package:tik_tok_app/utils/theme.dart';
import 'nav/route_generator.dart';
import 'nav/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());

  /// to check the app's platform
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // final userRepository = new UserRepository();

  @override
  Widget build(BuildContext context) {
    // userRepository.getInitialUserData();

    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => LoginCubit()),
          BlocProvider(create: (_) => VideoCubit()),
        ],
        child: RepositoryProvider(
            create: (ctx) => new UserRepository()..getInitialUserData(),
            lazy: false,
            child: MaterialApp(
              title: 'Flutter Demo',
              navigatorKey: navigatorKey,
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: ThemeMode.system,
              onGenerateRoute: customRouteGenerator,
              // initialRoute: Routes.splashScreen,
              home: TimerScreen(),
            )));
  }
}
