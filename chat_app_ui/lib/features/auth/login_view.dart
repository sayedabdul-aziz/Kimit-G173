import 'package:chat_app_ui/core/colors.dart';
import 'package:chat_app_ui/core/text_styles.dart';
import 'package:chat_app_ui/core/widgets/custom_button.dart';
import 'package:chat_app_ui/features/auth/register_view.dart';
import 'package:chat_app_ui/features/auth/widgets/custom_text_field.dart';
import 'package:chat_app_ui/features/chat/chat_view.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isNotShow = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(
                    'https://static.vecteezy.com/system/resources/previews/014/441/080/original/chat-icon-design-in-blue-circle-png.png'),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Login to your Account',
                style: getBodyStyle(
                  color: AppColors.primary,
                  fontSize: 24,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const CustomTextField(label: 'Email', prefixIcon: Icons.email),
              const SizedBox(
                height: 10,
              ),
              CustomTextField(
                label: 'Password',
                obscureText: isNotShow,
                prefixIcon: Icons.lock,
                suffixIcon:
                    isNotShow ? Icons.visibility_off : Icons.remove_red_eye,
                suffixOnPressed: () {
                  setState(() {
                    isNotShow = !isNotShow;
                  });
                },
              ),
              const SizedBox(
                height: 25,
              ),
              CustomButton(
                text: 'Login',
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const ChatView(),
                  ));
                },
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () {},
                      child: const Text('I haven\'t an account.')),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const RegisterView(),
                        ));
                      },
                      child: Text(
                        'Create one!',
                        style: getTitleStyle(
                            color: AppColors.primary, fontSize: 14),
                      )),
                  // TextButton(onPressed: () {}, child: const Text('login'))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
