import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:jobs_pot/common/app_style.dart';
import 'package:jobs_pot/common/app_text_styles.dart';
import 'package:jobs_pot/config/app_configs.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/features/authentication/domain/entities/user_entity.dart';
import 'package:jobs_pot/features/profile/profile_provider.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
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
    PhoneNumber number =
        PhoneNumber(isoCode: AppConfigs.defaultCodePhoneNumber);

    bool editProfileState = ref.watch(profileControllerProvider);

    UserEntity? userData = ref.watch(authControllerProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            Utils.getLocaleMessage(LocaleKeys.profilePhoneNumberTitle),
            style: AppTextStyle.darkPurpleBoldS14,
          ),
        ),
        Container(
          decoration: AppStyles.boxStyle,
          padding: const EdgeInsets.only(left: 10),
          child: InternationalPhoneNumberInput(
            isEnabled: !editProfileState,
            onInputChanged: (PhoneNumber number) {
              ref
                  .read(profileControllerProvider.notifier)
                  .setPhoneNumber(number.phoneNumber);
            },
            initialValue: number,
            selectorConfig: const SelectorConfig(
              selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
            ),
            inputDecoration: InputDecoration(
              hintText: userData?.phoneNumber?.substring(3) ??
                  Utils.getLocaleMessage(LocaleKeys.profilePhoneNumberHintText),
              border: const OutlineInputBorder(),
            ),
            textStyle: AppTextStyle.darkPurpleBoldS14,
          ),
        ),
      ],
    );
  }
}
