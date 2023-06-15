import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/common/app_colors.dart';
import 'package:jobs_pot/common/app_text_styles.dart';
import 'package:jobs_pot/config/app_configs.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const String route = "LoginScreen";

  @override
  ConsumerState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: '${LocaleKeys.authenticationLoginTitle.tr()}\n',
                      style: AppTextStyle.darkPurpleBoldS30,
                      children: <TextSpan>[
                        TextSpan(
                          text: LocaleKeys.onboardingSubTitle.tr(),
                          style: AppTextStyle.textColor1RegularS12,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Text('2'),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {
                      context.setLocale(AppConfigs.appLanguageEn);
                    },
                    child: const Text('appLanguageEn'),
                  ),
                  TextButton(
                    onPressed: () {
                      context.setLocale(AppConfigs.appLanguageVi);
                    },
                    child: const Text('appLanguageVi'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
