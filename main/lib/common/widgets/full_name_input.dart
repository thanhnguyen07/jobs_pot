import 'package:flutter/material.dart';
import 'package:jobs_pot/common/constant/app_colors.dart';
import 'package:jobs_pot/common/constant/app_keys.dart';
import 'package:jobs_pot/common/constant/app_text_styles.dart';
import 'package:jobs_pot/common/widgets/input_reactive_forms.dart';
import 'package:i18n/i18n.dart';
import 'package:jobs_pot/utils/utils.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FullNameInput extends StatelessWidget {
  const FullNameInput({
    super.key,
    required this.formControlFullName,
    required this.hintName,
    this.inputBakgourndColor = AppColors.white,
    this.titleColor = AppColors.black,
    this.focusedInputBorderColor = AppColors.egglantColor,
  });

  final FormControl? formControlFullName;
  final String hintName;
  final Color inputBakgourndColor;
  final Color titleColor;
  final Color focusedInputBorderColor;

  @override
  Widget build(BuildContext context) {
    return InputReactiveForms(
      inputBakgourndColor: inputBakgourndColor,
      focusedInputBorderColor: focusedInputBorderColor,
      hintText: hintName,
      obscureText: false,
      formController: formControlFullName,
      title: Text(
        Utils.getLocaleMessage(LocaleKeys.authenticationFullNameInputTitle),
        style: AppTextStyle.bold.s14.copyWith(color: titleColor),
      ),
      validationMessages: {
        ValidationKeys.required: (error) =>
            Utils.getLocaleMessage(LocaleKeys.authenticationInputRequired),
        ValidationKeys.min: (error) => Utils.getLocaleMessage(
            LocaleKeys.authenticationPasswordValidationMessages6),
      },
    );
  }
}
