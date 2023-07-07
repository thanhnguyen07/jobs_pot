import 'package:flutter/material.dart';
import 'package:jobs_pot/common/app_text_styles.dart';
import 'package:jobs_pot/common/app_keys.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/utils/utils.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'input_reactive_forms.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({
    Key? key,
    required this.formControlEmail,
  }) : super(key: key);
  final FormControl<dynamic>? formControlEmail;

  @override
  Widget build(BuildContext context) {
    return InputReactiveForms(
      formController: formControlEmail,
      keyboardType: TextInputType.emailAddress,
      hintText:
          Utils.getLocaleMessage(LocaleKeys.authenticationInputEmailHintText),
      obscureText: false,
      title: Text(
        Utils.getLocaleMessage(LocaleKeys.authenticationEmailInputTitle),
        style: AppTextStyle.darkPurpleBoldS14,
      ),
      validationMessages: {
        ValidationKeys.required: (error) =>
            Utils.getLocaleMessage(LocaleKeys.authenticationInputRequired),
        ValidationKeys.email: (error) => Utils.getLocaleMessage(
            LocaleKeys.authenticationInputEmailFormatInCorrect),
      },
    );
  }
}
