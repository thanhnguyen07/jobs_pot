import 'package:flutter/material.dart';
import 'package:jobs_pot/common/constant/app_keys.dart';
import 'package:jobs_pot/common/constant/app_text_styles.dart';
import 'package:jobs_pot/common/widgets/input_reactive_forms.dart';
import 'package:i18n/i18n.dart';
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
      inputBakgourndColor: Theme.of(context).colorScheme.background,
      focusedInputBorderColor: Theme.of(context).colorScheme.onBackground,
      hintText: hintText,
      obscureText: false,
      formController: formControlLocation,
      title: Text(
        Utils.getLocaleMessage(LocaleKeys.profileLocationTitle),
        style: AppTextStyle.bold.s14.copyWith(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
      validationMessages: {
        ValidationKeys.required: (error) =>
            Utils.getLocaleMessage(LocaleKeys.authenticationInputRequired),
      },
    );
  }
}
