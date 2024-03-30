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
      datePickerTheme: DatePickerThemeData(
          backgroundColor: AppColors.white,
          headerBackgroundColor: AppColors.primary,
          headerForegroundColor: AppColors.white),
      timePickerTheme: TimePickerThemeData(
          dialBackgroundColor: AppColors.white,
          hourMinuteColor: AppColors.primary,
          dayPeriodColor: AppColors.primary,
          hourMinuteTextColor: AppColors.white,
          dayPeriodTextColor: AppColors.black,
          backgroundColor: AppColors.white),
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
      datePickerTheme: DatePickerThemeData(
          backgroundColor: AppColors.darkScaffoldBg,
          headerBackgroundColor: AppColors.primary,
          headerForegroundColor: AppColors.white),
      colorScheme: ColorScheme.fromSeed(
          primary: AppColors.primary,
          // text color
          onSurface: AppColors.white,
          seedColor: AppColors.white),
      timePickerTheme: TimePickerThemeData(
          dialBackgroundColor: AppColors.darkScaffoldBg,
          hourMinuteColor: AppColors.primary,
          hourMinuteTextColor: AppColors.white,
          dayPeriodTextColor: AppColors.white,
          dayPeriodColor: AppColors.primary,
          backgroundColor: AppColors.darkScaffoldBg),
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
