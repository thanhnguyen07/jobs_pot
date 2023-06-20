import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/common/app_text_styles.dart';
import 'package:jobs_pot/common/app_validation_keys.dart';
import 'package:jobs_pot/features/authentication/presentation/widgets/button_submit_form.dart';
import 'package:jobs_pot/features/authentication/presentation/widgets/email_input.dart';
import 'package:jobs_pot/features/authentication/presentation/widgets/password_input.dart';
import 'package:jobs_pot/features/authentication/presentation/widgets/remember_and_forgot.dart';
import 'package:jobs_pot/features/authentication/presentation/widgets/input_reactive_forms.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/system/system_providers.dart';
import 'package:jobs_pot/utils/utils.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SignUpForm extends ConsumerStatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpFormState();
}

class _SignUpFormState extends ConsumerState<SignUpForm> {
  FormControl<dynamic>? formControlFullName;
  FormControl<dynamic>? formControlEmail;
  FormControl<dynamic>? formControlPassword;

  late bool rememberState = true;
  late FormGroup signUpForm;

  @override
  void initState() {
    super.initState();

    final controller = ref.read(signUpControllerProvider.notifier);

    signUpForm = controller.signUpForm;

    signUpForm.reset();

    formControlFullName =
        signUpForm.control(ValidationKeys.fullName) as FormControl?;

    formControlEmail = signUpForm.control(ValidationKeys.email) as FormControl?;

    formControlPassword =
        signUpForm.control(ValidationKeys.password) as FormControl?;
  }

  void _onSignUp(FormGroup form) {
    FocusManager.instance.primaryFocus?.unfocus();
    // final email = form.controls[ValidationKeys.email]?.value.toString() ?? "";
    // final password =
    //     form.controls[ValidationKeys.password]?.value.toString() ?? "";

    final isValid = form.valid;
    if (isValid) {
      // ref
      //     .read(signinWithEmailProvider.notifier)
      //     .signinWithMail(email, password);
    } else {
      form.controls.forEach((key, value) {
        if (value.invalid) {
          value.setErrors({
            ValidationKeys.required: LocaleKeys.authenticationInputRequired
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(languageControllerProvider);

    return ReactiveForm(
      formGroup: signUpForm,
      child: Column(
        children: [
          _formInput(),
          const RememberAndForgot(),
          ButtonSubmitForm(
            title: Text(
              Utils.getLocaleMessage(
                  LocaleKeys.authenticationSignUpButtonTitle),
              style: AppTextStyle.whiteBoldS14,
            ),
            onLogin: () {
              // _onSignUp;
              ref.read(signUpControllerProvider.notifier).onSignUp(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _formInput() {
    return Column(
      children: [
        _fullNameInput(),
        EmailInput(formControlEmail: formControlEmail),
        PasswordInput(formControlPassword: formControlPassword)
      ],
    );
  }

  InputReactiveForms _fullNameInput() {
    return InputReactiveForms(
      hintText: Utils.getLocaleMessage(
          LocaleKeys.authenticationInputFullNameHintText),
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
