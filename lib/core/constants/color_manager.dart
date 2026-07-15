import 'package:flutter/material.dart';

abstract class AppColors {
  // Brand Colors - Deep Turquoise (Primary)
  static const Color primary = Color(0xFF00838F);
  static const Color primaryLight1 = Color(0xFF0097A7);
  static const Color primaryLight2 = Color(0xFF00ACC1);
  static const Color primaryLight3 = Color(0xFF26C6DA);
  static const Color primaryLight4 = Color(0xFF4DD0E1);
  static const Color primaryLight5 = Color(0xFF80DEEA);
  static const Color primaryLight6 = Color(0xFFB2EBF2);
  static const Color primaryLight7 = Color(0xFFE0F7FA);
  static const Color primaryLight8 = Color(0xFFE8FDFE);
  static const Color primaryLight9 = Color(0xFFF2FEFF);

  // Primary Dark Shades - Deep Turquoise
  static const Color primaryDark1 = Color(0xFF007681);
  static const Color primaryDark2 = Color(0xFF006973);
  static const Color primaryDark3 = Color(0xFF005C65);
  static const Color primaryDark4 = Color(0xFF004F56);
  static const Color primaryDark5 = Color(0xFF004248);
  static const Color primaryDark6 = Color(0xFF003439);
  static const Color primaryDark7 = Color(0xFF00272B);
  static const Color primaryDark8 = Color(0xFF001A1C);
  static const Color primaryDark9 = Color(0xFF000D0E);

  // Secondary Color - Golden Yellow
  static const Color secondary = Color(0xFFFFC107);
  static const Color secondaryLight = Color(0xFFFFD54F);
  static const Color secondaryDark = Color(0xFFFFA000);

  // Neutral Colors - From Off-White to Dark Navy Blue
  static const Color white = Color(0xFFFAFAFA); // Off-white
  static const Color neutral50 = Color(0xFFF3F4F6); // Light gray
  static const Color neutral100 = Color(0xFFE5E7EB);
  static const Color neutral200 = Color(0xFFD1D5DB);
  static const Color neutral300 = Color(0xFF9CA3AF);
  static const Color neutral400 = Color(0xFF6B7280);
  static const Color neutral500 = Color(0xFF4B5563);
  static const Color neutral600 = Color(0xFF374151);
  static const Color neutral700 = Color(0xFF1E293B); // Navy slate
  static const Color neutral800 = Color(0xFF0F172A); // Dark navy blue
  static const Color neutral900 = Color(0xFF020617); // Deepest navy
  static const Color black = Color(0xFF000000);
  static const Color backgroundDark = Color(0xFF0F172A); // Dark navy background

  // Semantic Colors
  static const Color success = Color(0xFF10B981); // Teal-tinted green
  static const Color error = Color(0xFFEF4444);

  // App-specific Aliases
  static const Color hintColor = neutral400;
  static const Color placeholder = neutral400;
  static const Color grey = neutral600;
  static const Color lightGrey = neutral400;
  static const Color unSelectedIconColor = neutral400;
  static const Color cardBorder = neutral100;

  static const Color green = Color(0xFF10B981);
  static const Color lightGreen = Color(0xFF34D399);
  static const Color lightPink = Color(0xFFFCE7F3);

  static const Color transparent = Colors.transparent;
}
