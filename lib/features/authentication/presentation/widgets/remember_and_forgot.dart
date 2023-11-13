import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobs_pot/common/app_colors.dart';
import 'package:jobs_pot/common/app_icons.dart';
import 'package:jobs_pot/common/app_text_styles.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/features/authentication/presentation/screens/forgotPassword/forgot_password_screen.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/system/system_providers.dart';
import 'package:jobs_pot/utils/utils.dart';

class RememberAndForgot extends ConsumerStatefulWidget {
  const RememberAndForgot({Key? key}) : super(key: null);

  @override
  ConsumerState<RememberAndForgot> createState() => _RememberAndForgotState();
}

class _RememberAndForgotState extends ConsumerState<RememberAndForgot> {
  @override
  void initState() {
    super.initState();

    ref.read(rememberLoginController.notifier).initData();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(languageControllerProvider);

    final bool rememberStauts = ref.watch(rememberLoginController);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _remember(rememberStauts),
        _forgot(context),
      ],
    );
  }

  Row _remember(bool rememberStauts) {
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
              onPressed: () {
                ref.read(rememberLoginController.notifier).changeStatus();
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  rememberStauts
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

  TextButton _forgot(BuildContext context) {
    return TextButton(
      child: Text(
        Utils.getLocaleMessage(LocaleKeys.authenticationForgotPassword),
        style: AppTextStyle.darkPurpleRegularS12,
      ),
      onPressed: () {
        context.router.pushNamed(ForgotPasswordScreen.path);
      },
    );
  }
}
