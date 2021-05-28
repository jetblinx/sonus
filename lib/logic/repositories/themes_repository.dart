import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sonus/utils/constants.dart';

class ThemesRepisotory {
  static final light = ThemeData(
    scaffoldBackgroundColor: kColorLightScaffoldBackground,
    appBarTheme: AppBarTheme(
      brightness: Brightness.light,
      backgroundColor: Colors.transparent,
      // systemOverlayStyle: SystemUiOverlayStyle(
      //   statusBarColor: Colors.transparent,
      //   statusBarIconBrightness: Brightness.dark,
      //   systemNavigationBarColor: kColorLightScaffoldBackground,
      //   systemNavigationBarIconBrightness: Brightness.dark,
      //   systemNavigationBarDividerColor: Colors.transparent,
      // ),
    ),
    colorScheme: ColorScheme(
          primary: kColorPrimary,
          primaryVariant: Colors.white,
          secondary: kColorLightSecondary,
          secondaryVariant: Colors.white,
          surface: Colors.white,
          background: kColorLightDivider,
          error: Colors.white,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.white,
          onBackground: Colors.white,
          onError: Colors.white,
          brightness: Brightness.light),
    primaryColor: kColorPrimary,
    accentColor: kColorLightAccent,
    buttonColor: kColorLightAccent,
    backgroundColor: kColorLightScaffoldBackground,
    dividerColor: kColorLightDivider,
    dividerTheme: DividerThemeData(color: kColorLightDivider),
    chipTheme: ChipThemeData(
        backgroundColor: kColorLightDivider,
        disabledColor: Colors.grey,
        brightness: Brightness.light,
        labelStyle: TextStyle(
            fontFamily: "Open Sans", color: kColorLightAccent, fontSize: 14.0),
        secondaryLabelStyle: TextStyle(
            fontFamily: "Open Sans", color: kColorLightAccent, fontSize: 14.0),
        selectedColor: kColorPrimary,
        secondarySelectedColor: kColorPrimary,
        labelPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
        padding: EdgeInsets.zero),
    textTheme: TextTheme(
      bodyText1: TextStyle(
          fontFamily: "Open Sans", color: kColorLightAccent, fontSize: 16.0),
      bodyText2: TextStyle(
        fontFamily: "Open Sans",
        color: kColorLightAccent,
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
      ),
      button: TextStyle(
          fontFamily: "Open Sans", color: kColorLightAccent, fontSize: 16.0),
      subtitle1: TextStyle(
          fontFamily: "Open Sans", color: kColorLightAccent, fontSize: 16.0),
      subtitle2: TextStyle(
          fontFamily: "Open Sans", color: kColorLightAccent, fontSize: 16.0),
      caption: TextStyle(
          fontFamily: "Open Sans",
          color: kColorLightAccent,
          fontWeight: FontWeight.w600,
          fontSize: 20.0,
          height: 1.5),
      headline1: TextStyle(
          fontFamily: "Open Sans",
          color: kColorLightAccent,
          fontWeight: FontWeight.w800,
          fontSize: 16.0),
      headline2: TextStyle(
          fontFamily: "Open Sans", color: kColorLightAccent, fontSize: 16.0),
      headline3: TextStyle(
          fontFamily: "Open Sans", color: kColorLightAccent, fontSize: 18.0),
      headline4: TextStyle(
          fontFamily: "Open Sans", color: kColorLightAccent, fontSize: 16.0),
      headline5: TextStyle(
          fontFamily: "Open Sans", color: kColorLightAccent, fontSize: 16.0),
      headline6: TextStyle(
          fontFamily: "Open Sans", color: kColorLightAccent, fontSize: 16.0),
      overline: TextStyle(
          fontFamily: "Open Sans", color: kColorLightAccent, fontSize: 16.0),
    ),
  );

  static final dark = ThemeData(
      scaffoldBackgroundColor: kColorDarkScaffoldBackground,
      appBarTheme: AppBarTheme(
        brightness: Brightness.dark,
        backgroundColor: Colors.transparent,
        // systemOverlayStyle: SystemUiOverlayStyle(
        //   statusBarColor: Colors.transparent,
        //   statusBarIconBrightness: Brightness.light,
        //   systemNavigationBarColor: kColorDarkScaffoldBackground,
        //   systemNavigationBarIconBrightness: Brightness.light,
        //   systemNavigationBarDividerColor: Colors.transparent,
        // ),
      ),
      colorScheme: ColorScheme(
          primary: kColorPrimary,
          primaryVariant: Colors.white,
          secondary: kColorDarkSecondary,
          secondaryVariant: Colors.white,
          surface: Colors.white,
          background: kColorDarkSecondary,
          error: Colors.white,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.white,
          onBackground: Colors.white,
          onError: Colors.white,
          brightness: Brightness.light),
      primaryColor: kColorPrimary,
      accentColor: kColorDarkAccent,
      buttonColor: kColorDarkAccent,
      backgroundColor: kColorDarkSecondary,
      dividerColor: kColorDarkScaffoldBackground,
      dividerTheme: DividerThemeData(color: kColorDarkDivider),
      chipTheme: ChipThemeData(
          backgroundColor: kColorDarkDivider,
          disabledColor: Colors.black87,
          brightness: Brightness.dark,
          labelStyle: TextStyle(
              fontFamily: "Open Sans", color: kColorDarkAccent, fontSize: 14.0),
          secondaryLabelStyle: TextStyle(
              fontFamily: "Open Sans", color: kColorDarkAccent, fontSize: 14.0),
          selectedColor: kColorPrimary,
          secondarySelectedColor: kColorPrimary,
          labelPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
          padding: EdgeInsets.zero),
      textTheme: TextTheme(
        bodyText1: TextStyle(
            fontFamily: "Open Sans", color: kColorDarkAccent, fontSize: 16.0),
        bodyText2: TextStyle(
          fontFamily: "Open Sans",
          color: kColorDarkAccent,
          fontSize: 14.0,
          fontWeight: FontWeight.w600,
        ),
        button: TextStyle(
            fontFamily: "Open Sans", color: kColorDarkAccent, fontSize: 16.0),
        subtitle1: TextStyle(
            fontFamily: "Open Sans", color: kColorDarkAccent, fontSize: 16.0),
        subtitle2: TextStyle(
            fontFamily: "Open Sans", color: kColorDarkAccent, fontSize: 16.0),
        caption: TextStyle(
            fontFamily: "Open Sans",
            color: kColorDarkAccent,
            fontWeight: FontWeight.w600,
            fontSize: 20.0),
        headline1: TextStyle(
            fontFamily: "Open Sans",
            color: kColorDarkAccent,
            fontWeight: FontWeight.w800,
            fontSize: 16.0),
        headline2: TextStyle(
            fontFamily: "Open Sans", color: kColorDarkAccent, fontSize: 16.0),
        headline3: TextStyle(
            fontFamily: "Open Sans", color: kColorDarkAccent, fontSize: 18.0),
        headline4: TextStyle(
            fontFamily: "Open Sans", color: kColorDarkAccent, fontSize: 16.0),
        headline5: TextStyle(
            fontFamily: "Open Sans", color: kColorDarkAccent, fontSize: 16.0),
        headline6: TextStyle(
            fontFamily: "Open Sans", color: kColorDarkAccent, fontSize: 16.0),
        overline: TextStyle(
            fontFamily: "Open Sans", color: kColorDarkAccent, fontSize: 16.0),
      ));
}
