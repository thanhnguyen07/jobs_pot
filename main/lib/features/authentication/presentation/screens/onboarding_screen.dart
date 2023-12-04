import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobs_pot/common/app_colors.dart';
import 'package:jobs_pot/common/app_icons.dart';
import 'package:jobs_pot/common/app_images.dart';
import 'package:jobs_pot/common/app_text_styles.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/utils/utils.dart';

@RoutePage()
class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: null);

  static const String path = "/OnboardingScreen";

  @override
  ConsumerState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            _topView(),
            _imageCenter(),
            _bottomView(),
          ],
        ),
      ),
    );
  }

  Expanded _bottomView() {
    return Expanded(
      flex: 2,
      child: Container(
        margin: const EdgeInsets.only(top: 50),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_titleBottom(), _subTitleBottom(), _buttonBottom()],
        ),
      ),
    );
  }

  SizedBox _buttonBottom() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () =>
                ref.read(onboardingController.notifier).goLogin(context),
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
    );
  }

  Container _subTitleBottom() {
    return Container(
      margin: const EdgeInsets.only(right: 30, top: 15),
      child: Text(
        Utils.getLocaleMessage(LocaleKeys.onboardingSubTitle),
        style: AppTextStyle.textColor1RegularS14,
      ),
    );
  }

  RichText _titleBottom() {
    return RichText(
      text: TextSpan(
        text: '${Utils.getLocaleMessage(LocaleKeys.onboardingTitle1)}\n',
        style: AppTextStyle.blackBoldS40,
        children: <TextSpan>[
          TextSpan(
            text: '${Utils.getLocaleMessage(LocaleKeys.onboardingTitle2)}\n',
            style: AppTextStyle.fireYellowUnderlineBoldS40,
          ),
          TextSpan(
            text: Utils.getLocaleMessage(LocaleKeys.onboardingTitle3),
            style: AppTextStyle.blackBoldS40,
          ),
        ],
      ),
    );
  }

  Expanded _imageCenter() {
    return Expanded(
      flex: 2,
      child: SizedBox(
        width: double.infinity,
        child: SvgPicture.asset(AppImages.onboarding),
      ),
    );
  }

  Expanded _topView() {
    return Expanded(
      flex: 1,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              Utils.getLocaleMessage(LocaleKeys.splashTitle),
              style: AppTextStyle.darkPurpleBoldS18,
            ),
          ],
        ),
      ),
    );
  }
}
