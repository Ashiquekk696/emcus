import 'package:emcus/di/di.dart';
import 'package:emcus/modules/auth/bloc/auth_bloc.dart';
import 'package:emcus/modules/auth/bloc/auth_event.dart';
import 'package:emcus/modules/auth/bloc/auth_state.dart';
import 'package:emcus/routes.dart';
import 'package:emcus/utils/app_toast.dart';
import 'package:emcus/utils/sizedbox_util.dart';
import 'package:emcus/utils/validator.dart';
import 'package:emcus/widgets/app_textfield_widget.dart.dart';
import 'package:flutter/material.dart';

import 'package:emcus/theme/app_colors.dart';
import 'package:emcus/theme/app_text_styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameController = TextEditingController();
  final companyController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool termsAccepted = false;
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
          if (state.registerStatus == AuthStatus.success) {
            showCustomToast("User created succesfully.");
            Navigator.pushNamed(context, Routes.login);
          }
          if (state.registerStatus == AuthStatus.failure) {
            showCustomToast(state.errorMessage ?? "");
          }
        },
        builder: (context, state) {
          return Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  25.0.h,
                  Image.asset(
                    "assets/images/emcus_horizontal.png",
                    width: 150,
                  ),
                  Container(
                    margin: const EdgeInsets.all(16),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Register',
                          textAlign: TextAlign.center,
                          style: AppTextStyle.heading,
                        ),
                        10.0.h,
                        const Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Name', style: AppTextStyle.body)),
                        8.0.h,
                        AppTextField(
                          hintText: 'Enter your name',
                          controller: nameController,
                          validator: Validator.validateName,
                        ),
                        5.0.h,
                        const Align(
                            alignment: Alignment.centerLeft,
                            child:
                                Text('Company Name', style: AppTextStyle.body)),
                        8.0.h,
                        AppTextField(
                          hintText: 'Enter your company name',
                          controller: companyController,
                          validator: Validator.validateCompanyName,
                        ),
                        5.0.h,
                        const Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Email Address',
                                style: AppTextStyle.body)),
                        8.0.h,
                        AppTextField(
                          hintText: 'Enter your email address',
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: Validator.validateEmail,
                        ),
                        5.0.h,
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
                        5.0.h,
                        const Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Confirm Password',
                                style: AppTextStyle.body)),
                        8.0.h,
                        AppTextField(
                          hintText: 'Confirm your password',
                          controller: confirmPasswordController,
                          obscureText: true,
                          validator: (value) =>
                              Validator.validateConfirmPassword(
                            value,
                            passwordController.text,
                          ),
                        ),
                        5.0.h,
                        Row(
                          children: [
                            SizedBox(
                              width: 25,
                              child: Checkbox(
                                value: termsAccepted,
                                onChanged: (value) {
                                  setState(() {
                                    termsAccepted = value ?? false;
                                  });
                                },
                              ),
                            ),
                            5.0.w,
                            const Expanded(
                              child: Text(
                                'By signing up you are agreeing with the FFE Terms & Conditions and Privacy Policy',
                                style: AppTextStyle.body,
                              ),
                            ),
                          ],
                        ),
                        15.0.h,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 150,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (formKey.currentState?.validate() ??
                                      false) {
                                    Navigator.pop(context);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.lightGrey,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 14),
                                ),
                                child: Text(
                                  'Cancel',
                                  style: AppTextStyle.bodySmall400Var1
                                      .copyWith(color: AppColors.white),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 150,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (formKey.currentState?.validate() ??
                                      false) {
                                    _authBloc.add(SignUpEvent(
                                        email: emailController.text,
                                        password: passwordController.text));
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.red2,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 14),
                                ),
                                child: state.registerStatus ==
                                        AuthStatus.loading
                                    ? const CircularProgressIndicator(
                                        color: AppColors.white,
                                      )
                                    : Text(
                                        'Register',
                                        style: AppTextStyle.bodySmall400Var1
                                            .copyWith(color: AppColors.white),
                                      ),
                              ),
                            ),
                          ],
                        ),
                        15.0.h,
                        Center(
                          child: Text.rich(
                            TextSpan(
                              text: "Already have an account? ",
                              style: AppTextStyle.body,
                              children: [
                                TextSpan(
                                  text: 'Sign in here.',
                                  style: AppTextStyle.body
                                      .copyWith(color: AppColors.red),
                                ),
                              ],
                            ),
                          ),
                        ),
                        15.0.h,
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
