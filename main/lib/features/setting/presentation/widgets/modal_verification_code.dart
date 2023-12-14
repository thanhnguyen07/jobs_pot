import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/common/constant/app_colors.dart';
import 'package:jobs_pot/common/constant/app_text_styles.dart';
import 'package:jobs_pot/common/widgets/cutom_button.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/features/authentication/domain/entities/User/user_entity.dart';
import 'package:jobs_pot/features/authentication/presentation/screens/emailVerification/pin_code.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/utils/utils.dart';

class ModalVerificationCode extends ConsumerStatefulWidget {
  const ModalVerificationCode({
    Key? key,
    required this.onCompleted,
  }) : super(key: null);

  final void Function(String)? onCompleted;

  @override
  ConsumerState<ModalVerificationCode> createState() =>
      _ModalVerificationCodeState();
}

class _ModalVerificationCodeState extends ConsumerState<ModalVerificationCode> {
  bool error = false;

  int countDown = 0;
  Timer? _timerCountDown;

  void _countDownResend() {
    if (countDown != 120) {
      setState(() {
        countDown = 120;
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

  String formatSeconds(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
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
    bool errorPin = ref.watch(emailVerificationControllerProvider);
    UserEntity? userData = ref.read(authControllerProvider);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _subTitle(userData),
        _pinCode(errorPin, context),
        _verifySuggestion(countDown),
        _buttonBack(context),
      ],
    );
  }

  RichText _subTitle(UserEntity? userData) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text:
            '${Utils.getLocaleMessage(LocaleKeys.settingAccountVerifyCodeSubTitle)}: ',
        style: AppTextStyle.textColor1RegularS14,
        children: <TextSpan>[
          TextSpan(
            text: userData?.email ?? '',
            style: AppTextStyle.darkPurpleRegularS14,
          )
        ],
      ),
    );
  }

  Widget _pinCode(bool errorPin, BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      child: PinCode(
        error: errorPin,
        onCompleted: widget.onCompleted,
        clearError: () {
          ref
              .read(emailVerificationControllerProvider.notifier)
              .clearErrorCode();
        },
      ),
    );
  }

  Widget _verifySuggestion(int countDown) {
    action() {
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

    return Column(
      children: [
        Text(
          Utils.getLocaleMessage(
              LocaleKeys.authenticationVerifyEmailSuggestionsResend),
          style: AppTextStyle.textColor1RegularS14,
        ),
        TextButton(
          onPressed: countDown == 0 ? action : null,
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: Utils.getLocaleMessage(
                        LocaleKeys.authenticationVerifyEmailResendTitle),
                    style: AppTextStyle.fireYellowUnderlineRegularS14,
                    children: [
                      TextSpan(
                        text: countDown > 0
                            ? " (${formatSeconds(countDown)})"
                            : '',
                      )
                    ]),
              ],
            ),
          ),
        )
      ],
    );
  }

  Container _buttonBack(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: CustomButton(
        backgroundColor: AppColors.lavenderColor,
        title: Text(
          Utils.getLocaleMessage(LocaleKeys.authenticationBackButtonTitle),
          style: AppTextStyle.whiteBoldS14,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
