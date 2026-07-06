import 'package:auth_system/core/theme/app_colors.dart';
import 'package:auth_system/core/theme/app_texts.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.scaffoldLight,
    colorScheme: ColorScheme.light(
      primary: AppColors.primaryColor,
      surface: AppColors.surfaceLight,
      error: AppColors.error,
    ),

    textTheme: TextTheme(
      headlineMedium: AppTexts.bold24.copyWith(color: AppColors.black),
      bodyMedium: AppTexts.regular14.copyWith(color: AppColors.darkGrey),
      labelLarge: AppTexts.semiBold16.copyWith(color: Colors.black),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      hintStyle: const TextStyle(color: AppColors.darkGrey),
      border: _border(AppColors.borderLight),
      enabledBorder: _border(AppColors.borderLight),
      focusedBorder: _border(AppColors.primaryColor),
      errorBorder: _border(AppColors.error),
      focusedErrorBorder: _border(AppColors.error),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.scaffoldDark,
    colorScheme: ColorScheme.dark(
      primary: AppColors.primaryColor,
      surface: AppColors.surfaceDark,
      error: AppColors.error,
    ),

    textTheme: TextTheme(
      headlineMedium: AppTexts.bold24.copyWith(color: Colors.white),
      bodyMedium: AppTexts.regular14.copyWith(color: Colors.white70),
      labelLarge: AppTexts.semiBold16.copyWith(color: Colors.white),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surfaceDark,
      hintStyle: const TextStyle(color: Colors.white60),
      border: _border(AppColors.borderDark),
      enabledBorder: _border(AppColors.borderDark),
      focusedBorder: _border(AppColors.primaryColor),
      errorBorder: _border(AppColors.error),
      focusedErrorBorder: _border(AppColors.error),
    ),
  );

  static OutlineInputBorder _border(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: color),
    );
  }
}
