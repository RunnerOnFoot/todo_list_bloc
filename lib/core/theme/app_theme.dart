import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

ThemeData appThemeData() {
  return ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryPurple,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.bottomNavBackground,
      selectedItemColor: AppColors.white,
      unselectedItemColor: Colors.grey,
    ),

    textTheme: TextTheme(
      titleLarge: AppTextStyles.headerText,
      bodyMedium: AppTextStyles.subtitle,
      bodySmall: AppTextStyles.mainTitle,
    ),
    // Global InputDecoration theme for text fields
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey[900],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.borderColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.borderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: AppColors.primaryPurple, width: 2),
      ),
      hintStyle: const TextStyle(color: Colors.white54),
    ),
  );
}
