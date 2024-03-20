import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati_3_19/core/constants/assets_images.dart';
import 'package:taskati_3_19/core/functions/routing.dart';
import 'package:taskati_3_19/core/utils/colors.dart';
import 'package:taskati_3_19/core/utils/text_styles.dart';
import 'package:taskati_3_19/features/home/home_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // delay with 3 sec. and navigate to upload view ..
    Future.delayed(const Duration(seconds: 3), () {
      navigateWithReplacment(context, const HomeView());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // IMAGE
          Lottie.asset(AssetsImages.logo),
          const Gap(10),
          Text(
            'Taskati',
            style: getTitleStyle(color: AppColors.primary, fontSize: 22),
          ),
          // const SizedBox(
          //   height: 10,
          // ),
          const Gap(10),
          Text(
            'It\'s Time To Get Organized',
            style: getSmallStyle(),
          ),
        ],
      )),
    );
  }
}
