import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/common/app_text_styles.dart';
import 'package:jobs_pot/common/app_keys.dart';
import 'package:jobs_pot/features/authentication/presentation/widgets/button_submit_form.dart';
import 'package:jobs_pot/features/authentication/presentation/widgets/email_input.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/system/system_providers.dart';
import 'package:jobs_pot/utils/utils.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ForgotPasswordForm extends ConsumerStatefulWidget {
  const ForgotPasswordForm({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends ConsumerState<ForgotPasswordForm> {
  FormControl<dynamic>? formControlEmail;

  late FormGroup forgotPasswordForm;

  @override
  void initState() {
    super.initState();

    forgotPasswordForm =
        ref.read(forgotPasswordControllerProvider.notifier).getForm();

    forgotPasswordForm.reset();

    formControlEmail =
        forgotPasswordForm.control(ValidationKeys.email) as FormControl?;
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(languageControllerProvider);

    return ReactiveForm(
      formGroup: forgotPasswordForm,
      child: Column(
        children: [
          EmailInput(formControlEmail: formControlEmail),
          ButtonSubmitForm(
            title: Text(
              Utils.getLocaleMessage(
                  LocaleKeys.authenticationForgotPasswordButtonTitle),
              style: AppTextStyle.whiteBoldS14,
            ),
            onLogin: () {
              ref
                  .read(forgotPasswordControllerProvider.notifier)
                  .onResetPassword(context);
            },
          )
        ],
      ),
    );
  }
}
