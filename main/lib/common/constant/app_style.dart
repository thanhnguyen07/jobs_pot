import 'package:flutter/material.dart';
import 'package:jobs_pot/common/constant/app_colors.dart';

class AppStyles {
  static const boxStyle = BoxDecoration(
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: AppColors.shadowColor,
        blurRadius: 4,
        offset: Offset(2, 4), // Shadow position
      ),
    ],
  );
}
