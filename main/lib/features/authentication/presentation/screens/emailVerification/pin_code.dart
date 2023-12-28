import 'package:flutter/material.dart';
import 'package:jobs_pot/common/constant/app_colors.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/utils/utils.dart';
import 'package:pinput/pinput.dart';

class PinCode extends StatelessWidget {
  const PinCode({
    key,
    required this.error,
    required this.onCompleted,
    required this.clearError,
  }) : super(key: null);

  final bool error;
  final void Function(String p1)? onCompleted;
  final void Function() clearError;

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 45,
      height: 45,
      textStyle: const TextStyle(
          fontSize: 20,
          color: AppColors.textColor1,
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.purpleColor),
        borderRadius: BorderRadius.circular(8),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Theme.of(context).colorScheme.onBackground),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: AppColors.purpleColor,
      ),
    );
    final errorPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: AppColors.amberColor,
      ),
    );
    Widget errorBuilder(String? errorText, String pin) {
      return Container(
        margin: const EdgeInsets.only(top: 10),
        child: Text(
          errorText ?? "",
          style: const TextStyle(color: AppColors.candyAppleRed),
        ),
      );
    }

    return Pinput(
      length: 6,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      errorPinTheme: errorPinTheme,
      forceErrorState: error,
      errorBuilder: errorBuilder,
      errorText:
          Utils.getLocaleMessage(LocaleKeys.authenticationVerifyCodeError),
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
      onCompleted: onCompleted,
      onTap: clearError,
    );
  }
}
