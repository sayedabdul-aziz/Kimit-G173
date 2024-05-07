import 'package:bookia_app/core/constants/assets/assets_images.dart';
import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/core/utils/text_styles.dart';
import 'package:bookia_app/core/widgets/custom_btn.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeSliderWidget extends StatefulWidget {
  const HomeSliderWidget({super.key});

  @override
  State<HomeSliderWidget> createState() => _HomeSliderWidgetState();
}

class _HomeSliderWidgetState extends State<HomeSliderWidget> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
            itemCount: 3,
            itemBuilder: (BuildContext context, int itemIndex,
                    int pageViewIndex) =>
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.primaryColor,
                  ),
                  child: Stack(children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        AssetsImages.slider,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 160,
                      ),
                    ),
                    Positioned(
                      left: 8,
                      top: 14,
                      child: SizedBox(
                        width: MediaQuery.sizeOf(context).width * .52,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  'Find out the best books to read when you don’t even know what to read!!!',
                                  style: getbodyStyle(color: AppColors.white)),
                              const Gap(3),
                              CustomButton(
                                  height: 35,
                                  width: 90,
                                  bgColor: AppColors.white,
                                  text: 'Explore',
                                  textStyle: getsmallStyle(
                                      color: AppColors.primaryColor,
                                      fontSize: 10),
                                  onPressed: () {})
                            ]),
                      ),
                    )
                  ]),
                ),
            options: CarouselOptions(
              height: 160,
              viewportFraction: 1,
              initialPage: 0,
              enableInfiniteScroll: true,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
              scrollDirection: Axis.horizontal,
            )),
        const Gap(15),
        SmoothPageIndicator(
            controller: PageController(
              initialPage: currentIndex,
            ),
            effect: const ExpandingDotsEffect(
                activeDotColor: AppColors.primaryColor,
                expansionFactor: 5,
                dotHeight: 10,
                dotWidth: 10),
            count: 3),
      ],
    );
  }
}
