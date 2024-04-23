import 'package:flutter/material.dart';
import 'package:insights_news_4_20/core/utils/colors.dart';

showErrorDialog(context, text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: AppColors.red,
      behavior: SnackBarBehavior.floating,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      content: Text(text)));
}
