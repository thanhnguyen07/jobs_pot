import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobs_pot/common/app_colors.dart';
import 'package:jobs_pot/common/app_images.dart';
import 'package:jobs_pot/common/app_text_styles.dart';
import 'package:jobs_pot/common/widgets/cutom_button.dart';
import 'package:jobs_pot/common/widgets/un_focus_keyboard.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/features/authentication/presentation/screens/login/login_screen.dart';
import 'package:jobs_pot/features/authentication/presentation/widgets/suggestions_text.dart';
import 'package:jobs_pot/features/authentication/presentation/widgets/title_and_sub_title.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/utils/utils.dart';

@RoutePage()
class CheckMailScreen extends ConsumerStatefulWidget {
  const CheckMailScreen({Key? key}) : super(key: key);

  static const String path = '/CheckMailScreen';

  @override
  ConsumerState<CheckMailScreen> createState() => _CheckMailScreenState();
}

class _CheckMailScreenState extends ConsumerState<CheckMailScreen> {
  void _backToLogin() {
    context.router.removeLast();

    context.router.pushNamed(LoginScreen.path);
  }

  @override
  Widget build(BuildContext context) {
    final emailUser = ref
        .read(emailVerificationControllerProvider.notifier)
        .getCurrentEmail();

    final count = ref.watch(forgotPasswordControllerProvider);

    return UnFocusKeyboard(
      context: context,
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                _checkEmailTitle(emailUser),
                SvgPicture.asset(AppImages.verifiedMail),
                _buttonActions(),
                const SizedBox(height: 15),
                _checkMailSuggestion(count),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _checkEmailTitle(String emailUser) {
    return TitleAndSubTitle(
      title: Utils.getLocaleMessage(LocaleKeys.authenticationVerifyEmailTitle),
      subTitle:
          Utils.getLocaleMessage(LocaleKeys.authenticationVerifyEmailSubTitle),
      subTitle2: emailUser,
    );
  }

  Container _buttonActions() {
    return Container(
      margin: const EdgeInsets.only(top: 80),
      child: CutomButton(
        backgroundColor: AppColors.lavenderColor,
        title: Text(
          Utils.getLocaleMessage(LocaleKeys.authenticationButtonBackToLogin),
          style: AppTextStyle.whiteBoldS14,
        ),
        onPressed: _backToLogin,
      ),
    );
  }

  SuggestionsText _checkMailSuggestion(int count) {
    return SuggestionsText(
      textSuggestions: Utils.getLocaleMessage(
          LocaleKeys.authenticationVerifyEmailSuggestionsResend),
      textAction: Utils.getLocaleMessage(
          LocaleKeys.authenticationVerifyEmailResendTitle),
      textTime: count,
      action: () {
        ref
            .read(forgotPasswordControllerProvider.notifier)
            .reSendRestPasswordMail();
      },
    );
  }
}
