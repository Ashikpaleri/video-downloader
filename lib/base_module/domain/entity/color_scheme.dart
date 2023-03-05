import 'package:flutter/material.dart';
// https://api.flutter.dev/flutter/material/ThemeData-class.html

mixin AppColorScheme {
  //LIGHT
  static Color primaryColorLight = const  Color(0xffE5E5E5);
  static Color primaryVariantColorLight = const Color(0xFF514642);
  static Color secondaryColorLight = const Color(0xFF53B175);
  static Color secondaryVariantColorLight = const Color(0xFF000000);
  static Color accentColorLight = const Color(0xFFB50020);//TODO change accent color light
  static Color errorColorLight = const Color(0xFFFF6A85);

  static Color scaffoldBackgroundColorLight = const Color(0xffE5E5E5);
  static Color backgroundColorLight = const Color(0xFFF5F5F5);
  static Color surfaceColorLight = const Color(0xFFFFFFFF);

  static Color onBackgroundLight = const Color(0xFF57EE9D);
  static Color onErrorLight = const Color(0xFFFFFFFF);
  static Color onPrimaryLight = const Color(0xFFFFFFFF);
  static Color onSecondaryLight = const Color(0xFFFFFFFF);
  static Color onSurfaceLight = const Color(0xFF3A3A3A);

  //DARK
  static Color primaryColorDark = const Color(0xFFB50020);
  static Color primaryVariantColorDark = const Color(0xFFF7EBEE);
  static Color secondaryColorDark = const Color(0xFF3A3A3A);
  static Color secondaryVariantColorDark = const Color(0xFF000000);
  static Color accentColorDark = const Color(0xFFB50020);

  static Color errorColorDark = const Color(0xFFFF7474);
  static Color scaffoldBackgroundColorDark = const Color(0xFF03073D);
  static Color backgroundColorDark = const Color(0xFF03073D);
  static Color surfaceColorDark = const Color(0xFF0C1A53);

  static Color onBackgroundDark = const Color(0xFFFFFFFF);
  static Color onErrorDark = const Color(0xFFFFFFFF);
  static Color onPrimaryDark = const Color(0xFFFFFFFF);
  static Color onSecondaryDark = const Color(0xFFFFFFFF);
  static Color onSurfaceDark = const Color(0xFFFFFFFF);
}
