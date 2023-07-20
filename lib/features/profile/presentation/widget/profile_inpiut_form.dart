import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/common/app_text_styles.dart';
import 'package:jobs_pot/common/app_keys.dart';
import 'package:jobs_pot/common/widgets/button_submit_form.dart';
import 'package:jobs_pot/common/widgets/email_input.dart';
import 'package:jobs_pot/common/widgets/full_name_input.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/features/authentication/domain/entities/user_entity.dart';
import 'package:jobs_pot/features/profile/profile_provider.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/system/system_providers.dart';
import 'package:jobs_pot/utils/utils.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ProfileInputForm extends ConsumerStatefulWidget {
  const ProfileInputForm({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProfileInputFormState();
}

class _ProfileInputFormState extends ConsumerState<ProfileInputForm> {
  FormControl<dynamic>? formControlFullName;
  FormControl<dynamic>? formControlEmail;
  FormControl<dynamic>? formControlPassword;

  late bool rememberState = true;
  late FormGroup _profileInputForm;

  @override
  void initState() {
    super.initState();

    _profileInputForm =
        ref.read(profileControllerProvider.notifier).getProfileInputForm();

    _profileInputForm.reset();

    formControlFullName =
        _profileInputForm.control(ValidationKeys.fullName) as FormControl?;

    formControlEmail =
        _profileInputForm.control(ValidationKeys.email) as FormControl?;

    formControlPassword =
        _profileInputForm.control(ValidationKeys.password) as FormControl?;
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(languageControllerProvider);
    final UserEntity? userData = ref.watch(authControllerProvider);

    return ReactiveForm(
      formGroup: _profileInputForm,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            _formInput(),
            ButtonSubmitForm(
              title: Text(
                Utils.getLocaleMessage(
                    LocaleKeys.authenticationSignUpButtonTitle),
                style: AppTextStyle.whiteBoldS14,
              ),
              onLogin: () {
                ref
                    .read(signUpWithEmailControllerProvider.notifier)
                    .onSignUp(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _formInput() {
    final UserEntity? userData = ref.watch(authControllerProvider);

    return Column(
      children: [
        FullNameInput(
          formControlFullName: formControlFullName,
          hintName: userData!.userName,
        ),
        EmailInput(
          formControlEmail: formControlEmail,
          hintEmail: userData.email,
        ),
      ],
    );
  }
}
