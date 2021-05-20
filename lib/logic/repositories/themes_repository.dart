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
          // fontFamily: "Open Sans",
          color: lightAccentColor,
          fontSize: 16.0
        ),
        bodyText2: TextStyle(
          fontFamily: "Open Sans",
          color: lightAccentColor, 
          fontSize: 14.0
        ),
        button: TextStyle(
          fontFamily: "Open Sans",
          color: lightAccentColor, 
          fontSize: 16.0
        ),
        subtitle1: TextStyle(
          fontFamily: "Open Sans",
          color: lightAccentColor, 
          fontSize: 16.0
        ),
        subtitle2: TextStyle(
          fontFamily: "Open Sans",
          color: lightAccentColor, 
          fontSize: 16.0
        ),
        caption: TextStyle(
          fontFamily: "Open Sans",
          color: lightAccentColor,
          fontWeight: FontWeight.w600,
          fontSize: 18.0
        ),
        headline1: TextStyle(
          fontFamily: "Open Sans",
          color: lightAccentColor,
          fontWeight: FontWeight.w800,
          fontSize: 16.0
        ),
        headline2: TextStyle(
          fontFamily: "Open Sans",
          color: lightAccentColor, 
          fontSize: 16.0
        ),
        headline3: TextStyle(
          fontFamily: "Open Sans",
          color: lightAccentColor, 
          fontSize: 16.0
        ),
        headline4: TextStyle(
          fontFamily: "Open Sans",
          color: lightAccentColor, 
          fontSize: 16.0
        ),
        headline5: TextStyle(
          fontFamily: "Open Sans",
          color: lightAccentColor, 
          fontSize: 16.0
        ),
        headline6: TextStyle(
          fontFamily: "Open Sans",
          color: lightAccentColor, 
          fontSize: 16.0
        ),
        overline: TextStyle(
          fontFamily: "Open Sans",
          color: lightAccentColor, 
          fontSize: 16.0
        ),
      ),
  );

  static final dark = ThemeData(
    scaffoldBackgroundColor: darkScaffoldBackgroundColor,
    primaryColor: primaryColor,
    accentColor: darkAccentColor,
    buttonColor: darkAccentColor,
    backgroundColor: darkScaffoldBackgroundColor,
    textTheme: TextTheme(
      bodyText1: TextStyle(
        // fontFamily: "Open Sans",
        color: darkAccentColor, 
        fontSize: 14.0
      ),
      bodyText2: TextStyle(
        // fontFamily: "Open Sans",
        color: darkAccentColor, 
        fontSize: 14.0
      ),
      button: TextStyle(
        // fontFamily: "Open Sans",
        color: darkAccentColor, 
        fontSize: 16.0
      ),
      subtitle1: TextStyle(
        // fontFamily: "Open Sans",
        color: darkAccentColor, 
        fontSize: 16.0
      ),
      subtitle2: TextStyle(
        // fontFamily: "Open Sans",
        color: darkAccentColor, 
        fontSize: 16.0
      ),
      caption: TextStyle(
        // fontFamily: "Open Sans",
        color: darkTextColor,
        fontWeight: FontWeight.w600,
        fontSize: 18.0
      ),
      headline1: TextStyle(
        // fontFamily: "Open Sans",
        color: darkAccentColor,
        fontWeight: FontWeight.w800,
        fontSize: 16.0
      ),
      headline2: TextStyle(
        // fontFamily: "Open Sans",
        color: darkAccentColor, 
        fontSize: 16.0
      ),
      headline3: TextStyle(
        // fontFamily: "Open Sans",
        color: darkAccentColor, 
        fontSize: 16.0
      ),
      headline4: TextStyle(
        // fontFamily: "Open Sans",
        color: darkAccentColor, 
        fontSize: 16.0
      ),
      headline5: TextStyle(
        // fontFamily: "Open Sans",
        color: darkAccentColor, 
        fontSize: 16.0
      ),
      headline6: TextStyle(
        // fontFamily: "Open Sans",
        color: darkAccentColor, 
        fontSize: 16.0
      ),
      overline: TextStyle(
        // fontFamily: "Open Sans",
        color: darkAccentColor, 
        fontSize: 16.0
      ),
    )
  );

}