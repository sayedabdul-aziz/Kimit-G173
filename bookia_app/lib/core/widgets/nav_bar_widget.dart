import 'package:bookia_app/core/constants/assets/assets_icons.dart';
import 'package:bookia_app/core/utils/colors.dart';
import 'package:bookia_app/features/cart/presentation/view/cart_view.dart';
import 'package:bookia_app/features/home/presentation/views/home_view.dart';
import 'package:bookia_app/features/wishlist/presentation/view/wishlist_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({super.key});

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  @override
  void initState() {
    super.initState();
  }

  List<Widget> views = [
    const HomeView(),
    const WishlistView(),
    const CartView(),
    const CartView(),
  ];
  int curruntIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: views[curruntIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.dark,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: curruntIndex,
        onTap: (value) {
          setState(() {
            curruntIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              AssetsIcons.home,
              colorFilter: const ColorFilter.mode(
                  AppColors.primaryColor, BlendMode.srcATop),
            ),
            icon: SvgPicture.asset(
              AssetsIcons.home,
              colorFilter:
                  const ColorFilter.mode(AppColors.grey, BlendMode.srcATop),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              AssetsIcons.wishlist,
              colorFilter: const ColorFilter.mode(
                  AppColors.primaryColor, BlendMode.srcATop),
            ),
            icon: SvgPicture.asset(
              AssetsIcons.wishlist,
              colorFilter:
                  const ColorFilter.mode(AppColors.grey, BlendMode.srcATop),
            ),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              AssetsIcons.cart,
              colorFilter: const ColorFilter.mode(
                  AppColors.primaryColor, BlendMode.srcATop),
            ),
            icon: SvgPicture.asset(
              AssetsIcons.cart,
              colorFilter:
                  const ColorFilter.mode(AppColors.grey, BlendMode.srcATop),
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              AssetsIcons.profile,
              colorFilter: const ColorFilter.mode(
                  AppColors.primaryColor, BlendMode.srcATop),
            ),
            icon: SvgPicture.asset(
              AssetsIcons.profile,
              colorFilter:
                  const ColorFilter.mode(AppColors.grey, BlendMode.srcATop),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
