import 'package:flutter/material.dart';
import 'package:untitled/utils/ui/Fonts.dart';

ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.white)
      .copyWith(background: Colors.white),
  fontFamily: FontsHelper.SFPro,
  textTheme: TextTheme(
    bodyLarge: TextStyle(
      color: Colors.black,
      fontFamily: FontsHelper.SFPro,
    ),
    bodyMedium: TextStyle(
      color: Colors.black,
      fontFamily: FontsHelper.SFPro,
    ),
    bodySmall: TextStyle(
      color: Colors.black,
      fontFamily: FontsHelper.SFPro,
    ),
  ),
);
ThemeData DarkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.black)
      .copyWith(background: Colors.black),
  fontFamily: FontsHelper.SFPro,
  textTheme: TextTheme(
    bodyLarge: TextStyle(
      color: Colors.white,
      fontFamily: FontsHelper.SFPro,
    ),
    bodyMedium: TextStyle(
      color: Colors.white,
      fontFamily: FontsHelper.SFPro,
    ),
    bodySmall: TextStyle(
      color: Colors.white,
      fontFamily: FontsHelper.SFPro,
    ),
  ),
);
