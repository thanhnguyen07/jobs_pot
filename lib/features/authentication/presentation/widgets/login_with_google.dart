import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/common/app_colors.dart';
import 'package:jobs_pot/common/app_images.dart';
import 'package:jobs_pot/common/app_text_styles.dart';
import 'package:jobs_pot/common/widgets/cutom_button.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/system/system_providers.dart';
import 'package:jobs_pot/utils/utils.dart';

class LoginWithGoogle extends ConsumerStatefulWidget {
  const LoginWithGoogle({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _LoginWithGoogleState();
}

class _LoginWithGoogleState extends ConsumerState<LoginWithGoogle> {
  @override
  Widget build(BuildContext context) {
    ref.watch(languageControllerProvider);

    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, top: 5),
      child: CutomButton(
        title: Text(
          Utils.getLocaleMessage(LocaleKeys.authenticationGoogleButtonTitle),
          style: AppTextStyle.egglantBoldS14,
        ),
        backgroundColor: AppColors.lavenderColor,
        onPressed: () async {
          await ref.read(loginWithGoogleControllerProvider.notifier).signInWithGoogle();
        },
        icon: Container(
          margin: const EdgeInsets.only(right: 10),
          child: Image.asset(
            AppImages.google,
            width: 15,
            height: 20,
          ),
        ),
      ),
    );
  }
}
