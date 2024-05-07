import 'package:bookia_app/core/utils/colors.dart';
import 'package:flutter/material.dart';

TextStyle getHeadlineStyle(
        {Color? color, double? fontSize, FontWeight? fontWeight}) =>
    TextStyle(
      fontSize: fontSize ?? 18,
      color: color ?? AppColors.dark,
      fontWeight: fontWeight ?? FontWeight.bold,
    );

TextStyle getTitleStyle(
        {Color? color, double? fontSize, FontWeight? fontWeight}) =>
    TextStyle(
      fontSize: fontSize ?? 16,
      color: color ?? AppColors.dark,
      fontWeight: fontWeight ?? FontWeight.bold,
    );

TextStyle getbodyStyle({
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
}) =>
    TextStyle(
      fontSize: fontSize ?? 14,
      color: color ?? AppColors.dark,
      fontWeight: fontWeight ?? FontWeight.normal,
    );

TextStyle getsmallStyle({
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
}) =>
    TextStyle(
      fontSize: fontSize ?? 12,
      color: color ?? AppColors.grey,
      fontWeight: fontWeight ?? FontWeight.normal,
    );
