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

class ChangePasswordForm extends ConsumerStatefulWidget {
  const ChangePasswordForm({Key? key}) : super(key: null);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends ConsumerState<ChangePasswordForm> {
  FormControl<dynamic>? formControlOldPassword;
  FormControl<dynamic>? formControlNewPassword;
  FormControl<dynamic>? formControlConfirmNewPassword;

  late bool rememberState = true;
  late FormGroup _changePasswordForm;

  @override
  void initState() {
    super.initState();

    _changePasswordForm = ref
        .read(changePasswordControllerProvider.notifier)
        .getChangePasswordForm();

    _changePasswordForm.reset();

    formControlOldPassword =
        _changePasswordForm.control(ValidationKeys.oldPassword) as FormControl?;

    formControlNewPassword =
        _changePasswordForm.control(ValidationKeys.newPassword) as FormControl?;

    formControlConfirmNewPassword = _changePasswordForm
        .control(ValidationKeys.confirmNewPassword) as FormControl?;
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(languageControllerProvider);

    return ReactiveForm(
      formGroup: _changePasswordForm,
      child: Column(
        children: [
          _formInput(),
          const RememberAndForgot(
            disableRemember: true,
          ),
          ButtonSubmitForm(
            title: Text(
              Utils.getLocaleMessage(LocaleKeys.settingAccountChangePassword),
              style: AppTextStyle.whiteBoldS14,
            ),
            onLogin: () {
              ref
                  .read(changePasswordControllerProvider.notifier)
                  .changePassword(context);
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
          formControlPassword: formControlOldPassword,
          subTitleKey: LocaleKeys.settingAccountChangePasswordOldTitle,
        ),
        PasswordInput(
          formControlPassword: formControlNewPassword,
          subTitleKey: LocaleKeys.settingAccountChangePasswordNewTitle,
        ),
        PasswordInput(
          formControlPassword: formControlConfirmNewPassword,
          subTitleKey: LocaleKeys.settingAccountChangePasswordConfirmTitle,
        )
      ],
    );
  }
}
