import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:se7ety_5_28/core/functions/routing.dart';
import 'package:se7ety_5_28/core/services/local_services.dart';
import 'package:se7ety_5_28/core/utils/colors.dart';
import 'package:se7ety_5_28/core/utils/styles.dart';
import 'package:se7ety_5_28/core/widgets/custom_button.dart';
import 'package:se7ety_5_28/features/intro/data/onboarding_model.dart';
import 'package:se7ety_5_28/features/intro/welcome_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  var pageController = PageController();
  int lastPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.white,
          actions: [
            TextButton(
              onPressed: () {
                AppLocalStorage.setData('isOnboarding', true);
                pushToWithReplacement(context, const WelcomeView());
              },
              child: Text(
                'تخطي',
                style: getTitleStyle(fontSize: 16),
              ),
            ),
            const Gap(10),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                    onPageChanged: (value) {
                      setState(() {
                        lastPage = value;
                      });
                    },
                    controller: pageController,
                    itemCount: pages.length,
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Spacer(),
                          SvgPicture.asset(
                            pages[index].image,
                            width: 250,
                          ),
                          const Spacer(),
                          Text(
                            pages[index].title,
                            style: getTitleStyle(),
                          ),
                          const Gap(25),
                          Text(
                            pages[index].description,
                            textAlign: TextAlign.center,
                            style: getbodyStyle(),
                          ),
                          const Spacer(
                            flex: 3,
                          ),
                        ],
                      );
                    }),
              ),

              // FOOTER
              SizedBox(
                height: 60,
                child: Row(
                  children: [
                    SmoothPageIndicator(
                      controller: pageController,
                      count: pages.length,
                      effect: WormEffect(
                          activeDotColor: AppColors.color1,
                          dotHeight: 10,
                          dotWidth: 19),
                    ),
                    const Spacer(),
                    if (lastPage == pages.length - 1)
                      CustomButton(
                        text: 'هيا بنا',
                        style: getbodyStyle(
                            color: AppColors.white,
                            fontWeight: FontWeight.bold),
                        radius: 10,
                        width: 100,
                        height: 40,
                        onPressed: () {
                          AppLocalStorage.setData('isOnboarding', true);
                          pushToWithReplacement(context, const WelcomeView());
                        },
                      )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
