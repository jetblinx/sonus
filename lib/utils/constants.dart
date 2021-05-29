import 'package:flutter/material.dart';
import 'package:sonus/utils/size_config.dart';

/* TEXT */

/* COLORS */
// Light
Color kColorLightScaffoldBackground = Colors.grey[100];
const Color kColorLightText = Color(0xFF333333);
const Color kColorLightAccent = Color(0xFF333333);
Color kColorLightDivider = Colors.grey[300];
Color kColorLightSecondary = Colors.grey[200];

// Common
const Color kColorPrimary = Color(0xFF4CAF50);
const Color kColorWhite = Colors.white;
const Color kColorSwitchGrey = Color(0xFFD0D0D0);

Color kColorBackgroundScreenSplash = Colors.grey[900];

// Dark
Color kColorDarkScaffoldBackground = Color(0xFF111111);
const Color kColorDarkText = Color(0xFFFFFFFF);
const Color kColorDarkAccent = Color(0xFFFFFFFF);
Color kColorDarkDivider = Colors.grey[700];
Color kColorDarkSecondary = Colors.grey[900];

/* PADDINGS & MARGINS */
// Chips
double kPaddingChipsHorizontal = getProportionateScreenWidth(10);
double kPaddingChipsVertical = getProportionateScreenWidth(2);
double kPaddingBlockChips = getProportionateScreenHeight(5);

// Screens
double kPaddingAllHorizontal = getProportionateScreenWidth(15);
double kPaddingScreenPage = getProportionateScreenWidth(10);
double kPaddingScreenPageContent = getProportionateScreenWidth(15);

double kPaddingBottom20 = getProportionateScreenWidth(20);

// Groups
double kPaddingGroupContainer = getProportionateScreenWidth(15);

// Switch
const double kPaddingSwitchCircle = 5;

/* SIZES */

// Size of phone where testing the app.
// Used for screen adaptation
const double kSizePhoneHeight = 851.0;
const double kSizePhoneWidth = 393.0;

const double kSizeButtonMic = 64;
const double kSizeButtonComplete = 32;
const double kSizeButtonEnd = 48;
const int kSizeTextFieldLines = 5;

const double kSizeBlockChips = 154;

// Switch
const double kSizeSwitchCircle = 20;
const double kSizeSwitchWidth = 50;

/* DURATION */
const kDurationSwitch = Duration(milliseconds: 300);
