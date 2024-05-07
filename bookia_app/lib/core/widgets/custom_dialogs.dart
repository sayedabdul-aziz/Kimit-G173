import 'package:bookia_app/core/constants/assets/assets_images.dart';
import 'package:bookia_app/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

showLoadingDialog(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: AppColors.dark.withOpacity(.6),
      builder: (context) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              AssetsImages.loading,
              width: 200,
            ),
          ],
        );
      });
}
