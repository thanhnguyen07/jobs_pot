import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jobs_pot/common/app_text_styles.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';

class RememberAndForgot extends StatelessWidget {
  const RememberAndForgot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Text'),
        TextButton(
          child: const Text(
            LocaleKeys.authenticationForgotPassword,
            style: AppTextStyle.darkPurpleRegularS12,
          ).tr(),
          onPressed: () {},
        ),
      ],
    );
  }
}
