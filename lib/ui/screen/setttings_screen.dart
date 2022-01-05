import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tik_tok_app/bloc/video/cubit/login_cubit.dart';
import 'package:tik_tok_app/model/user.dart';
import 'package:tik_tok_app/repository/user_repository.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userRepository = RepositoryProvider.of<UserRepository>(context);

    final theme = Theme.of(context);
    final loginCubit = BlocProvider.of<LoginCubit>(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Column(
        children: [
          ValueListenableBuilder<Useer?>(
            valueListenable: userRepository.user,
            child: Column(
              children: [
                //

                ///
              ],
            ),
            builder: (BuildContext context, user, Widget? child) {
              return Column(
                children: [
                  Image.network(
                    user == null ? "https://image.jpg" : user.photoUrl ?? "",
                  ),
                  child!
                ],
              );
            },
          ),
          MaterialButton(
            onPressed: () {
              // userRepository.logOutUser();
            },
            child: Text(
              "Log Out",
              style: theme.textTheme.headline5!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
