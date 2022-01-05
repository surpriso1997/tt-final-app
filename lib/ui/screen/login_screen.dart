import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tik_tok_app/bloc/video/cubit/login_cubit.dart';
import 'package:tik_tok_app/nav/routes.dart';
import 'package:tik_tok_app/utils/assets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final loginCubit = BlocProvider.of<LoginCubit>(context);

    return Scaffold(
      body: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginLoading) {
          } else if (state is LoginError) {
            /// show error message to the user
            Fluttertoast.showToast(msg: state.message);
          } else if (state is LoginSuccess) {
            /// show success message to tht user
            /// navigate the user to some other page: dashboard or homepage or feeds
            Fluttertoast.showToast(msg: "Login success! Welcome");

            Navigator.pushNamed(context, Routes.homepageScreen);
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  // this line and the line below that are same thing
                  // BlocProvider.of<LoginCubit>(context).signInWithGoogle();

                  context.read<LoginCubit>().signInWithGoogle();
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Image.asset(
                        Assets.googleIcon,
                        height: 30,
                        width: 30,
                      ),
                      SizedBox(width: 20),
                      Text(
                        "Sign in with Google",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
