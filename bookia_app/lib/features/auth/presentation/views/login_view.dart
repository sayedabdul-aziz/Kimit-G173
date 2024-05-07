import 'dart:developer';

import 'package:bookia_app/core/constants/constants.dart';
import 'package:bookia_app/core/functions/routing.dart';
import 'package:bookia_app/core/services/local_services.dart';
import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/utils/text_styles.dart';
import 'package:bookia_app/core/widgets/custom_back_btn.dart';
import 'package:bookia_app/core/widgets/custom_btn.dart';
import 'package:bookia_app/core/widgets/custom_dialogs.dart';
import 'package:bookia_app/core/widgets/nav_bar_widget.dart';
import 'package:bookia_app/features/auth/presentation/manager/auth_cubit.dart';
import 'package:bookia_app/features/auth/presentation/manager/auth_states.dart';
import 'package:bookia_app/features/auth/presentation/views/register_view.dart';
import 'package:bookia_app/features/auth/presentation/widgets/auth_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        // icon on the top left (popback button)
        automaticallyImplyLeading: false,
        title: const CustomBackButton(),
      ),
      body: BlocListener<AuthCubit, AuthStates>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            //* cache token in local storage and navigate
            var token = state.postAuthResponse.data?.token;
            log(token.toString());
            AppLocalStorage.cacheData(ktoken, token);
            navigateAndRemoveUntil(context, const NavBarWidget());
          } else if (state is LoginErrorState) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                backgroundColor: AppColors.red,
                content: Text('Error, Try again.')));
          } else {
            showLoadingDialog(context);
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Text(
                    'Welcome back! Glad to see you, Again!',
                    style: getTitleStyle(
                        fontSize: 30, fontWeight: FontWeight.w900),
                  ),
                  const Gap(30),
                  TextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your email address';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Enter your email address',
                    ),
                  ),
                  const Gap(15),
                  TextFormField(
                    controller: passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length < 8) {
                        return 'Password must be at least 8 characters';
                      }
                      return null;
                    },
                    obscureText: obscureText,
                    decoration: InputDecoration(
                        hintText: 'Enter your password',
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                obscureText = !obscureText;
                              });
                            },
                            icon: Icon(obscureText
                                ? Icons.visibility_off
                                : Icons.remove_red_eye))),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot Password?',
                            style: getbodyStyle(fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                  const Gap(30),
                  CustomButton(
                      text: 'Login',
                      onPressed: () {
                        // validate and call login from auth cubit ..
                        if (formKey.currentState!.validate()) {
                          context.read<AuthCubit>().login(
                              email: emailController.text,
                              password: passwordController.text);
                        }
                      }),
                  const Gap(35),
                  const AuthOptions()
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Don\'t have an account?',
              style: getbodyStyle(fontSize: 16),
            ),
            TextButton(
                onPressed: () {
                  navigateWithReplacment(
                    context,
                    const RegisterView(),
                  );
                },
                child: Text(
                  'Register Now',
                  style: getTitleStyle(
                      fontSize: 16, color: AppColors.primaryColor),
                ))
          ],
        ),
      ),
    );
  }
}
