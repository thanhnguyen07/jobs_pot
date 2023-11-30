import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/common/app_text_styles.dart';
import 'package:jobs_pot/common/app_keys.dart';
import 'package:jobs_pot/common/widgets/button_submit_form.dart';
import 'package:jobs_pot/common/widgets/password_input.dart';
import 'package:jobs_pot/features/authentication/presentation/widgets/remember_and_forgot.dart';
import 'package:jobs_pot/features/setting/setting_providers.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/system/system_providers.dart';
import 'package:jobs_pot/utils/utils.dart';
import 'package:reactive_forms/reactive_forms.dart';

class PasswordForm extends ConsumerStatefulWidget {
  const PasswordForm({
    Key? key,
    required this.affterVerify,
  }) : super(key: null);

  final void Function() affterVerify;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PasswordState();
}

class _PasswordState extends ConsumerState<PasswordForm> {
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
      child: Column(
        children: [
          _formInput(),
          const RememberAndForgot(
            disableRemember: true,
          ),
          ButtonSubmitForm(
            title: Text(
              Utils.getLocaleMessage(LocaleKeys.settingAccountVerify),
              style: AppTextStyle.whiteBoldS14,
            ),
            onLogin: () {
              ref
                  .read(accountControllerProvider.notifier)
                  .passwordVerify(widget.affterVerify, context);
            },
          ),
        ],
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
