import 'package:chat_app_ui/core/colors.dart';
import 'package:chat_app_ui/core/text_styles.dart';
import 'package:chat_app_ui/core/widgets/custom_button.dart';
import 'package:chat_app_ui/features/auth/login_view.dart';
import 'package:chat_app_ui/features/auth/widgets/custom_text_field.dart';
import 'package:chat_app_ui/features/chat/chat_view.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
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
                  'Create A New Account',
                  style: getBodyStyle(
                    color: AppColors.primary,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const CustomTextField(label: 'Name', prefixIcon: Icons.person),
                const SizedBox(
                  height: 10,
                ),
                const CustomTextField(label: 'Email', prefixIcon: Icons.email),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  label: 'Password',
                  prefixIcon: Icons.lock,
                  suffixIcon: Icons.visibility_off,
                  suffixOnPressed: () {},
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomButton(
                  text: 'Register',
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
                        child: const Text('Already have an account.')),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) => const LoginView(),
                          ));
                        },
                        child: Text(
                          'login',
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
      ),
    );
  }
}
