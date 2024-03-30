import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati_3_19/core/services/local_storage.dart';
import 'package:taskati_3_19/core/utils/colors.dart';
import 'package:taskati_3_19/core/utils/text_styles.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, ${AppLocalStorage.getCachedData('name')}',
              style: getBodyStyle(
                  color: AppColors.primary, fontWeight: FontWeight.bold),
            ),
            const Gap(5),
            Text(
              'Have a Nice Day',
              style: getSmallStyle(),
            ),
          ],
        ),
        const Spacer(),
        ClipRRect(
            borderRadius: BorderRadius.circular(360),
            child: Image.file(
              File(AppLocalStorage.getCachedData('image')),
              width: 50,
              height: 50,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                // showErrorDialog(context, 'Error');
                return Image.asset(
                  'assets/user.png',
                  width: 50,
                );
              },
            ))
      ],
    );
  }
}
