import 'package:flutter/material.dart';
import 'package:taskati_3_19/core/utils/colors.dart';
import 'package:taskati_3_19/core/utils/text_styles.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.white,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.primary,
      ),
      colorScheme: ColorScheme.fromSeed(
          primary: AppColors.primary,
          onSurface: AppColors.black,
          seedColor: AppColors.black),
      inputDecorationTheme: InputDecorationTheme(
          hintStyle: getSmallStyle(),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.primary)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.primary)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.red)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.red))));
  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.darkScaffoldBg,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.primary,
      ),
      colorScheme: ColorScheme.fromSeed(
          primary: AppColors.primary,
          onSurface: AppColors.white,
          seedColor: AppColors.white),
      inputDecorationTheme: InputDecorationTheme(
          hintStyle: getSmallStyle(),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.primary)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.primary)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.red)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.red))));
}
