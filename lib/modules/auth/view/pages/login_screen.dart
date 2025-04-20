import 'dart:developer';

import 'package:emcus/di/di.dart';
import 'package:emcus/modules/auth/bloc/auth_bloc.dart';
import 'package:emcus/modules/auth/bloc/auth_event.dart';
import 'package:emcus/modules/auth/bloc/auth_state.dart';
import 'package:emcus/modules/auth/bloc/auth_state.dart';
import 'package:emcus/routes.dart';
import 'package:emcus/utils/app_toast.dart';
import 'package:emcus/utils/sizedbox_util.dart';
import 'package:emcus/utils/validator.dart';
import 'package:emcus/widgets/app_textfield_widget.dart.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:emcus/theme/app_colors.dart';
import 'package:emcus/theme/app_text_styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool rememberMe = false;
  late final AuthBloc _authBloc;

  @override
  void initState() {
    super.initState();
    _authBloc = sl<AuthBloc>();
  }

  @override
  void dispose() {
    _authBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.primaryColor,
      body: BlocConsumer<AuthBloc, AuthState>(
        bloc: _authBloc,
        listener: (context, state) {
          if (state.loginStatus == AuthStatus.success) {
            Navigator.pushNamed(context, Routes.home);
          }
          if (state.loginStatus == AuthStatus.failure) {
            showCustomToast(state.errorMessage ?? "");
          }
        },
        builder: (context, state) {
          return Form(
            key: formKey,
            child: Column(
              children: [
                60.0.h,
                Image.asset(
                  "assets/images/emcus_horizontal.png",
                  width: 150,
                ),
                const Spacer(),
                Container(
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Sign In',
                        textAlign: TextAlign.center,
                        style: AppTextStyle.heading,
                      ),
                      10.0.h,
                      const Align(
                          alignment: Alignment.centerLeft,
                          child:
                              Text('Email Address', style: AppTextStyle.body)),
                      8.0.h,
                      AppTextField(
                        hintText: 'Enter your email address',
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: Validator.validateEmail,
                      ),
                      10.0.h,
                      const Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Password', style: AppTextStyle.body)),
                      8.0.h,
                      AppTextField(
                        hintText: 'Enter your password',
                        controller: passwordController,
                        obscureText: true,
                        validator: Validator.validatePassword,
                      ),
                      10.0.h,
                      Row(
                        children: [
                          SizedBox(
                            width: 25,
                            child: Checkbox(
                              value: rememberMe,
                              onChanged: (value) {
                                setState(() {
                                  rememberMe = value ?? false;
                                });
                              },
                            ),
                          ),
                          5.0.w,
                          const Text('Remember me', style: AppTextStyle.body),
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Forgot Password?',
                          style:
                              AppTextStyle.body.copyWith(color: AppColors.red2),
                        ),
                      ),
                      15.0.h,
                      SizedBox(
                        width: 150, // Set width to 150
                        child: ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState?.validate() ?? false) {
                              _authBloc.add(LoginEvent(
                                  email: emailController.text,
                                  password: passwordController.text));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.red2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                          ),
                          child: state.loginStatus == AuthStatus.loading
                              ? const CircularProgressIndicator(
                                  color: AppColors.white,
                                )
                              : Text(
                                  'Sign In',
                                  style: AppTextStyle.bodySmall400Var1
                                      .copyWith(color: AppColors.white),
                                ),
                        ),
                      ),
                      15.0.h,
                      Center(
                        child: Text.rich(
                          TextSpan(
                            text: "Don’t have an account? ",
                            style: AppTextStyle.body,
                            children: [
                              TextSpan(
                                text: 'Sign up here.',
                                style: AppTextStyle.body
                                    .copyWith(color: AppColors.red),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(context, Routes.signUp);
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                      15.0.h,
                    ],
                  ),
                ),
                15.0.h,
              ],
            ),
          );
        },
      ),
    );
  }
}
