import 'package:flutter/material.dart';
import 'package:rgproject/extras/colors.dart';

class TextStyles {
  static TextStyle onBoardingHeadlines() {
    return TextStyle(
        color: MyColors.headlineBlack,
        fontSize: 26,
        fontFamily: "Futura",
        fontWeight: FontWeight.w600,
        letterSpacing: .7,
        height: 1.2);
  }

  static TextStyle appBarRedButton() {
    return TextStyle(
      fontSize: 14,
      color: MyColors.buttonRed,
    );
  }

  static TextStyle registerHeadline() {
    return TextStyle(
      color: MyColors.headlineBlack,
      fontSize: 25,
      fontWeight: FontWeight.w500,
      letterSpacing: .8,
      height: 1.2,
    );
  }

  static TextStyle headlineNotBold() {
    return TextStyle(
        color: MyColors.headlineBlack,
        fontSize: 22,
        fontWeight: FontWeight.w500,
        letterSpacing: .8,
        height: 1.2);
  }

  static TextStyle onBoardingTitles() {
    return TextStyle(
        color: MyColors.titleBlack,
        fontFamily: "Futura",
        fontSize: 15,
        letterSpacing: .8,
        height: 1.3);
  }

  static TextStyle fadedBlackTextSmall() {
    return TextStyle(
        color: MyColors.titleBlack,
        fontFamily: "Futura",
        fontSize: 12,
        letterSpacing: .8,
        height: 1.3);
  }

  static TextStyle verifyPin() {
    return TextStyle(
      color: MyColors.defaultPurple,
      fontSize: 14,
    );
  }
}
