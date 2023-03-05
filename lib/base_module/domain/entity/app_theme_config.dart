import 'package:flutter/material.dart';

import '../../presentation/fature/theming/bloc/theme_bloc.dart';

import 'color_scheme.dart';




mixin AppThemes {
  static final appThemeData = {
    ThemeState.light: ThemeData(
      // font
      fontFamily: 'Poppins',
      //colors
      primaryColor: AppColorScheme.primaryColorLight,
      scaffoldBackgroundColor: AppColorScheme.scaffoldBackgroundColorLight,
      shadowColor: AppColorScheme.primaryColorLight.withOpacity(0.2),
      canvasColor: AppColorScheme.backgroundColorLight,
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: AppColorScheme.primaryColorLight,
        primaryVariant: AppColorScheme.primaryVariantColorLight,
        secondary: AppColorScheme.secondaryColorLight,
        secondaryVariant: AppColorScheme.secondaryVariantColorLight,
        error: AppColorScheme.errorColorLight,
        background: AppColorScheme.backgroundColorLight,
        surface: AppColorScheme.surfaceColorLight,
        onBackground: AppColorScheme.onBackgroundLight,
        onError: AppColorScheme.onErrorLight,
        onPrimary: AppColorScheme.onPrimaryLight,
        onSecondary: AppColorScheme.onSecondaryLight,
        onSurface: AppColorScheme.onSurfaceLight,
      ),
      backgroundColor: AppColorScheme
          .backgroundColorLight, // A color that contrasts with the primaryColor, e.g. used as the remaining part of a progress bar.

      //buttons
      // elevatedButtonTheme: AppButtonThemeData.elevatedButtonThemeData(),
      // outlinedButtonTheme: AppButtonThemeData.outlinedButtonThemeData(),
      // textButtonTheme: AppButtonThemeData.textButtonThemeData(),

      //chip
      // chipTheme: AppChipThemeData.chipThemeData(),
      //
      // //textfield
      // inputDecorationTheme: AppInputDecorationTheme.inputDecorationThemeLight(),

      //card
      // cardTheme: AppCardTheme.cardThemeLight(),
      //
      // //dialog
      // dialogTheme: AppDialogTheme.dialogThemeLight(),

      //appbar and bottom navbar theme
      // appBarTheme: VendorAppBarTheme.appbarThemeLight(),
      // bottomNavigationBarTheme: BottomNavBarTheme.bottomNavBarThemeDark(),
    ),
    ThemeState.dark: ThemeData(
      // font
      fontFamily: 'Poppins',
      primaryColor: AppColorScheme.primaryColorDark,
      scaffoldBackgroundColor: AppColorScheme.scaffoldBackgroundColorDark,
      shadowColor: Colors.black.withOpacity(0.5),
      canvasColor: AppColorScheme.backgroundColorDark,
      colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: AppColorScheme.primaryColorDark,
        primaryVariant: AppColorScheme.primaryVariantColorDark,
        secondary: AppColorScheme.secondaryColorDark,
        secondaryVariant: AppColorScheme.secondaryVariantColorDark,
        error: AppColorScheme.errorColorDark,
        background: AppColorScheme.backgroundColorDark,
        surface: AppColorScheme.surfaceColorDark,
        onBackground: AppColorScheme.onBackgroundDark,
        onError: AppColorScheme.onErrorDark,
        onPrimary: AppColorScheme.onPrimaryDark,
        onSecondary: AppColorScheme.onSecondaryDark,
        onSurface: AppColorScheme.onSurfaceDark,
      ),
      backgroundColor: AppColorScheme
          .backgroundColorDark, // A color that contrasts with the primaryColor, e.g. used as the remaining part of a progress bar.

      //buttons
      // elevatedButtonTheme: AppButtonThemeData.elevatedButtonThemeData(),
      // outlinedButtonTheme: AppButtonThemeData.outlinedButtonThemeData(),
      // textButtonTheme: AppButtonThemeData.textButtonThemeData(),
      //chip
      // chipTheme: AppChipThemeData.chipThemeData(),
      // //textfield
      // inputDecorationTheme: AppInputDecorationTheme.inputDecorationThemeDark(),
      //
      // //card
      // cardTheme: AppCardTheme.cardThemeDark(),
      //
      // //dialog
      // dialogTheme: AppDialogTheme.dialogThemeDark(),
      //
      // //appbar and bottom navbar theme
      // appBarTheme: VendorAppBarTheme.appbarThemeDark(),
      // bottomNavigationBarTheme: BottomNavBarTheme.bottomNavBarThemeDark(),
    )
  };
}
