import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/common/app_text_styles.dart';
import 'package:jobs_pot/common/app_keys.dart';
import 'package:jobs_pot/common/widgets/button_submit_form.dart';
import 'package:jobs_pot/common/widgets/password_input.dart';
import 'package:jobs_pot/features/setting/setting_providers.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/system/system_providers.dart';
import 'package:jobs_pot/utils/utils.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AddPasswordForm extends ConsumerStatefulWidget {
  const AddPasswordForm({Key? key}) : super(key: null);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends ConsumerState<AddPasswordForm> {
  FormControl<dynamic>? formControlPassword;
  FormControl<dynamic>? formControlConfirmPassword;

  late bool rememberState = true;
  late FormGroup _addPasswordForm;

  @override
  void initState() {
    super.initState();

    _addPasswordForm =
        ref.read(addPasswordControllerProvider.notifier).getAddPasswordForm();

    _addPasswordForm.reset();

    formControlPassword =
        _addPasswordForm.control(ValidationKeys.password) as FormControl?;

    formControlConfirmPassword = _addPasswordForm
        .control(ValidationKeys.confirmPassword) as FormControl?;
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(languageControllerProvider);

    return ReactiveForm(
      formGroup: _addPasswordForm,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _formInput(),
          ButtonSubmitForm(
            title: Text(
              Utils.getLocaleMessage(LocaleKeys.settingAccountLinkPassword),
              style: AppTextStyle.whiteBoldS14,
            ),
            onLogin: () {
              ref
                  .read(addPasswordControllerProvider.notifier)
                  .addPassword(context);
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
        ),
        PasswordInput(
          formControlPassword: formControlConfirmPassword,
          subTitleKey: LocaleKeys.settingAccountChangePasswordConfirmTitle,
        )
      ],
    );
  }
}
