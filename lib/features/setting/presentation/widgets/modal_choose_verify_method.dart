import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/common/app_colors.dart';
import 'package:jobs_pot/common/app_text_styles.dart';
import 'package:jobs_pot/common/widgets/cutom_button.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/utils/utils.dart';

class ModalChooseVerifyMethod extends ConsumerStatefulWidget {
  const ModalChooseVerifyMethod({
    Key? key,
    required this.verificationCodeMethodPress,
    this.linkedPassword = false,
    this.passwordMethodPress,
  }) : super(key: null);

  final bool linkedPassword;
  final void Function()? passwordMethodPress;
  final void Function()? verificationCodeMethodPress;

  @override
  ConsumerState<ModalChooseVerifyMethod> createState() =>
      _ModalChooseVerifyMethodState();
}

class _ModalChooseVerifyMethodState
    extends ConsumerState<ModalChooseVerifyMethod> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 270,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(height: 5),
            Text(
              Utils.getLocaleMessage(
                  LocaleKeys.settingAccountChooseAuthTypeUnLinkTitle),
              style: AppTextStyle.darkPurpleBoldS20,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 5),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                Utils.getLocaleMessage(
                    LocaleKeys.settingAccountChooseAuthTypeUnLinkSubTitle),
                style: AppTextStyle.darkPurpleRegularS14,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),
            widget.linkedPassword
                ? Container(
                    margin: const EdgeInsets.only(left: 25, right: 25),
                    child: CustomButton(
                      title: Text(
                        Utils.getLocaleMessage(
                          LocaleKeys.authenticationPasswordInputTitle,
                        ),
                        style: AppTextStyle.whiteBoldS14,
                      ),
                      backgroundColor: AppColors.egglantColor,
                      onPressed: widget.passwordMethodPress,
                    ),
                  )
                : const SizedBox(),
            Container(
              margin: const EdgeInsets.only(
                  left: 25, right: 25, top: 10, bottom: 20),
              child: CustomButton(
                title: Text(
                  Utils.getLocaleMessage(
                    LocaleKeys.settingAccountChangeVerificationCode,
                  ),
                  style: AppTextStyle.whiteBoldS14,
                ),
                backgroundColor: AppColors.egglantColor,
                onPressed: widget.verificationCodeMethodPress,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
