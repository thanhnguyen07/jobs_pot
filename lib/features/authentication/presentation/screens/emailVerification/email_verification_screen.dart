import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobs_pot/common/app_colors.dart';
import 'package:jobs_pot/common/app_images.dart';
import 'package:jobs_pot/common/app_text_styles.dart';
import 'package:jobs_pot/common/widgets/cutom_button.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/features/authentication/presentation/widgets/suggestions_text.dart';
import 'package:jobs_pot/features/authentication/presentation/widgets/title_and_sub_title.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/utils/utils.dart';

@RoutePage()
class EmailVerificationScreen extends ConsumerStatefulWidget {
  const EmailVerificationScreen({Key? key}) : super(key: key);

  static const String path = '/EmailVerificationScreen';

  @override
  ConsumerState<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState
    extends ConsumerState<EmailVerificationScreen> {
  @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final emailUser = ref
        .read(emailVerificationControllerProvider.notifier)
        .getCurrentEmail();

    final count = ref.watch(emailVerificationControllerProvider);

    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              _emailVerificationTitle(emailUser),
              SvgPicture.asset(AppImages.sendMail),
              _buttonActions(),
              const SizedBox(height: 30),
              _verifySuggestion(count),
            ],
          ),
        ),
      ),
    );
  }

  SuggestionsText _verifySuggestion(int count) {
    return SuggestionsText(
      textSuggestions: Utils.getLocaleMessage(
          LocaleKeys.authenticationVerifyEmailSuggestionsResend),
      textAction: Utils.getLocaleMessage(
          LocaleKeys.authenticationVerifyEmailResendTitle),
      textTime: count,
      action: () {
        ref
            .read(emailVerificationControllerProvider.notifier)
            .reSendVerifyMail();
      },
    );
  }

  Container _buttonActions() {
    return Container(
      margin: const EdgeInsets.only(top: 80, right: 30, left: 30),
      child: Column(
        children: [
          CutomButton(
            backgroundColor: AppColors.egglantColor,
            title: Text(
              Utils.getLocaleMessage(
                  LocaleKeys.authenticationVerifyEmailButtonTitle),
              style: AppTextStyle.whiteBoldS14,
            ),
            onPressed: () {
              ref
                  .read(emailVerificationControllerProvider.notifier)
                  .checkVerifyEmail();
            },
          ),
          const SizedBox(height: 15),
          CutomButton(
            backgroundColor: AppColors.lavenderColor,
            title: Text(
              Utils.getLocaleMessage(LocaleKeys.authenticationBackButtonTitle),
              style: AppTextStyle.whiteBoldS14,
            ),
            onPressed: () {
              context.router.back();
            },
          ),
        ],
      ),
    );
  }

  Widget _emailVerificationTitle(String emailUser) {
    return TitleAndSubTitle(
      title: Utils.getLocaleMessage(LocaleKeys.authenticationVerifyEmailTitle),
      subTitle:
          Utils.getLocaleMessage(LocaleKeys.authenticationVerifyEmailSubTitle),
      subTitle2: emailUser,
    );
  }
}
