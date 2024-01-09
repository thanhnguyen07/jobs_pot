import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/common/constant/app_text_styles.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:models/entities/export.dart';
import 'package:jobs_pot/features/profile/profile_provider.dart';
import 'package:i18n/i18n.dart';
import 'package:jobs_pot/utils/utils.dart';

class GenderForm extends ConsumerStatefulWidget {
  const GenderForm({
    super.key,
  });

  @override
  ConsumerState<GenderForm> createState() => _GenderFormState();
}

class _GenderFormState extends ConsumerState<GenderForm> {
  String genderValue = LocaleKeys.profileGenderMale;

  @override
  void initState() {
    UserEntity? userData = ref.read(authControllerProvider);

    if (userData?.gender != null) {
      genderValue = userData!.gender!;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool editProfileState = ref.watch(profileControllerProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            Utils.getLocaleMessage(LocaleKeys.profileGenderTitle),
            style: AppTextStyle.bold.s14.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            _box(
              title: Utils.getLocaleMessage(LocaleKeys.profileGenderMale),
              checked: genderValue ==
                  Utils.getLocaleMessage(LocaleKeys.profileGenderMale),
              editProfileState: editProfileState,
              context: context,
            ),
            const SizedBox(width: 20),
            _box(
              title: Utils.getLocaleMessage(LocaleKeys.profileGenderFemale),
              checked: genderValue ==
                  Utils.getLocaleMessage(LocaleKeys.profileGenderFemale),
              editProfileState: editProfileState,
              context: context,
            ),
          ],
        )
      ],
    );
  }

  Widget _box({
    required String title,
    required bool checked,
    required bool editProfileState,
    required BuildContext context,
  }) {
    return TextButton.icon(
      icon: _iconCheck(checked, context),
      onPressed: () {
        editProfileState
            ? null
            : setState(() {
                ref.read(profileControllerProvider.notifier).setGender(title);

                genderValue = title;
              });
      },
      style: TextButton.styleFrom(
        minimumSize: const Size(0, 50),
        backgroundColor: Theme.of(context).colorScheme.background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 10,
      ),
      label: Text(
        title,
        style: AppTextStyle.regular.s14.copyWith(
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
    );
  }

  Container _iconCheck(bool checked, BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        border: Border.all(
          color: checked
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.onBackground,
        ),
      ),
      child: checked
          ? Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                color: Theme.of(context).colorScheme.primary,
              ),
            )
          : const SizedBox(),
    );
  }
}
