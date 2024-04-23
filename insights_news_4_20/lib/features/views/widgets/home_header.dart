import 'dart:io';

import 'package:flutter/material.dart';
import 'package:insights_news_4_20/core/services/local_storage.dart';
import 'package:insights_news_4_20/core/utils/colors.dart';
import 'package:insights_news_4_20/core/utils/styles.dart';

class HomeHeader extends StatefulWidget {
  const HomeHeader({
    super.key,
  });

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  String? path;
  String name = '';

  @override
  void initState() {
    super.initState();
    name = AppLocalStorage.getCachedData('name');
    path = AppLocalStorage.getCachedData('image');
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello, ${name.isEmpty ? '' : name}',
              style: getTitleStyle(color: AppColors.primary),
            ),
            Text(
              'Have A Nice Day.',
              style: getSmallStyle(),
            ),
          ],
        ),
        const Spacer(),
        CircleAvatar(
          radius: 25,
          backgroundImage: path != null
              ? FileImage(File(path!)) as ImageProvider
              : const AssetImage('assets/user.png'),
        ),
      ],
    );
  }
}
