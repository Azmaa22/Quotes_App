import 'package:clean_architecture_app/src/core/utils/app_colors/app_colors.dart';
import 'package:clean_architecture_app/src/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
    fontFamily: AppStrings.fontFamily,
    primaryColor: AppColors.kPrimaryColor,
    iconTheme: IconThemeData(
      color: AppColors.kPrimaryColor,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.kPrimaryColor,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: AppColors.kBodyColor,
        fontSize: 25.0,
        fontWeight: FontWeight.w900,
        fontFamily: AppStrings.fontFamily,
      ),
    ),
    scaffoldBackgroundColor: AppColors.kBodyColor,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.kPrimaryColor,
    ),
  );
}
