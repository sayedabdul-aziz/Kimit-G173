import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:insights_news_4_20/core/utils/colors.dart';
import 'package:insights_news_4_20/core/utils/styles.dart';
import 'package:insights_news_4_20/features/views/widgets/home_header.dart';
import 'package:insights_news_4_20/features/views/widgets/home_slider_widget.dart';
import 'package:insights_news_4_20/features/views/widgets/news_list_builder.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

// DefaultTabController with length
// TabBar (tabs)
// TabBarView (pages)

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;
  List<String> categories = ['Science', 'Entertainment', 'Sports', 'Business'];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 40, 20, 15),
          child: Column(
            children: [
              const HomeHeader(),
              const Gap(30),
              const HomeSliderWidget(),
              const Gap(20),
              // tabBar
              TabBar(
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  indicatorColor: AppColors.primary,
                  // indicatorSize: TabBarIndicatorSize.tab,
                  // indicator: const BoxDecoration(
                  //     shape: BoxShape.circle, color: AppColors.primary),
                  indicator: const BoxDecoration(),
                  // indicatorPadding: const EdgeInsets.only(top: 40),
                  labelPadding: const EdgeInsets.symmetric(horizontal: 6),
                  dividerColor: Colors.transparent,
                  unselectedLabelColor: AppColors.white,
                  labelColor: AppColors.primary,
                  onTap: (value) {
                    setState(() {
                      currentIndex = value;
                    });
                  },
                  tabs: List.generate(
                    categories.length,
                    (index) => Tab(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: currentIndex == index
                                ? AppColors.primary
                                : AppColors.secondary),
                        child: Text(
                          categories[index],
                          style: getSmallStyle(
                              color: currentIndex == index
                                  ? AppColors.background
                                  : AppColors.white),
                        ),
                      ),
                    ),
                  ).toList()),
              const Gap(10),
              // tabBarView
              const Expanded(
                child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      NewsListBuilder(
                        category: 'science',
                      ),
                      NewsListBuilder(
                        category: 'entertainment',
                      ),
                      NewsListBuilder(
                        category: 'sports',
                      ),
                      NewsListBuilder(
                        category: 'business',
                      ),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
