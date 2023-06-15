import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/common/app_text_styles.dart';
import 'package:jobs_pot/common/validation_keys.dart';
import 'package:jobs_pot/common/widgets/InputReactiveForms.dart';
import 'package:jobs_pot/config/app_configs.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/utils/validation_schema.dart';
import 'package:reactive_forms/reactive_forms.dart';

@RoutePage()
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const String path = "/LoginScreen";

  @override
  ConsumerState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  FormControl<dynamic>? formControlEmail;
  FormControl<dynamic>? formControlPassword;

  late bool showPassword = true;
  late FormGroup loginForm;

  @override
  void initState() {
    super.initState();

    final loginForm = FormGroup({
      ValidationKeys.email: FormControl<String>(
        value: '',
        validators: [Validators.required, emailValidatorSchema],
        touched: true,
      ),
      ValidationKeys.password: FormControl<String>(
        value: '',
        validators: [
          Validators.required,
          Validators.minLength(3),
          passwordValidatorSchema
        ],
        touched: true,
      ),
    });

    formControlEmail?.markAllAsTouched();
    formControlPassword?.markAllAsTouched();

    loginForm.reset();

    formControlEmail = loginForm.control(ValidationKeys.email) as FormControl?;

    formControlPassword =
        loginForm.control(ValidationKeys.password) as FormControl?;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: _bodyWidget(context),
      ),
    );
  }

  Column _bodyWidget(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: '${LocaleKeys.authenticationLoginTitle.tr()}\n',
                  style: AppTextStyle.darkPurpleBoldS30,
                  children: <TextSpan>[
                    TextSpan(
                      text: LocaleKeys.onboardingSubTitle.tr(),
                      style: AppTextStyle.textColor1RegularS12,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: _formInput(),
        ),
        Expanded(
          flex: 2,
          child: Row(
            children: [
              TextButton(
                onPressed: () {
                  context.setLocale(AppConfigs.appLanguageEn);
                },
                child: const Text('appLanguageEn'),
              ),
              TextButton(
                onPressed: () {
                  context.setLocale(AppConfigs.appLanguageVi);
                },
                child: const Text('appLanguageVi'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _formInput() {
    return Column(
      children: [
        InputReactiveForms(
          formController: formControlEmail,
          title: const Text(
            LocaleKeys.authenticationEmailInputTitle,
            style: AppTextStyle.darkPurpleBoldS12,
          ).tr(),
          validationMessages: {
            ValidationKeys.required: (error) =>
                LocaleKeys.authenticationInputRequired.tr(),
            ValidationKeys.email: (error) =>
                LocaleKeys.authenticationInputEmailFormatInCorrect.tr(),
          },
        ),
        InputReactiveForms(
          formController: formControlPassword,
          title: const Text(
            LocaleKeys.authenticationPasswordInputTitle,
            style: AppTextStyle.darkPurpleBoldS12,
          ).tr(),
          validationMessages: {
            ValidationKeys.required: (error) =>
                LocaleKeys.authenticationInputRequired.tr(),
            ValidationKeys.nonAlphanumeric: (error) =>
                LocaleKeys.authenticationPasswordValidationMessages1.tr(),
            ValidationKeys.number: (error) =>
                LocaleKeys.authenticationPasswordValidationMessages2.tr(),
            ValidationKeys.lowerCase: (error) =>
                LocaleKeys.authenticationPasswordValidationMessages3.tr(),
            ValidationKeys.upperCase: (error) =>
                LocaleKeys.authenticationPasswordValidationMessages4.tr(),
            ValidationKeys.min: (error) =>
                LocaleKeys.authenticationPasswordValidationMessages5.tr(),
          },
        ),
      ],
    );
  }
}
