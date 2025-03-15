import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  // Global text styles
  static TextStyle statusBarTime = GoogleFonts.lato(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
    letterSpacing: -0.5,
    height: 1,
  );

  static TextStyle headerText = GoogleFonts.lato(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
    letterSpacing: -0.5,
    height: 1,
  );

  static TextStyle mainTitle = GoogleFonts.lato(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
    height: 2,
  );

  static TextStyle subtitle = GoogleFonts.lato(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
    height: 2,
  );

  static TextStyle bottomNavItem = GoogleFonts.lato(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );

  // Task screen specific text styles
  static const TextStyle indexTitle = TextStyle(
    fontFamily: 'Lato',
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  static const TextStyle addTaskTitle = TextStyle(
    fontFamily: 'Lato',
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static const TextStyle inputText = TextStyle(
    fontFamily: 'Lato',
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  static const TextStyle descriptionLabel = TextStyle(
    fontFamily: 'Lato',
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  static const TextStyle keyboardKey = TextStyle(
    fontFamily: 'SF Pro Text',
    fontSize: 24,
    fontWeight: FontWeight.w300,
    color: AppColors.textPrimary,
  );

  static const TextStyle keyboardLabel = TextStyle(
    fontFamily: 'SF Pro Text',
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    letterSpacing: -0.32,
  );

  static const TextStyle navigationLabel = TextStyle(
    fontFamily: 'Lato',
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );
}
