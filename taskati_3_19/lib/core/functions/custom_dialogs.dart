import 'package:flutter/material.dart';
import 'package:taskati_3_19/core/utils/colors.dart';

showErrorDialog(context, text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: AppColors.red,
      behavior: SnackBarBehavior.floating,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      content: Text(text)));
}
