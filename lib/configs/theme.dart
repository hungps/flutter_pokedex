import 'package:flutter/material.dart';
import 'package:pokedex/configs/colors.dart';

import 'fonts.dart';

class Themings {
  static final TextStyle darkText = TextStyle(
    color: AppColors.whiteGrey,
    fontFamily: AppFonts.circularStd,
  );

  static final TextStyle lightText = TextStyle(
    color: AppColors.black,
    fontFamily: AppFonts.circularStd,
  );

  static final ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.dark,
    primaryColor: AppColors.blue,
    textTheme: TextTheme(
      bodyText1: darkText,
      bodyText2: darkText,
      labelMedium: darkText,
      caption: darkText,
      button: darkText,
      overline: darkText,
    ),
    scaffoldBackgroundColor: AppColors.black,
  );

  static final ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.light,
    primaryColor: AppColors.blue,
    textTheme: TextTheme(
      bodyText1: lightText,
      bodyText2: lightText,
      labelMedium: lightText,
      caption: lightText,
      button: lightText,
      overline: lightText,
    ),
    scaffoldBackgroundColor: AppColors.lightGrey,
  );
}
