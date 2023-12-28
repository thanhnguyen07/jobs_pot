import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/common/constant/app_text_styles.dart';
import 'package:jobs_pot/common/constant/app_keys.dart';
import 'package:jobs_pot/common/widgets/button_submit_form.dart';
import 'package:jobs_pot/common/widgets/password_input.dart';
import 'package:jobs_pot/features/authentication/presentation/widgets/remember_and_forgot.dart';
import 'package:jobs_pot/features/setting/setting_providers.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/system/system_providers.dart';
import 'package:jobs_pot/utils/utils.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ModalVerificationPassword extends ConsumerStatefulWidget {
  const ModalVerificationPassword({
    Key? key,
    required this.verifyPassword,
  }) : super(key: null);

  final void Function() verifyPassword;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PasswordState();
}

class _PasswordState extends ConsumerState<ModalVerificationPassword> {
  FormControl<dynamic>? formControlPassword;

  late bool rememberState = true;
  late FormGroup _passwordForm;

  @override
  void initState() {
    super.initState();

    _passwordForm =
        ref.read(accountControllerProvider.notifier).getPasswordForm();

    _passwordForm.reset();

    formControlPassword =
        _passwordForm.control(ValidationKeys.password) as FormControl?;
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(languageControllerProvider);

    return ReactiveForm(
      formGroup: _passwordForm,
      child: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _formInput(),
            const RememberAndForgot(
              disableRemember: true,
            ),
            ButtonSubmitForm(
              title: Text(
                Utils.getLocaleMessage(LocaleKeys.settingAccountVerify),
                style: AppTextStyle.bold.s14,
              ),
              onLogin: widget.verifyPassword,
            ),
          ],
        ),
      ),
    );
  }

  Widget _formInput() {
    return Column(
      children: [
        PasswordInput(
          formControlPassword: formControlPassword,
        )
      ],
    );
  }
}
