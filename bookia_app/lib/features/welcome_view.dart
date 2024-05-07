import 'package:bookia_app/core/constants/assets/assets_images.dart';
import 'package:bookia_app/core/functions/routing.dart';
import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/utils/text_styles.dart';
import 'package:bookia_app/core/widgets/custom_btn.dart';
import 'package:bookia_app/features/auth/presentation/views/login_view.dart';
import 'package:bookia_app/features/auth/presentation/views/register_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // image
          Image.asset(
            AssetsImages.welcome,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          // logo
          Positioned(
            top: 100,
            right: 20,
            left: 20,
            child: Column(
              children: [
                Image.asset(AssetsImages.logo),
                const Gap(10),
                Text(
                  'Order Your Book Now!',
                  style: getbodyStyle(fontSize: 18),
                )
              ],
            ),
          ),

          // buttons
          Positioned(
            bottom: 100,
            right: 20,
            left: 20,
            child: Column(
              children: [
                CustomButton(
                  onPressed: () {
                    navigateTo(context, const LoginView());
                  },
                  text: 'Login',
                ),
                const Gap(15),
                CustomButton(
                  onPressed: () {
                    navigateTo(context, const RegisterView());
                  },
                  isBorder: true,
                  bgColor: AppColors.white,
                  fgColor: AppColors.dark,
                  text: 'Register',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
