import 'package:flutter/material.dart';
import 'package:sonus/utils/constants.dart';

class ThemesRepisotory {

  static final light = ThemeData(
      scaffoldBackgroundColor: kColorLightScaffoldBackground,
      primaryColor: kColorPrimary,
      accentColor: kColorLightAccent,
      buttonColor: kColorLightAccent,
      backgroundColor: kColorLightScaffoldBackground,
      textTheme: TextTheme(
        bodyText1: TextStyle(
          // fontFamily: "Open Sans",
          color: kColorLightAccent,
          fontSize: 16.0
        ),
        bodyText2: TextStyle(
          fontFamily: "Open Sans",
          color: kColorLightAccent, 
          fontSize: 14.0,
          fontWeight: FontWeight.w600,
        ),
        button: TextStyle(
          fontFamily: "Open Sans",
          color: kColorLightAccent, 
          fontSize: 16.0
        ),
        subtitle1: TextStyle(
          fontFamily: "Open Sans",
          color: kColorLightAccent, 
          fontSize: 16.0
        ),
        subtitle2: TextStyle(
          fontFamily: "Open Sans",
          color: kColorLightAccent, 
          fontSize: 16.0
        ),
        caption: TextStyle(
          fontFamily: "Open Sans",
          color: kColorLightAccent,
          fontWeight: FontWeight.w600,
          fontSize: 20.0,
          height: 1.5
        ),
        headline1: TextStyle(
          fontFamily: "Open Sans",
          color: kColorLightAccent,
          fontWeight: FontWeight.w800,
          fontSize: 16.0
        ),
        headline2: TextStyle(
          fontFamily: "Open Sans",
          color: kColorLightAccent, 
          fontSize: 16.0
        ),
        headline3: TextStyle(
          fontFamily: "Open Sans",
          color: kColorLightAccent, 
          fontSize: 16.0
        ),
        headline4: TextStyle(
          fontFamily: "Open Sans",
          color: kColorLightAccent, 
          fontSize: 16.0
        ),
        headline5: TextStyle(
          fontFamily: "Open Sans",
          color: kColorLightAccent, 
          fontSize: 16.0
        ),
        headline6: TextStyle(
          fontFamily: "Open Sans",
          color: kColorLightAccent, 
          fontSize: 16.0
        ),
        overline: TextStyle(
          fontFamily: "Open Sans",
          color: kColorLightAccent, 
          fontSize: 16.0
        ),
      ),
  );

  static final dark = ThemeData(
    scaffoldBackgroundColor: kColorDarkScaffoldBackground,
    primaryColor: kColorPrimary,
    accentColor: kColorDarkAccent,
    buttonColor: kColorDarkAccent,
    backgroundColor: kColorDarkScaffoldBackground,
    textTheme: TextTheme(
      bodyText1: TextStyle(
        // fontFamily: "Open Sans",
        color: kColorDarkAccent, 
        fontSize: 14.0
      ),
      bodyText2: TextStyle(
        // fontFamily: "Open Sans",
        color: kColorDarkAccent, 
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
      ),
      button: TextStyle(
        // fontFamily: "Open Sans",
        color: kColorDarkAccent, 
        fontSize: 16.0
      ),
      subtitle1: TextStyle(
        // fontFamily: "Open Sans",
        color: kColorDarkAccent, 
        fontSize: 16.0
      ),
      subtitle2: TextStyle(
        // fontFamily: "Open Sans",
        color: kColorDarkAccent, 
        fontSize: 16.0
      ),
      caption: TextStyle(
        // fontFamily: "Open Sans",
        color: kColorDarkAccent,
        fontWeight: FontWeight.w600,
        fontSize: 20.0
      ),
      headline1: TextStyle(
        // fontFamily: "Open Sans",
        color: kColorDarkAccent,
        fontWeight: FontWeight.w800,
        fontSize: 16.0
      ),
      headline2: TextStyle(
        // fontFamily: "Open Sans",
        color: kColorDarkAccent, 
        fontSize: 16.0
      ),
      headline3: TextStyle(
        // fontFamily: "Open Sans",
        color: kColorDarkAccent, 
        fontSize: 16.0
      ),
      headline4: TextStyle(
        // fontFamily: "Open Sans",
        color: kColorDarkAccent, 
        fontSize: 16.0
      ),
      headline5: TextStyle(
        // fontFamily: "Open Sans",
        color: kColorDarkAccent, 
        fontSize: 16.0
      ),
      headline6: TextStyle(
        // fontFamily: "Open Sans",
        color: kColorDarkAccent, 
        fontSize: 16.0
      ),
      overline: TextStyle(
        // fontFamily: "Open Sans",
        color: kColorDarkAccent, 
        fontSize: 16.0
      ),
    )
  );

}