import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:insights_news_4_20/core/utils/colors.dart';
import 'package:insights_news_4_20/core/utils/styles.dart';
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
            itemCount: 5,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) {
              return Stack(
                children: [
                  Image.asset(
                    'assets/rodri.png',
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    left: 10,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: AppColors.background.withOpacity(.5),
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        'Demo',
                        style: getBodyStyle(),
                      ),
                    ),
                  )
                ],
              );
            },
            options: CarouselOptions(
              height: 150,
              viewportFraction: 0.8,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
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
          controller: PageController(initialPage: currentIndex),
          count: 5,
          axisDirection: Axis.horizontal,
          effect: const ScrollingDotsEffect(
              spacing: 8.0,
              dotWidth: 10,
              dotHeight: 10,
              strokeWidth: 1.5,
              dotColor: Colors.grey,
              activeDotColor: AppColors.primary),
        ),
      ],
    );
  }
}
