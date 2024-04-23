import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insights_news_4_20/core/utils/colors.dart';
import 'package:insights_news_4_20/features/views/home_view.dart';
import 'package:insights_news_4_20/features/views/profile_view.dart';
import 'package:insights_news_4_20/features/views/search_view.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({super.key});

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  int currentIndex = 0;
  List<Widget> views = [
    const HomeView(),
    const SearchView(),
    const ProfileView()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: views[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                'assets/Group.svg',
                colorFilter:
                    const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
              ),
              icon: SvgPicture.asset('assets/Group.svg'),
              label: 'Home'),
          BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                'assets/search.svg',
                colorFilter:
                    const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
              ),
              icon: SvgPicture.asset('assets/search.svg'),
              label: 'Search'),
          BottomNavigationBarItem(
              activeIcon: SvgPicture.asset(
                'assets/Profile.svg',
                colorFilter:
                    const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
              ),
              icon: SvgPicture.asset('assets/Profile.svg'),
              label: 'Profile'),
        ],
      ),
    );
  }
}
