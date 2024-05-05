import 'package:bookia_app/core/functions/routing.dart';
import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/utils/text_styles.dart';
import 'package:bookia_app/core/widgets/custom_back_btn.dart';
import 'package:bookia_app/core/widgets/custom_btn.dart';
import 'package:bookia_app/core/widgets/custom_dialogs.dart';
import 'package:bookia_app/features/auth/presentation/views/register_view.dart';
import 'package:bookia_app/features/auth/presentation/widgets/auth_options.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                'Welcome back! Glad to see you, Again!',
                style: getTitleStyle(fontSize: 30, fontWeight: FontWeight.w900),
              ),
              const Gap(30),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter your email address',
                ),
              ),
              const Gap(15),
              TextFormField(
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
                    showLoadingDialog(context);
                  }),
              const Gap(35),
              const AuthOptions()
            ],
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
