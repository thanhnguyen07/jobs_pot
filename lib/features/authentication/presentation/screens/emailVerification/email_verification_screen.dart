import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobs_pot/common/app_colors.dart';
import 'package:jobs_pot/common/app_images.dart';
import 'package:jobs_pot/common/app_text_styles.dart';
import 'package:jobs_pot/common/widgets/app_scaffold.dart';
import 'package:jobs_pot/common/widgets/cutom_button.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/features/authentication/presentation/screens/emailVerification/pin_code.dart';
import 'package:jobs_pot/features/authentication/presentation/widgets/suggestions_text.dart';
import 'package:jobs_pot/features/authentication/presentation/widgets/title_and_sub_title.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/utils/utils.dart';

@RoutePage()
class EmailVerificationScreen extends ConsumerStatefulWidget {
  const EmailVerificationScreen({Key? key}) : super(key: null);

  static const String path = '/EmailVerificationScreen';

  @override
  ConsumerState<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState
    extends ConsumerState<EmailVerificationScreen> {
  bool error = false;

  int countDown = 0;
  Timer? _timerCountDown;

  void _countDownResend() {
    if (countDown != 60) {
      setState(() {
        countDown = 60;
      });
    }
    _timerCountDown = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (countDown == 0) {
        _timerCountDown?.cancel();
      } else {
        setState(() {
          countDown = --countDown;
        });
      }
    });
  }

  void _cancelTimer() {
    _timerCountDown?.cancel();
    countDown = 0;
  }

  @override
  void initState() {
    ref.read(emailVerificationControllerProvider.notifier).clearErrorCode();
    _countDownResend();
    super.initState();
  }

  @override
  void dispose() {
    _cancelTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final emailUser = ref
        .read(emailVerificationControllerProvider.notifier)
        .getCurrentEmail();

    bool errorPin = ref.watch(emailVerificationControllerProvider);

    return AppScaffold(
      unFocusKeyboard: true,
      scroll: true,
      physicsScroll: const ClampingScrollPhysics(),
      child: _body(emailUser, countDown, errorPin),
    );
  }

  Widget _body(String emailUser, int countDown, bool errorPin) {
    return Column(
      children: [
        _emailVerificationTitle(emailUser),
        SvgPicture.asset(AppImages.sendMail),
        const SizedBox(height: 30),
        PinCode(
          error: errorPin,
          onCompleted: (pin) {
            ref
                .read(emailVerificationControllerProvider.notifier)
                .checkVerifyEmail(context, pin);
          },
          clearError: () {
            ref
                .read(emailVerificationControllerProvider.notifier)
                .clearErrorCode();
          },
        ),
        _buttonActions(),
        const SizedBox(height: 30),
        _verifySuggestion(countDown),
      ],
    );
  }

  SuggestionsText _verifySuggestion(int countDown) {
    return SuggestionsText(
      textSuggestions: Utils.getLocaleMessage(
          LocaleKeys.authenticationVerifyEmailSuggestionsResend),
      textAction: Utils.getLocaleMessage(
          LocaleKeys.authenticationVerifyEmailResendTitle),
      textTime: countDown,
      action: () {
        if (countDown == 0) {
          ref
              .read(emailVerificationControllerProvider.notifier)
              .reSendVerifyMail()
              .then(
            (res) {
              if (res) {
                _countDownResend();
              }
            },
          );
        }
      },
    );
  }

  Container _buttonActions() {
    return Container(
      margin: const EdgeInsets.only(top: 30, right: 30, left: 30),
      child: CustomButton(
        backgroundColor: AppColors.lavenderColor,
        title: Text(
          Utils.getLocaleMessage(LocaleKeys.authenticationBackButtonTitle),
          style: AppTextStyle.whiteBoldS14,
        ),
        onPressed: () {
          context.router.back();
        },
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
