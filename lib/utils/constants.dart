import 'package:flutter/material.dart';
import 'package:sonus/utils/size_config.dart';

/* TEXT */

/* COLORS */
// Light
const Color kColorLightScaffoldBackground = Color(0xFFFFFFFF);
const Color kColorLightText = Color(0xFF333333);
const Color kColorLightAccent = Color(0xFF333333);

// Common
const Color kColorPrimary = Color(0xFF4CAF50);
const Color kColorWhite = Colors.white;

// Dark
const Color kColorDarkScaffoldBackground = Color(0xFF333333);
const Color kColorDarkText = Color(0xFFFFFFFF);
const Color kColorDarkAccent = Color(0xFFFFFFFF);

/* PADDINGS & MARGINS */
// Chips
double kPaddingChipsHorizontal = getProportionateScreenWidth(10);
double kPaddingChipsVertical = getProportionateScreenWidth(2);
double kPaddingBlockChips = getProportionateScreenHeight(5);

// Screens
double kPaddingAllHorizontal = getProportionateScreenWidth(15);
double kPaddingScreenPage = getProportionateScreenWidth(10);
double kPaddingScreenPageContent = getProportionateScreenWidth(15);

/* SIZES */

// Size of phone where testing the app.
// Used for screen adaptation
const double kSizePhoneHeight = 851.0;
const double kSizePhoneWidth = 393.0;

const double kSizeButtonMic = 64;
const int kSizeTextFieldLines = 5;

double kSizeBlockChips = getProportionateScreenWidth(160);
