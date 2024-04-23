import 'package:flutter/material.dart';
import 'package:insights_news_4_20/core/utils/colors.dart';

getTitleStyle({double? fontsize, Color? color, FontWeight? fontWeight}) {
  return TextStyle(
    color: color ?? AppColors.white,
    fontSize: fontsize ?? 18,
    fontWeight: fontWeight ?? FontWeight.bold,
  );
}

getBodyStyle({double? fontsize, Color? color, FontWeight? fontWeight}) {
  return TextStyle(
    color: color ?? AppColors.white,
    fontSize: fontsize ?? 16,
    fontWeight: fontWeight ?? FontWeight.normal,
  );
}

getSmallStyle({double? fontsize, Color? color, FontWeight? fontWeight}) {
  return TextStyle(
    color: color ?? AppColors.grey,
    fontSize: fontsize ?? 14,
    fontWeight: fontWeight ?? FontWeight.normal,
  );
}
