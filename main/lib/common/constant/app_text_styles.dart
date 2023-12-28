import 'package:flutter/material.dart';
import 'package:jobs_pot/common/constant/app_colors.dart';

import 'app_font_family.dart';

class AppTextStyle {
  static final bold = BoldText();
  static final regular = RegularText();
  static final boldItalic = BoldItalicText();
  static final lightItalic = LightItalicText();
  static final light = ItalicText();
  static final mediumItalic = MediumItalicText();
}

class BoldText {
  final s12 = const TextStyle(
    fontSize: 12,
    fontFamily: AppFontFamily.bold,
  );
  final s14 = const TextStyle(
    fontSize: 14,
    fontFamily: AppFontFamily.bold,
  );
  final s14Red = const TextStyle(
    color: AppColors.candyAppleRed,
    fontSize: 14,
    fontFamily: AppFontFamily.bold,
  );
  final s16 = const TextStyle(
    fontSize: 16,
    fontFamily: AppFontFamily.bold,
  );
  final s18 = const TextStyle(
    fontSize: 18,
    fontFamily: AppFontFamily.bold,
  );
  final s20 = const TextStyle(
    fontSize: 20,
    fontFamily: AppFontFamily.bold,
  );
  final s22 = const TextStyle(
    fontSize: 22,
    fontFamily: AppFontFamily.bold,
  );
  final s26 = const TextStyle(
    fontSize: 26,
    fontFamily: AppFontFamily.bold,
  );
  final s30 = const TextStyle(
    fontSize: 30,
    fontFamily: AppFontFamily.bold,
  );
  final s40 = const TextStyle(
    fontSize: 40,
    fontFamily: AppFontFamily.bold,
  );
  final s40FireYellowUnLine = const TextStyle(
    color: AppColors.fireYellowColor,
    fontSize: 40,
    fontFamily: AppFontFamily.bold,
    height: 1,
    decoration: TextDecoration.underline,
  );
}

class BoldItalicText {
  final s18 = const TextStyle(
    fontSize: 18,
    fontFamily: AppFontFamily.boldItalic,
  );
  final s16 = const TextStyle(
    fontSize: 16,
    fontFamily: AppFontFamily.boldItalic,
  );
  final white18 = const TextStyle(
    fontSize: 18,
    fontFamily: AppFontFamily.boldItalic,
  );
}

class LightItalicText {
  final s12 = const TextStyle(
    fontSize: 12,
    fontFamily: AppFontFamily.lightItalic,
  );
  final s14 = const TextStyle(
    fontSize: 14,
    fontFamily: AppFontFamily.lightItalic,
  );
  final s16 = const TextStyle(
    fontSize: 16,
    fontFamily: AppFontFamily.lightItalic,
  );
}

class ItalicText {
  final s12 = const TextStyle(
    fontSize: 12,
    fontFamily: AppFontFamily.light,
  );
  final s12Red = const TextStyle(
    color: AppColors.candyAppleRed,
    fontSize: 12,
    fontFamily: AppFontFamily.light,
  );
  final s16 = const TextStyle(
    fontSize: 16,
    fontFamily: AppFontFamily.light,
  );
}

class MediumItalicText {
  final s12 = const TextStyle(
    fontSize: 12,
    fontFamily: AppFontFamily.mediumItalic,
  );
  final s14 = const TextStyle(
    fontSize: 14,
    fontFamily: AppFontFamily.mediumItalic,
  );
  final s16 = const TextStyle(
    fontSize: 16,
    fontFamily: AppFontFamily.mediumItalic,
  );
  final s16red = const TextStyle(
    color: AppColors.candyAppleRed,
    fontSize: 16,
    fontFamily: AppFontFamily.mediumItalic,
  );
  final s18 = const TextStyle(
    fontSize: 18,
    fontFamily: AppFontFamily.mediumItalic,
  );
}

class RegularText {
  final s12 = const TextStyle(
    fontSize: 12,
    fontFamily: AppFontFamily.regular,
  );
  final s14 = const TextStyle(
    fontSize: 14,
    fontFamily: AppFontFamily.regular,
  );
  final s14FireYellowUnLine = const TextStyle(
    color: AppColors.fireYellowColor,
    fontSize: 14,
    fontFamily: AppFontFamily.regular,
    height: 1,
    decoration: TextDecoration.underline,
  );
}
