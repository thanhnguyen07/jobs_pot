import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:jobs_pot/common/constant/app_text_styles.dart';
import 'package:jobs_pot/config/app_configs.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:models/entities/export.dart';
import 'package:jobs_pot/features/profile/profile_provider.dart';
import 'package:i18n/i18n.dart';
import 'package:jobs_pot/utils/utils.dart';

class PhoneNumberInput extends ConsumerStatefulWidget {
  const PhoneNumberInput({
    super.key,
  });

  @override
  ConsumerState<PhoneNumberInput> createState() => _PhoneNumberInputState();
}

class _PhoneNumberInputState extends ConsumerState<PhoneNumberInput> {
  @override
  Widget build(BuildContext context) {
    UserEntity? userData = ref.watch(authControllerProvider);
    bool editProfileState = ref.watch(profileControllerProvider);

    PhoneNumberEntity? phoneNumberData = userData?.phoneNumber;

    PhoneNumber number = PhoneNumber(
      dialCode: phoneNumberData?.dialCode,
      isoCode: phoneNumberData?.isoCode ?? AppConfigs.defaultCodePhoneNumber,
      phoneNumber: phoneNumberData?.phoneNumber,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            Utils.getLocaleMessage(LocaleKeys.profilePhoneNumberTitle),
            style: AppTextStyle.bold.s14
                .copyWith(color: Theme.of(context).colorScheme.onPrimary),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            color: Theme.of(context).colorScheme.background,
          ),
          padding: const EdgeInsets.only(left: 10),
          child: InternationalPhoneNumberInput(
            isEnabled: !editProfileState,
            onInputChanged: (PhoneNumber number) {
              ref
                  .read(profileControllerProvider.notifier)
                  .setPhoneNumber(number);
            },
            spaceBetweenSelectorAndTextField: 0,
            initialValue: number,
            selectorTextStyle: AppTextStyle.bold.s14.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
            selectorConfig: const SelectorConfig(
              selectorType: PhoneInputSelectorType.DIALOG,
              trailingSpace: false,
              leadingPadding: 10,
            ),
            inputDecoration: InputDecoration(
              hintText: phoneNumberData?.phoneNumber ??
                  Utils.getLocaleMessage(
                    LocaleKeys.profilePhoneNumberHintText,
                  ),
              hintStyle: AppTextStyle.regular.s14.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
            textStyle: AppTextStyle.regular.s14.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
        ),
      ],
    );
  }
}
