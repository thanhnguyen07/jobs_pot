import 'package:flutter/material.dart';
import 'package:jobs_pot/common/app_colors.dart';
import 'package:jobs_pot/common/app_text_styles.dart';
import 'package:jobs_pot/common/widgets/cutom_button.dart';
import 'package:jobs_pot/features/setting/presentation/widgets/modal_confirm_un_link.dart';
import 'package:jobs_pot/features/setting/presentation/widgets/password_form.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/utils/utils.dart';

class ModalChooseVerifyMethod extends StatelessWidget {
  const ModalChooseVerifyMethod({
    Key? key,
  }) : super(key: null);

  @override
  Widget build(BuildContext context) {
    passwordMethodPress() {
      Navigator.pop(context);
      showDialog(
        context: context,
        builder: (context) {
          return _passwordDialog(context);
        },
      );
    }

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
            Container(
              margin: const EdgeInsets.only(left: 25, right: 25),
              child: CustomButton(
                title: Text(
                  Utils.getLocaleMessage(
                    LocaleKeys.authenticationPasswordInputTitle,
                  ),
                  style: AppTextStyle.whiteBoldS14,
                ),
                backgroundColor: AppColors.egglantColor,
                onPressed: passwordMethodPress,
              ),
            ),
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
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  AlertDialog _passwordDialog(BuildContext context) {
    return AlertDialog(
      title: SizedBox(
        width: double.maxFinite,
        child: Text(
          Utils.getLocaleMessage(LocaleKeys.settingAccountPasswordVerify),
          style: AppTextStyle.darkPurpleBoldS26,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PasswordForm(
            affterVerify: () async {
              Navigator.pop(context);
              await showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return const ModalConfirmUnLink();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
