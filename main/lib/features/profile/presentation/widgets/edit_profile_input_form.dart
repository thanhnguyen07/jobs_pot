import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/common/app_keys.dart';
import 'package:jobs_pot/common/app_text_styles.dart';
import 'package:jobs_pot/common/widgets/button_submit_form.dart';
import 'package:jobs_pot/common/widgets/full_name_input.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/features/authentication/domain/entities/User/user_entity.dart';
import 'package:jobs_pot/features/profile/presentation/widgets/gender_form.dart';
import 'package:jobs_pot/features/profile/presentation/widgets/location_input.dart';
import 'package:jobs_pot/features/profile/presentation/widgets/phone_number_input.dart';
import 'package:jobs_pot/features/profile/profile_provider.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
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

    return ReactiveForm(
      formGroup: _profileInputForm,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FullNameInput(
              formControlFullName: formControlFullName,
              hintName: userData!.userName,
            ),
            const DateOfBirthBox(),
            const GenderForm(),
            const PhoneNumberInput(),
            LocationInput(
              formControlLocation: formControlLocation,
              hintText: userData.location ?? '',
            ),
            ButtonSubmitForm(
              title: Text(
                Utils.getLocaleMessage(LocaleKeys.profileSaveTitle),
                style: AppTextStyle.whiteBoldS14,
              ),
              onLogin: () {
                ref.read(profileControllerProvider.notifier).onSave();
              },
            )
          ],
        ),
      ),
    );
  }
}
