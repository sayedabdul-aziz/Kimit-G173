import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati_3_19/core/services/local_storage.dart';
import 'package:taskati_3_19/core/utils/colors.dart';
import 'package:taskati_3_19/core/utils/text_styles.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppLocalStorage.getCachedData('name'),
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
