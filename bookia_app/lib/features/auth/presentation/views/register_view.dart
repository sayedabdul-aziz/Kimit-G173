import 'package:bookia_app/core/constants/constants.dart';
import 'package:bookia_app/core/functions/email_validate.dart';
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
import 'package:bookia_app/features/auth/presentation/views/login_view.dart';
import 'package:bookia_app/features/auth/presentation/widgets/auth_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

// regex for email validate

class _RegisterViewState extends State<RegisterView> {
  bool obscureText1 = true;
  bool obscureText2 = true;
  var formKey = GlobalKey<FormState>();
  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
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
            if (state is RegisterSuccessState) {
              var token = state.postAuthResponse.data?.token;
              AppLocalStorage.cacheData(ktoken, token);
              navigateAndRemoveUntil(context, const NavBarWidget());
            } else if (state is RegisterErrorState) {
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
                      'Hello! Register to get started!',
                      style: getTitleStyle(
                          fontSize: 30, fontWeight: FontWeight.w900),
                    ),
                    const Gap(30),
                    TextFormField(
                      controller: usernameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your username';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Username',
                      ),
                    ),
                    const Gap(15),
                    TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        } else if (!emailValidate(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Email',
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
                      obscureText: obscureText1,
                      decoration: InputDecoration(
                          hintText: 'Password',
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  obscureText1 = !obscureText1;
                                });
                              },
                              icon: Icon(obscureText1
                                  ? Icons.visibility_off
                                  : Icons.remove_red_eye))),
                    ),
                    const Gap(15),
                    TextFormField(
                      controller: confirmPasswordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        } else if (value.length < 8) {
                          return 'Password must be at least 8 characters';
                        }
                        return null;
                      },
                      obscureText: obscureText2,
                      decoration: InputDecoration(
                          hintText: 'Confirm password',
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  obscureText2 = !obscureText2;
                                });
                              },
                              icon: Icon(obscureText2
                                  ? Icons.visibility_off
                                  : Icons.remove_red_eye))),
                    ),
                    const Gap(30),
                    CustomButton(
                        text: 'Register',
                        onPressed: () {
                          // check if the form is valid
                          if (formKey.currentState!.validate()) {
                            // check if the passwords match
                            if (passwordController.text ==
                                confirmPasswordController.text) {
                              // call the register method in the cubit
                              context.read<AuthCubit>().register(
                                  name: usernameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  passwordConfirmation:
                                      confirmPasswordController.text);
                            } else {
                              // show snackbar if the passwords do not match
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      backgroundColor: AppColors.red,
                                      content: Text('Passwords do not match')));
                            }
                          }
                        }),
                    // BlocBuilder<AuthCubit, AuthStates>(
                    //   builder: (context, state) {
                    //     if (state is RegisterLoadingState) {
                    //       return const Center(
                    //         child: CircularProgressIndicator(),
                    //       );
                    //     } else {
                    //       return CustomButton(
                    //           text: 'Register',
                    //           onPressed: () {
                    //             // check if the form is valid
                    //             if (formKey.currentState!.validate()) {
                    //               // check if the passwords match
                    //               if (passwordController.text ==
                    //                   confirmPasswordController.text) {
                    //                 // call the register method in the cubit
                    //                 context.read<AuthCubit>().register(
                    //                     name: usernameController.text,
                    //                     email: emailController.text,
                    //                     password: passwordController.text,
                    //                     passwordConfirmation:
                    //                         confirmPasswordController.text);
                    //               } else {
                    //                 // show snackbar if the passwords do not match
                    //                 ScaffoldMessenger.of(context).showSnackBar(
                    //                     const SnackBar(
                    //                         backgroundColor: AppColors.red,
                    //                         content: Text(
                    //                             'Passwords do not match')));
                    //               }
                    //             }
                    //           });
                    //     }
                    //   },
                    // ),

                    const Gap(35),
                    const AuthOptions()
                  ],
                ),
              ),
            ),
          )),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Already have an account?',
              style: getbodyStyle(fontSize: 16),
            ),
            TextButton(
                onPressed: () {
                  navigateWithReplacment(context, const LoginView());
                },
                child: Text(
                  'Login Now',
                  style: getTitleStyle(
                      fontSize: 16, color: AppColors.primaryColor),
                ))
          ],
        ),
      ),
    );
  }
}
