import 'package:flutter/material.dart';
import 'task_screen_colors.dart';

class AppTextStyles {
  static const statusBarTime = TextStyle(
    fontFamily: 'SF Pro Display',
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  static const indexTitle = TextStyle(
    fontFamily: 'Lato',
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  static const addTaskTitle = TextStyle(
    fontFamily: 'Lato',
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static const inputText = TextStyle(
    fontFamily: 'Lato',
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  static const descriptionLabel = TextStyle(
    fontFamily: 'Lato',
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  static const keyboardKey = TextStyle(
    fontFamily: 'SF Pro Text',
    fontSize: 24,
    fontWeight: FontWeight.w300,
    color: AppColors.textPrimary,
  );

  static const keyboardLabel = TextStyle(
    fontFamily: 'SF Pro Text',
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    letterSpacing: -0.32,
  );

  static const navigationLabel = TextStyle(
    fontFamily: 'Lato',
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );
}
