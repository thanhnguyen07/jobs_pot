import 'package:flutter/material.dart';
import 'package:jobs_pot/common/app_text_styles.dart';
import 'package:jobs_pot/common/app_validation_keys.dart';
import 'package:jobs_pot/features/authentication/presentation/widgets/eye_suffix_icon.dart';
import 'package:jobs_pot/features/authentication/presentation/widgets/input_reactive_forms.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/utils/utils.dart';
import 'package:reactive_forms/reactive_forms.dart';

class PasswordInput extends StatefulWidget {
  const PasswordInput({Key? key, required this.formControlPassword})
      : super(key: key);

  final FormControl<dynamic>? formControlPassword;

  @override
  State<StatefulWidget> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  late bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    return InputReactiveForms(
      hintText: Utils.getLocaleMessage(
          LocaleKeys.authenticationInputPasswordHintText),
      obscureText: showPassword,
      suffixIcon: EyeSuffixIcon(
        showPassword: showPassword,
        setShowPassword: () => setState(() {
          showPassword = !showPassword;
        }),
      ),
      formController: widget.formControlPassword,
      title: Text(
        Utils.getLocaleMessage(LocaleKeys.authenticationPasswordInputTitle),
        style: AppTextStyle.darkPurpleBoldS14,
      ),
      validationMessages: {
        ValidationKeys.required: (error) =>
            Utils.getLocaleMessage(LocaleKeys.authenticationInputRequired),
        ValidationKeys.nonAlphanumeric: (error) => Utils.getLocaleMessage(
            LocaleKeys.authenticationPasswordValidationMessages1),
        ValidationKeys.number: (error) => Utils.getLocaleMessage(
            LocaleKeys.authenticationPasswordValidationMessages2),
        ValidationKeys.lowerCase: (error) => Utils.getLocaleMessage(
            LocaleKeys.authenticationPasswordValidationMessages3),
        ValidationKeys.upperCase: (error) => Utils.getLocaleMessage(
            LocaleKeys.authenticationPasswordValidationMessages4),
        ValidationKeys.min: (error) => Utils.getLocaleMessage(
            LocaleKeys.authenticationPasswordValidationMessages5),
      },
    );
  }
}
