import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:insights_news_4_20/core/functions/routing.dart';
import 'package:insights_news_4_20/core/services/local_storage.dart';
import 'package:insights_news_4_20/core/utils/colors.dart';
import 'package:insights_news_4_20/core/utils/styles.dart';
import 'package:insights_news_4_20/core/widgets/nav_bar_view.dart';
import 'package:insights_news_4_20/features/views/upload_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    bool isUplaod = AppLocalStorage.getCachedData('isUpload') ?? false;
    // delay with 3 sec. and navigate to upload view ..
    Future.delayed(const Duration(seconds: 3), () {
      navigateWithReplacment(
          context, isUplaod ? const NavBarWidget() : const UploadView());
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
          Image.asset('assets/logo.png', width: 250),
          const Gap(10),
          Text(
            'Insights News',
            style: getTitleStyle(color: AppColors.white, fontsize: 22),
          ),

          const Gap(10),
          Text(
            'Stay Informed, Anytime, Anywhere.',
            style: getSmallStyle(),
          ),
        ],
      )),
    );
  }
}
