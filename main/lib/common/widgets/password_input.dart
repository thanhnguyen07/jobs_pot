import 'package:flutter/material.dart';
import 'package:jobs_pot/common/constant/app_text_styles.dart';
import 'package:jobs_pot/common/constant/app_keys.dart';
import 'package:jobs_pot/common/widgets/eye_suffix_icon.dart';
import 'package:jobs_pot/common/widgets/input_reactive_forms.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/utils/utils.dart';
import 'package:reactive_forms/reactive_forms.dart';

class PasswordInput extends StatefulWidget {
  const PasswordInput({
    required this.formControlPassword,
    this.subTitleKey,
  }) : super(key: null);

  final FormControl<dynamic>? formControlPassword;

  final String? subTitleKey;

  @override
  State<StatefulWidget> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  late bool showPassword = true;

  String getTitle() {
    final String? subTitleKey = widget.subTitleKey;
    return subTitleKey != null
        ? "${Utils.getLocaleMessage(subTitleKey)} ${Utils.getLocaleMessage(LocaleKeys.authenticationPasswordInputTitle)}"
        : Utils.getLocaleMessage(LocaleKeys.authenticationPasswordInputTitle);
  }

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
        getTitle(),
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
        ValidationMessage.mustMatch: (error) => Utils.getLocaleMessage(
            LocaleKeys.authenticationPasswordValidationMessages7),
        ValidationKeys.different: (error) => Utils.getLocaleMessage(
            LocaleKeys.authenticationPasswordValidationMessages8),
      },
    );
  }
}
