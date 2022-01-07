import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tik_tok_app/bloc/video/cubit/login_cubit.dart';
import 'package:tik_tok_app/bloc/video/cubit/register_user_cubit.dart';
import 'package:tik_tok_app/ui/widget/login_button.dart';
import 'package:tik_tok_app/utils/string_constatants.dart';
import 'package:tik_tok_app/utils/theme.dart';

class EmailSignupScreen extends StatefulWidget {
  const EmailSignupScreen({Key? key}) : super(key: key);

  @override
  _EmailSignupScreenState createState() => _EmailSignupScreenState();
}

class _EmailSignupScreenState extends State<EmailSignupScreen> {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool hideOurPassword = true;
  bool isSignupLoading = false;

  @override
  Widget build(BuildContext context) {
    final screehWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xffE3EBF4),
      body: Stack(
        children: [
          Image.network(
            "https://img.freepik.com/free-vector/gradient-white-monochrome-background_23-2149011361.jpg?size=626&ext=jpg",
            fit: BoxFit.cover,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Form(
              key: formKey,
              child: SafeArea(
                top: true,
                child: BlocConsumer<RegisterCubit, LoginState>(
                  listener: (context, state) {
                    if (state is LoginLoading) {
                      isSignupLoading = true;
                      setState(() {});
                    } else if (state is LoginError) {
                      isSignupLoading = false;
                      setState(() {});
                      Fluttertoast.showToast(msg: "Signup Error occurred");
                    } else if (state is LoginSuccess) {
                      isSignupLoading = false;
                      setState(() {});
                      Fluttertoast.showToast(msg: "Signup complete");
                    }
                  },
                  builder: (context, state) {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Text(
                                StringConstants.helloAgain,
                                style: TextStyle(color: Colors.black),
                              ),
                              Text(
                                StringConstants.welcomeBackMessage,
                                style: TextStyle(color: Colors.black),
                              ),
                              TextFormField(
                                controller: emailController,
                                decoration: InputDecoration(
                                    hintText: StringConstants.enterEmail,
                                    hintStyle: TextStyle(
                                      color: AppTheme.formTextColor,
                                    )),
                              ),
                              TextFormField(
                                controller: passwordController,
                                obscureText: hideOurPassword,
                                decoration: InputDecoration(
                                  hintText: StringConstants.enterPassword,
                                  suffix: InkWell(
                                    onTap: () {
                                      hideOurPassword = !hideOurPassword;

                                      setState(() {});
                                    },
                                    child: Icon(Icons.visibility_off),
                                  ),
                                  hintStyle:
                                      TextStyle(color: AppTheme.formTextColor),
                                ),
                              ),

                              /// this is a hacky solution
                              /// prferred choice is to wrap the text with Align
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    StringConstants.forgptPassword,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                              MaterialButton(
                                onPressed: () {
                                  context.read<RegisterCubit>().signUpWithEmail(
                                      emailController.text,
                                      passwordController.text);
                                },
                                color: Color(0xffFD6B68),
                                minWidth: screehWidth,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),

                              RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: StringConstants.notAMember,
                                      style: TextStyle(color: Colors.black)),
                                  TextSpan(
                                    text: StringConstants.registerNow,
                                    style: TextStyle(color: Color(0xff1A78F1)),
                                  ),
                                ]),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  buildSocialLoginIcon(
                                      icon: Icons.home, onPressed: () {}),
                                  buildSocialLoginIcon(
                                      icon: Icons.home, onPressed: () {}),
                                  buildSocialLoginIcon(
                                      icon: Icons.home, onPressed: () {}),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          if (isSignupLoading)
            Center(
              child: CircularProgressIndicator(),
            )
        ],
      ),
    );
  }
}
