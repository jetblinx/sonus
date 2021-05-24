import 'package:flutter/material.dart';
import 'package:sonus/utils/constants.dart';

class ThemesRepisotory {

  static final light = ThemeData(
      scaffoldBackgroundColor: kLightScaffoldBackgroundColor,
      primaryColor: kPrimaryColor,
      accentColor: kLightAccentColor,
      buttonColor: kLightAccentColor,
      backgroundColor: kLightScaffoldBackgroundColor,
      textTheme: TextTheme(
        bodyText1: TextStyle(
          // fontFamily: "Open Sans",
          color: kLightAccentColor,
          fontSize: 16.0
        ),
        bodyText2: TextStyle(
          fontFamily: "Open Sans",
          color: kLightAccentColor, 
          fontSize: 14.0,
          fontWeight: FontWeight.w600,
        ),
        button: TextStyle(
          fontFamily: "Open Sans",
          color: kLightAccentColor, 
          fontSize: 16.0
        ),
        subtitle1: TextStyle(
          fontFamily: "Open Sans",
          color: kLightAccentColor, 
          fontSize: 16.0
        ),
        subtitle2: TextStyle(
          fontFamily: "Open Sans",
          color: kLightAccentColor, 
          fontSize: 16.0
        ),
        caption: TextStyle(
          fontFamily: "Open Sans",
          color: kLightAccentColor,
          fontWeight: FontWeight.w600,
          fontSize: 18.0
        ),
        headline1: TextStyle(
          fontFamily: "Open Sans",
          color: kLightAccentColor,
          fontWeight: FontWeight.w800,
          fontSize: 16.0
        ),
        headline2: TextStyle(
          fontFamily: "Open Sans",
          color: kLightAccentColor, 
          fontSize: 16.0
        ),
        headline3: TextStyle(
          fontFamily: "Open Sans",
          color: kLightAccentColor, 
          fontSize: 16.0
        ),
        headline4: TextStyle(
          fontFamily: "Open Sans",
          color: kLightAccentColor, 
          fontSize: 16.0
        ),
        headline5: TextStyle(
          fontFamily: "Open Sans",
          color: kLightAccentColor, 
          fontSize: 16.0
        ),
        headline6: TextStyle(
          fontFamily: "Open Sans",
          color: kLightAccentColor, 
          fontSize: 16.0
        ),
        overline: TextStyle(
          fontFamily: "Open Sans",
          color: kLightAccentColor, 
          fontSize: 16.0
        ),
      ),
  );

  static final dark = ThemeData(
    scaffoldBackgroundColor: kDarkScaffoldBackgroundColor,
    primaryColor: kPrimaryColor,
    accentColor: kDarkAccentColor,
    buttonColor: kDarkAccentColor,
    backgroundColor: kDarkScaffoldBackgroundColor,
    textTheme: TextTheme(
      bodyText1: TextStyle(
        // fontFamily: "Open Sans",
        color: kDarkAccentColor, 
        fontSize: 14.0
      ),
      bodyText2: TextStyle(
        // fontFamily: "Open Sans",
        color: kDarkAccentColor, 
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
      ),
      button: TextStyle(
        // fontFamily: "Open Sans",
        color: kDarkAccentColor, 
        fontSize: 16.0
      ),
      subtitle1: TextStyle(
        // fontFamily: "Open Sans",
        color: kDarkAccentColor, 
        fontSize: 16.0
      ),
      subtitle2: TextStyle(
        // fontFamily: "Open Sans",
        color: kDarkAccentColor, 
        fontSize: 16.0
      ),
      caption: TextStyle(
        // fontFamily: "Open Sans",
        color: kDarkAccentColor,
        fontWeight: FontWeight.w600,
        fontSize: 18.0
      ),
      headline1: TextStyle(
        // fontFamily: "Open Sans",
        color: kDarkAccentColor,
        fontWeight: FontWeight.w800,
        fontSize: 16.0
      ),
      headline2: TextStyle(
        // fontFamily: "Open Sans",
        color: kDarkAccentColor, 
        fontSize: 16.0
      ),
      headline3: TextStyle(
        // fontFamily: "Open Sans",
        color: kDarkAccentColor, 
        fontSize: 16.0
      ),
      headline4: TextStyle(
        // fontFamily: "Open Sans",
        color: kDarkAccentColor, 
        fontSize: 16.0
      ),
      headline5: TextStyle(
        // fontFamily: "Open Sans",
        color: kDarkAccentColor, 
        fontSize: 16.0
      ),
      headline6: TextStyle(
        // fontFamily: "Open Sans",
        color: kDarkAccentColor, 
        fontSize: 16.0
      ),
      overline: TextStyle(
        // fontFamily: "Open Sans",
        color: kDarkAccentColor, 
        fontSize: 16.0
      ),
    )
  );

}