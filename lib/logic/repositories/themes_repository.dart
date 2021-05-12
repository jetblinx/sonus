import 'package:flutter/material.dart';
import 'package:sonus/utils/constants.dart';

class ThemesRepisotory {

  static final light = ThemeData(
      scaffoldBackgroundColor: lightScaffoldBackgroundColor,
      primaryColor: primaryColor,
      accentColor: lightAccentColor,
      buttonColor: lightAccentColor,
      backgroundColor: lightScaffoldBackgroundColor,
      textTheme: TextTheme(
        bodyText1: TextStyle(
          color: lightAccentColor,
          fontSize: 18.0
        ),
        bodyText2: TextStyle(color: lightAccentColor, fontSize: 16.0),
        button: TextStyle(color: lightAccentColor, fontSize: 16.0),
        subtitle1: TextStyle(color: lightAccentColor, fontSize: 16.0),
        subtitle2: TextStyle(color: lightAccentColor, fontSize: 16.0),
        caption: TextStyle(
          color: lightAccentColor,
          fontWeight: FontWeight.w600,
          fontSize: 24.0
        ),
        headline1: TextStyle(
          color: lightAccentColor,
          fontWeight: FontWeight.w800,
          fontSize: 24.0
        ),
        headline2: TextStyle(color: lightAccentColor, fontSize: 16.0),
        headline3: TextStyle(color: lightAccentColor, fontSize: 16.0),
        headline4: TextStyle(color: lightAccentColor, fontSize: 16.0),
        headline5: TextStyle(color: lightAccentColor, fontSize: 16.0),
        headline6: TextStyle(color: lightAccentColor, fontSize: 16.0),
        overline: TextStyle(color: lightAccentColor, fontSize: 16.0),
      ),
  );

  static final dark = ThemeData(
    scaffoldBackgroundColor: darkScaffoldBackgroundColor,
    primaryColor: primaryColor,
    accentColor: darkAccentColor,
    buttonColor: darkAccentColor,
    backgroundColor: darkScaffoldBackgroundColor,
    textTheme: TextTheme(
      bodyText1: TextStyle(color: darkAccentColor, fontSize: 18.0),
      bodyText2: TextStyle(color: darkAccentColor, fontSize: 16.0),
      button: TextStyle(color: darkAccentColor, fontSize: 16.0),
      subtitle1: TextStyle(color: darkAccentColor, fontSize: 16.0),
      subtitle2: TextStyle(color: darkAccentColor, fontSize: 16.0),
      caption: TextStyle(
        color: darkTextColor,
        fontWeight: FontWeight.w600,
        fontSize: 24.0
      ),
      headline1: TextStyle(
        color: darkAccentColor,
        fontWeight: FontWeight.w800,
        fontSize: 24.0
      ),
      headline2: TextStyle(color: darkAccentColor, fontSize: 16.0),
      headline3: TextStyle(color: darkAccentColor, fontSize: 16.0),
      headline4: TextStyle(color: darkAccentColor, fontSize: 16.0),
      headline5: TextStyle(color: darkAccentColor, fontSize: 16.0),
      headline6: TextStyle(color: darkAccentColor, fontSize: 16.0),
      overline: TextStyle(color: darkAccentColor, fontSize: 16.0),
    )
  );

}