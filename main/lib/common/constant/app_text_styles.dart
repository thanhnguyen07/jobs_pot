import 'package:flutter/material.dart';
import 'package:jobs_pot/common/constant/app_colors.dart';

import 'app_font_family.dart';

class AppTextStyle {
  static final bold = BoldText();
  static final regular = RegularText();

  //12
  static const textErrorInputS12 = TextStyle(
    color: Colors.red,
    fontSize: 12,
    fontFamily: AppFontFamily.light,
  );
  static const textBlackColorRegularS12 = TextStyle(
    color: AppColors.blackColor,
    fontSize: 12,
    fontFamily: AppFontFamily.regular,
  );
  static const whiteRegularS12 = TextStyle(
    color: Colors.white,
    fontSize: 12,
    fontFamily: AppFontFamily.regular,
  );
  static const textColor1RegularS12 = TextStyle(
    color: AppColors.textColor1,
    fontSize: 12,
    fontFamily: AppFontFamily.regular,
  );
  static const textColor5RegularS12 = TextStyle(
    color: AppColors.textColor5,
    fontSize: 12,
    fontFamily: AppFontFamily.regular,
  );
  static const fireYellowUnderlineRegularS12 = TextStyle(
    color: AppColors.fireYellowColor,
    fontSize: 12,
    fontFamily: AppFontFamily.regular,
    height: 1,
    decoration: TextDecoration.underline,
  );
  static const textlavenderGraS12 = TextStyle(
    color: AppColors.lavenderGrayClor,
    fontSize: 12,
    fontFamily: AppFontFamily.regular,
  );
  static const textColor2RegularS12 = TextStyle(
    color: AppColors.textColor2,
    fontSize: 12,
    fontFamily: AppFontFamily.regular,
  );
  static const darkPurpleBoldS12 = TextStyle(
    color: Colors.black,
    fontSize: 12,
    fontFamily: AppFontFamily.bold,
  );
  static const darkPurpleRegularS12 = TextStyle(
    color: Colors.black,
    fontSize: 12,
    fontFamily: AppFontFamily.regular,
  );
  static const fireYellowRegS12 = TextStyle(
    color: AppColors.fireYellowColor,
    fontSize: 12,
    fontFamily: AppFontFamily.bold,
  );

  //14
  static const whiteMediumS14 = TextStyle(
    color: Colors.white,
    fontSize: 14,
    fontFamily: AppFontFamily.medium,
  );
  static const redBoldS14 = TextStyle(
    color: Colors.red,
    fontSize: 14,
    fontFamily: AppFontFamily.bold,
  );
  static const textColor6BoldS14 = TextStyle(
    color: AppColors.textColor6,
    fontSize: 14,
    fontFamily: AppFontFamily.bold,
  );
  static const textErrorS14 = TextStyle(
    color: Colors.red,
    fontSize: 14,
    fontFamily: AppFontFamily.bold,
  );
  static const fireYellowUnderlineRegularS14 = TextStyle(
    color: AppColors.fireYellowColor,
    fontSize: 14,
    fontFamily: AppFontFamily.regular,
    height: 1,
    decoration: TextDecoration.underline,
  );
  static const darkPurpleBoldS14 = TextStyle(
    color: Colors.black,
    fontSize: 14,
    fontFamily: AppFontFamily.bold,
  );
  static const darkPurpleRegularS14 = TextStyle(
    color: Colors.black,
    fontSize: 14,
    fontFamily: AppFontFamily.regular,
  );
  static const textColor1RegularS14 = TextStyle(
      color: AppColors.textColor1,
      fontSize: 14,
      fontFamily: AppFontFamily.regular);

  static const whiteRegularS14 = TextStyle(
    color: Colors.white,
    fontSize: 14,
    fontFamily: AppFontFamily.regular,
  );
  static const whiteBoldS14 = TextStyle(
    color: Colors.white,
    fontSize: 14,
    fontFamily: AppFontFamily.bold,
  );
  static const egglantBoldS14 = TextStyle(
    color: AppColors.egglantColor,
    fontSize: 14,
    fontFamily: AppFontFamily.bold,
  );
  static const textlavenderGraS14 = TextStyle(
    color: AppColors.lavenderGrayClor,
    fontSize: 14,
    fontFamily: AppFontFamily.regular,
  );
  //16
  static const textColor3MediumS16 = TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontFamily: AppFontFamily.medium,
  );
  static const blackBoldS16 = TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontFamily: AppFontFamily.bold,
  );
  static const text4BoldS16 = TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontFamily: AppFontFamily.bold,
  );
  //18
  static const darkPurpleBoldS18 = TextStyle(
    color: Colors.black,
    fontSize: 18,
    fontFamily: AppFontFamily.bold,
  );
  static const whiteMediumS18 = TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontFamily: AppFontFamily.medium,
  );
  static const darkPurpleBoldS20 = TextStyle(
    color: Colors.black,
    fontSize: 20,
    fontFamily: AppFontFamily.bold,
  );
  //22
  static const blackBoldS22 = TextStyle(
    color: Colors.black,
    fontSize: 22,
    fontFamily: AppFontFamily.bold,
  );
  static const egglantBoldS22 = TextStyle(
    color: AppColors.egglantColor,
    fontSize: 22,
    fontFamily: AppFontFamily.bold,
  );
  //26
  static const darkPurpleBoldS26 = TextStyle(
    color: Colors.black,
    fontSize: 26,
    fontFamily: AppFontFamily.bold,
  );
  static const whiteBoldS26 = TextStyle(
    color: Colors.white,
    fontSize: 26,
    fontFamily: AppFontFamily.bold,
  );
  //30
  static const darkPurpleBoldS30 = TextStyle(
    color: Colors.black,
    fontSize: 30,
    fontFamily: AppFontFamily.bold,
  );
  //40
  static const blackBoldS40 = TextStyle(
    color: Colors.black,
    fontSize: 40,
    fontFamily: AppFontFamily.bold,
    height: 1,
  );
  static const fireYellowUnderlineBoldS40 = TextStyle(
    color: AppColors.fireYellowColor,
    fontSize: 40,
    fontFamily: AppFontFamily.bold,
    height: 1,
    decoration: TextDecoration.underline,
  );
}

class BoldText {
  final white12 = const TextStyle(
    color: Colors.white,
    fontSize: 12,
    fontFamily: AppFontFamily.bold,
  );
  final black12 = const TextStyle(
    color: Colors.white,
    fontSize: 12,
    fontFamily: AppFontFamily.bold,
  );
}

class RegularText {
  final black14 = const TextStyle(
    color: Colors.black,
    fontSize: 14,
    fontFamily: AppFontFamily.regular,
  );
}
