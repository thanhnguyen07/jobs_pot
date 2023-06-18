import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobs_pot/common/app_colors.dart';
import 'package:jobs_pot/common/app_icons.dart';
import 'package:jobs_pot/common/app_text_styles.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/utils/utils.dart';

class RememberAndForgot extends StatelessWidget {
  const RememberAndForgot(
      {Key? key, required this.state, required this.setState})
      : super(key: key);

  final bool state;
  final void Function()? setState;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _remember(),
        _forgot(),
      ],
    );
  }

  TextButton _forgot() {
    return TextButton(
      child: Text(
        Utils.getLocaleMessage(LocaleKeys.authenticationForgotPassword),
        style: AppTextStyle.darkPurpleRegularS12,
      ),
      onPressed: () {},
    );
  }

  Row _remember() {
    return Row(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
          child: Container(
            width: 24,
            height: 24,
            color: AppColors.lavenderColor,
            child: TextButton(
              onPressed: setState,
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  state
                      ? SvgPicture.asset(
                          AppIcons.checked,
                          width: 10,
                          height: 10,
                          colorFilter: const ColorFilter.mode(
                              AppColors.darkPurpleColor, BlendMode.srcIn),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Text(
          Utils.getLocaleMessage(LocaleKeys.authenticationRememberMe),
          style: AppTextStyle.textlavenderGraS12,
        )
      ],
    );
  }
}
