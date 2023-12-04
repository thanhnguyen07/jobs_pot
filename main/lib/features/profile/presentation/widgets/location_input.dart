import 'package:flutter/material.dart';
import 'package:jobs_pot/common/app_keys.dart';
import 'package:jobs_pot/common/app_text_styles.dart';
import 'package:jobs_pot/common/widgets/input_reactive_forms.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/utils/utils.dart';
import 'package:reactive_forms/reactive_forms.dart';

class LocationInput extends StatelessWidget {
  const LocationInput({
    super.key,
    required this.formControlLocation,
    this.hintText,
  });

  final FormControl? formControlLocation;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return InputReactiveForms(
      hintText: hintText,
      obscureText: false,
      formController: formControlLocation,
      title: Text(
        Utils.getLocaleMessage(LocaleKeys.profileLocationTitle),
        style: AppTextStyle.darkPurpleBoldS14,
      ),
      validationMessages: {
        ValidationKeys.required: (error) =>
            Utils.getLocaleMessage(LocaleKeys.authenticationInputRequired),
      },
    );
  }
}
