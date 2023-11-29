import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/common/app_text_styles.dart';
import 'package:jobs_pot/common/app_keys.dart';
import 'package:jobs_pot/common/widgets/button_submit_form.dart';
import 'package:jobs_pot/common/widgets/email_input.dart';
import 'package:jobs_pot/common/widgets/full_name_input.dart';
import 'package:jobs_pot/common/widgets/password_input.dart';
import 'package:jobs_pot/features/authentication/presentation/widgets/remember_and_forgot.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/features/profile/profile_provider.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/system/system_providers.dart';
import 'package:jobs_pot/utils/utils.dart';
import 'package:reactive_forms/reactive_forms.dart';

class EditProfileForm extends ConsumerStatefulWidget {
  const EditProfileForm({Key? key}) : super(key: null);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditProfileFormState();
}

class _EditProfileFormState extends ConsumerState<EditProfileForm> {
  FormControl<dynamic>? formControlFullName;
  FormControl<dynamic>? formControlEmail;
  FormControl<dynamic>? formControlPassword;

  late bool rememberState = true;
  late FormGroup _editProfileForm;

  @override
  void initState() {
    super.initState();

    _editProfileForm =
        ref.read(editProfileControllerProvider.notifier).getEditProfileForm();

    _editProfileForm.reset();

    formControlFullName =
        _editProfileForm.control(ValidationKeys.fullName) as FormControl?;

    formControlEmail =
        _editProfileForm.control(ValidationKeys.email) as FormControl?;

    formControlPassword =
        _editProfileForm.control(ValidationKeys.password) as FormControl?;
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(languageControllerProvider);

    return ReactiveForm(
      formGroup: _editProfileForm,
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
              ref.read(signUpWithEmailProvider.notifier).onSignUp(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _formInput() {
    return Column(
      children: [
        FullNameInput(
          formControlFullName: formControlFullName,
          hintName: Utils.getLocaleMessage(
              LocaleKeys.authenticationInputFullNameHintText),
        ),
        EmailInput(
          formControlEmail: formControlEmail,
          hintEmail: Utils.getLocaleMessage(
              LocaleKeys.authenticationInputEmailHintText),
        ),
        PasswordInput(
          formControlPassword: formControlPassword,
        )
      ],
    );
  }
}
