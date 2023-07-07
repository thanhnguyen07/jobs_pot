import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/common/app_text_styles.dart';
import 'package:jobs_pot/common/app_validation_keys.dart';
import 'package:jobs_pot/features/authentication/presentation/widgets/button_submit_form.dart';
import 'package:jobs_pot/features/authentication/presentation/widgets/email_input.dart';
import 'package:jobs_pot/features/authentication/presentation/widgets/password_input.dart';
import 'package:jobs_pot/features/authentication/presentation/widgets/remember_and_forgot.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/system/system_providers.dart';
import 'package:jobs_pot/utils/utils.dart';
import 'package:reactive_forms/reactive_forms.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  FormControl<dynamic>? formControlEmail;
  FormControl<dynamic>? formControlPassword;

  late bool rememberState = true;
  late FormGroup loginForm;

  @override
  void initState() {
    super.initState();

    final controller = ref.read(loginWithEmailControllerProvider.notifier);

    loginForm = controller.loginForm;

    loginForm.reset();

    formControlEmail = loginForm.control(ValidationKeys.email) as FormControl?;

    formControlPassword =
        loginForm.control(ValidationKeys.password) as FormControl?;
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(languageControllerProvider);

    return ReactiveForm(
      formGroup: loginForm,
      child: Column(
        children: [
          _formInput(),
          const RememberAndForgot(),
          ButtonSubmitForm(
            title: Text(
              Utils.getLocaleMessage(LocaleKeys.authenticationLoginButtonTitle),
              style: AppTextStyle.whiteBoldS14,
            ),
            onLogin: () => ref
                .read(loginWithEmailControllerProvider.notifier)
                .onLogin(context),
          )
        ],
      ),
    );
  }

  Widget _formInput() {
    return Column(
      children: [
        EmailInput(formControlEmail: formControlEmail),
        PasswordInput(formControlPassword: formControlPassword),
      ],
    );
  }
}
