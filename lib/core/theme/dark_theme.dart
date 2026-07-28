import 'package:flutter/material.dart';

import '../constants/color_manager.dart';
import '../constants/font_manager.dart';
import '../constants/style_manager.dart';
import '../constants/values_manager.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,

  scaffoldBackgroundColor: AppColors.primaryDark4,
  primaryColor: AppColors.primary,
  primaryColorDark: AppColors.primaryDark1,
  primaryColorLight: AppColors.primaryLight1,

  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.primary,
    onPrimary: AppColors.white,

    secondary: AppColors.secondary,
    onSecondary: AppColors.black,

    error: AppColors.error,
    onError: AppColors.white,

    surface: AppColors.neutral900,
    onSurface: AppColors.white,

    tertiary: AppColors.white,
    onTertiary: AppColors.neutral900,
  ),

  textTheme: TextTheme(
    displayLarge: getBoldStyle(
      fontFamily: FontConstants.balooThambi2,
      color: AppColors.white,
      fontSize: FontSize.s40,
    ),
    displayMedium: getSemiBoldStyle(
      fontFamily: FontConstants.balooThambi2,
      color: AppColors.white,
      fontSize: FontSize.s35,
    ),
    displaySmall: getMediumStyle(
      fontFamily: FontConstants.balooThambi2,
      color: AppColors.white,
      fontSize: FontSize.s30,
    ),
    headlineLarge: getSemiBoldStyle(
      fontFamily: FontConstants.balooThambi2,
      color: AppColors.white,
      fontSize: FontSize.s24,
    ),
    headlineMedium: getMediumStyle(
      fontFamily: FontConstants.balooThambi2,
      color: AppColors.white,
      fontSize: FontSize.s22,
    ),
    headlineSmall: getRegularStyle(
      fontFamily: FontConstants.balooThambi2,
      color: AppColors.white,
      fontSize: FontSize.s18,
    ),
    titleLarge: getSemiBoldStyle(
      fontFamily: FontConstants.balooThambi2,
      color: AppColors.white,
      fontSize: FontSize.s22,
    ),
    titleMedium: getMediumStyle(
      fontFamily: FontConstants.balooThambi2,
      color: AppColors.white,
      fontSize: FontSize.s16,
    ),
    titleSmall: getRegularStyle(
      fontFamily: FontConstants.balooThambi2,
      color: AppColors.white,
      fontSize: FontSize.s14,
    ),
    bodyLarge: getRegularStyle(
      fontFamily: FontConstants.balooThambi2,
      color: AppColors.neutral200,
      fontSize: FontSize.s16,
    ),
    bodyMedium: getRegularStyle(
      fontFamily: FontConstants.balooThambi2,
      color: AppColors.neutral200,
      fontSize: FontSize.s14,
    ),
    bodySmall: getRegularStyle(
      fontFamily: FontConstants.balooThambi2,
      color: AppColors.neutral200,
    ),
    labelLarge: getMediumStyle(
      fontFamily: FontConstants.balooThambi2,
      color: AppColors.neutral500,
      fontSize: FontSize.s14,
    ),
    labelMedium: getMediumStyle(
      fontFamily: FontConstants.balooThambi2,
      color: AppColors.neutral500,
    ),
    labelSmall: getRegularStyle(
      fontFamily: FontConstants.balooThambi2,
      color: AppColors.neutral500,
      fontSize: FontSize.s10,
    ),
  ),

  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.backgroundDark,
    foregroundColor: AppColors.white,
    surfaceTintColor: Colors.transparent,
    elevation: 0,
    leadingWidth: AppSize.s25,
    actionsPadding: const EdgeInsets.only(right: AppPadding.p20),
    titleSpacing: AppSize.s16,
    titleTextStyle: getRegularStyle(
      fontFamily: FontConstants.balooThambi2,
      color: AppColors.white,
      fontSize: FontSize.s25,
    ),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primaryDark1,
      foregroundColor: AppColors.white,
      disabledBackgroundColor: AppColors.neutral800,
      disabledForegroundColor: AppColors.neutral500,
      padding: const EdgeInsets.all(AppPadding.p16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(RadiusSize.r16),
      ),
      textStyle: getMediumStyle(
        fontFamily: FontConstants.balooThambi2,
        color: AppColors.white,
        fontSize: FontSize.s18,
      ),
    ),
  ),

  inputDecorationTheme: InputDecorationTheme(
    // filled: true,
    // fillColor: AppColors.white,
    hintStyle: const TextStyle(
      color: AppColors.neutral300,
      fontSize: FontSize.s16,
      fontFamily: FontConstants.balooThambi2,
    ),
    labelStyle: const TextStyle(
      color: AppColors.neutral300,
      fontSize: FontSize.s18,
      fontWeight: FontWeight.w500,
      fontFamily: FontConstants.balooThambi2,
    ),
    floatingLabelStyle: getRegularStyle(
      fontFamily: FontConstants.balooThambi2,
      color: AppColors.white,
      fontSize: FontSize.s18,
    ),
    floatingLabelBehavior: FloatingLabelBehavior.always,
    errorStyle: getRegularStyle(
      fontFamily: FontConstants.balooThambi2,
      color: AppColors.error,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(RadiusSize.r16),
      borderSide: const BorderSide(color: AppColors.neutral300),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(RadiusSize.r16),
      borderSide: const BorderSide(color: AppColors.neutral300),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(RadiusSize.r16),
      borderSide: const BorderSide(
        color: AppColors.secondary,
        width: AppSize.s2,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(RadiusSize.r16),
      borderSide: const BorderSide(color: AppColors.error),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(RadiusSize.r16),
      borderSide: const BorderSide(color: AppColors.error, width: AppSize.s2),
    ),
    contentPadding: const EdgeInsets.all(AppPadding.p16),
  ),

  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: AppColors.white,
    linearTrackColor: AppColors.neutral800,
    borderRadius: BorderRadius.circular(RadiusSize.r8),
  ),

  dialogTheme: DialogThemeData(
    backgroundColor: AppColors.neutral900,
    surfaceTintColor: Colors.transparent,
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    titleTextStyle: getSemiBoldStyle(
      fontFamily: FontConstants.balooThambi2,
      color: AppColors.white,
      fontSize: FontSize.s18,
    ),
    contentTextStyle: getRegularStyle(
      fontFamily: FontConstants.balooThambi2,
      color: AppColors.neutral200,
      fontSize: FontSize.s16,
    ),
  ),

  cardTheme: CardThemeData(
    color: AppColors.neutral900,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
      side: const BorderSide(color: AppColors.neutral800),
    ),
  ),

  dividerTheme: const DividerThemeData(color: AppColors.neutral800),

  iconTheme: const IconThemeData(color: AppColors.white),

  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.primary,
    foregroundColor: AppColors.white,
  ),

  checkboxTheme: CheckboxThemeData(
    fillColor: WidgetStateProperty.resolveWith(
      (states) => states.contains(WidgetState.selected)
          ? AppColors.primary
          : AppColors.neutral900,
    ),
    checkColor: WidgetStateProperty.all(AppColors.white),
    side: const BorderSide(color: AppColors.neutral500),
  ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: AppColors.primaryLight5,
    selectedLabelStyle: getMediumStyle(
      fontFamily: FontConstants.balooThambi2,
      color: AppColors.primary,
      fontSize: FontSize.s16,
    ),
    selectedItemColor: AppColors.primary,
    unselectedItemColor: AppColors.black,
    selectedIconTheme: const IconThemeData(color: AppColors.primary),
    unselectedIconTheme: const IconThemeData(color: AppColors.black),
    showUnselectedLabels: false,
    unselectedLabelStyle: getMediumStyle(
      fontFamily: FontConstants.balooThambi2,
      color: AppColors.black,
      fontSize: FontSize.s14,
    ),
  ),

  searchBarTheme: SearchBarThemeData(
    elevation: const WidgetStatePropertyAll(AppSize.s0),
    backgroundColor: const WidgetStatePropertyAll(AppColors.transparent),
    side: const WidgetStatePropertyAll(BorderSide(color: AppColors.white)),
    shape: WidgetStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppPadding.p16),
      ),
    ),
    textStyle: WidgetStatePropertyAll(
      getSemiBoldStyle(
        fontFamily: FontConstants.balooThambi2,
        color: AppColors.white,
      ),
    ),
  ),
);
