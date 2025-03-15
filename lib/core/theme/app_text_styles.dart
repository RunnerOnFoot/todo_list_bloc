import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static TextStyle statusBarTime = GoogleFonts.lato(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: Colors.white,
    letterSpacing: -0.5,
    height: 1,
  );

  static TextStyle headerText = GoogleFonts.lato(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: Colors.white,
    letterSpacing: -0.5,
    height: 1,
  );

  static TextStyle mainTitle = GoogleFonts.lato(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: Colors.white,
    height: 2,
  );

  static TextStyle subtitle = GoogleFonts.lato(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.white,
    height: 2,
  );

  static TextStyle bottomNavItem = GoogleFonts.lato(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );
}
