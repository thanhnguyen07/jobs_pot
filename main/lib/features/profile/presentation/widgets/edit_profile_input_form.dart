import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/common/constant/app_keys.dart';
import 'package:jobs_pot/common/constant/app_text_styles.dart';
import 'package:jobs_pot/common/widgets/button_submit_form.dart';
import 'package:jobs_pot/common/widgets/full_name_input.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:models/entities/export.dart';
import 'package:jobs_pot/features/profile/presentation/widgets/gender_form.dart';
import 'package:jobs_pot/features/profile/presentation/widgets/location_input.dart';
import 'package:jobs_pot/features/profile/presentation/widgets/phone_number_input.dart';
import 'package:jobs_pot/features/profile/profile_provider.dart';
import 'package:i18n/i18n.dart';
import 'package:jobs_pot/system/system_providers.dart';
import 'package:jobs_pot/utils/utils.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'date_of_birth_box.dart';

class ProfileInputForm extends ConsumerStatefulWidget {
  const ProfileInputForm({Key? key}) : super(key: null);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProfileInputFormState();
}

class _ProfileInputFormState extends ConsumerState<ProfileInputForm> {
  FormControl<dynamic>? formControlFullName;
  FormControl<dynamic>? formControlLocation;

  late FormGroup _profileInputForm;

  @override
  void initState() {
    super.initState();

    _profileInputForm =
        ref.read(profileControllerProvider.notifier).getProfileInputForm();

    _profileInputForm.reset();

    formControlFullName =
        _profileInputForm.control(ValidationKeys.fullName) as FormControl?;

    formControlLocation =
        _profileInputForm.control(ValidationKeys.location) as FormControl?;
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(languageControllerProvider);
    final UserEntity? userData = ref.watch(authControllerProvider);

    return Container(
      margin: const EdgeInsets.only(right: 20, left: 20, bottom: 50),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.7),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: ReactiveForm(
        formGroup: _profileInputForm,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FullNameInput(
              formControlFullName: formControlFullName,
              inputBakgourndColor: Theme.of(context).colorScheme.background,
              hintName: userData!.userName,
              titleColor: Theme.of(context).colorScheme.onPrimary,
              focusedInputBorderColor:
                  Theme.of(context).colorScheme.onBackground,
            ),
            const DateOfBirthBox(),
            const GenderForm(),
            const PhoneNumberInput(),
            LocationInput(
              formControlLocation: formControlLocation,
              hintText: userData.location ?? '',
            ),
            _buttonSubmit()
          ],
        ),
      ),
    );
  }

  Container _buttonSubmit() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: ButtonSubmitForm(
        title: Text(
          Utils.getLocaleMessage(LocaleKeys.editProfileUpdateTitle),
          style: AppTextStyle.bold.s14
              .copyWith(color: Theme.of(context).colorScheme.primary),
        ),
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        onLogin: () {
          ref.read(profileControllerProvider.notifier).onSave();
        },
      ),
    );
  }
}
