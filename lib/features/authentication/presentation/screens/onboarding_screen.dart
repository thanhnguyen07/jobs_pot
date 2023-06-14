import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:jobs_pot/common/app_colors.dart';
import 'package:jobs_pot/common/app_icons.dart';
import 'package:jobs_pot/common/app_images.dart';
import 'package:jobs_pot/common/app_text_styles.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/features/authentication/presentation/screens/login_screen.dart';
import 'package:jobs_pot/resources/i18n/generated/codegen_loader.g.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  static const String route = 'OnboardingScreen';

  @override
  ConsumerState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  void goLogin() {
    ref.read(autheControllerProvider).updateAuthState(true);
    context.goNamed(LoginScreen.route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(children: [
          Expanded(
            flex: 1,
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: const Text(
                      LocaleKeys.splashTitle,
                      style: AppTextStyle.darkPurpleBoldS18,
                    ).tr(),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: SizedBox(
              width: double.infinity,
              child: SvgPicture.asset(AppImages.onboarding),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              margin: const EdgeInsets.only(top: 50),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text:
                          '${CodegenLoader.en[LocaleKeys.onboardingTitle1]}\n',
                      style: AppTextStyle.blackBoldS40,
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              '${CodegenLoader.en[LocaleKeys.onboardingTitle2]}\n',
                          style: AppTextStyle.fireYellowUnderlineBoldS40,
                        ),
                        TextSpan(
                          text: CodegenLoader.en[LocaleKeys.onboardingTitle3],
                          style: AppTextStyle.blackBoldS40,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 30, top: 15),
                    child: const Text(
                      LocaleKeys.onboardingSubTitle,
                      style: AppTextStyle.textColor1RegularS14,
                    ).tr(),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: goLogin,
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            backgroundColor: AppColors.egglantColor,
                          ),
                          child: SvgPicture.asset(
                            AppIcons.arrowRight,
                            width: 25,
                            height: 25,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
