import 'package:flutter/material.dart';

const Color kInactiveCardColor = Color(0xFF111428);
const Color kActiveCardColor = Color(0xFF1D1F33);
const Color kProjectAccentColor = Color(0xFFEB1555);
const Color kBackgroundColor = Color(0xFF0A0D22);
const Color kProjectGreyColor = Color(0xFF747681);
const Color kProjectDarkGreyColor = Color(0xFF1C1F32);
const Color kProjectGreen = Color(0xFF359F71);

const TextStyle kCardLabelStyle = TextStyle(
    fontSize: kCardTextFontSize,
    color: kProjectGreyColor,
    fontWeight: FontWeight.bold,
    letterSpacing: 1);

const TextStyle kCardNumberTextStyle = TextStyle(
  fontSize: kNumberTextSize,
  fontWeight: FontWeight.bold,
);

const TextStyle kResultTitleStyle = TextStyle(
  fontSize: kResultTitleTextSize,
  color: Colors.white,
  fontWeight: FontWeight.bold,
  letterSpacing: 1.0,
);

const TextStyle kBottomContainerTextStyle = TextStyle(
    fontSize: kCardTextFontSize,
    color: Colors.white,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.5);

const TextStyle kResultNumber = TextStyle(
    fontSize: 120.0,
    letterSpacing: 1.5,
    fontWeight: FontWeight.bold,
    color: Colors.white);

const TextStyle kResultText = TextStyle(
    color: Colors.white,
    fontSize: kCardTextFontSize,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.0);

const TextStyle kNormalResult = TextStyle(
    color: kProjectGreen,
    fontWeight: FontWeight.bold,
    fontSize: 20.0,
    letterSpacing: 1.0);

const double kNumberTextSize = 50.0;
const double kCardTextFontSize = 20.0;
const double kIconSize = 80.0;
const double kResultTitleTextSize = 50.0;
