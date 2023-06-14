import 'package:flutter/material.dart';
import 'package:jobs_pot/common/app_colors.dart';

import 'app_font_family.dart';

class AppTextStyle {
  //12
  static const textColor1RegularS12 = TextStyle(
      color: AppColors.textColor1,
      fontSize: 12,
      fontFamily: AppFontFamily.dMSansRegular);
  static const textColor2RegularS12 = TextStyle(
      color: AppColors.textColor2,
      fontSize: 12,
      fontFamily: AppFontFamily.dMSansRegular);
  static const darkPurpleBoldS12 = TextStyle(
    color: AppColors.darkPurpleColor,
    fontSize: 12,
    fontFamily: AppFontFamily.dMSansBold,
  );
  static const darkPurpleRegularS12 = TextStyle(
    color: AppColors.darkPurpleColor,
    fontSize: 12,
    fontFamily: AppFontFamily.dMSansRegular,
  );
  //14
  static const textColor1RegularS14 = TextStyle(
      color: AppColors.textColor1,
      fontSize: 14,
      fontFamily: AppFontFamily.dMSansRegular);
  static const whiteBoldS14 = TextStyle(
      color: Colors.white, fontSize: 14, fontFamily: AppFontFamily.dMSansBold);
  static const egglantBoldS14 = TextStyle(
      color: AppColors.egglantColor,
      fontSize: 14,
      fontFamily: AppFontFamily.dMSansBold);
  //18
  static const darkPurpleBoldS18 = TextStyle(
    color: AppColors.darkPurpleColor,
    fontSize: 18,
    fontFamily: AppFontFamily.dMSansBold,
  );
  //22
  static const blackBoldS22 = TextStyle(
      color: Colors.black, fontSize: 18, fontFamily: AppFontFamily.dMSansBold);
  //26
  static const whiteBoldS26 = TextStyle(
      color: Colors.white, fontSize: 26, fontFamily: AppFontFamily.dMSansBold);
  //30
  static const darkPurpleBoldS30 = TextStyle(
    color: AppColors.darkPurpleColor,
    fontSize: 30,
    fontFamily: AppFontFamily.dMSansBold,
  );
  //40
  static const blackBoldS40 = TextStyle(
    color: Colors.black,
    fontSize: 40,
    fontFamily: AppFontFamily.dMSansBold,
    height: 1,
  );
  static const fireYellowUnderlineBoldS40 = TextStyle(
    color: AppColors.fireYellowColor,
    fontSize: 40,
    fontFamily: AppFontFamily.dMSansBold,
    height: 1,
    decoration: TextDecoration.underline,
  );
}
