import 'package:flutter/material.dart';
import 'package:jobs_pot/common/constant/app_keys.dart';
import 'package:jobs_pot/common/constant/app_text_styles.dart';
import 'package:jobs_pot/common/widgets/input_reactive_forms.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/utils/utils.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FullNameInput extends StatelessWidget {
  const FullNameInput({
    super.key,
    required this.formControlFullName,
    required this.hintName,
  });

  final FormControl? formControlFullName;
  final String hintName;

  @override
  Widget build(BuildContext context) {
    return InputReactiveForms(
      hintText: hintName,
      obscureText: false,
      formController: formControlFullName,
      title: Text(
        Utils.getLocaleMessage(LocaleKeys.authenticationFullNameInputTitle),
        style: AppTextStyle.darkPurpleBoldS14,
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
