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
import 'package:jobs_pot/features/authentication/presentation/screens/login/login_screen.dart';
import 'package:jobs_pot/features/authentication/presentation/widgets/suggestions_text.dart';
import 'package:jobs_pot/features/authentication/presentation/widgets/title_and_sub_title.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/utils/utils.dart';

@RoutePage()
class CheckMailScreen extends ConsumerStatefulWidget {
  const CheckMailScreen({Key? key}) : super(key: null);

  static const String path = '/CheckMailScreen';

  @override
  ConsumerState<CheckMailScreen> createState() => _CheckMailScreenState();
}

class _CheckMailScreenState extends ConsumerState<CheckMailScreen> {
  void _backToLogin() {
    context.router.back();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: _body(),
    );
  }

  Column _body() {
    return Column(
      children: [
        _checkEmailTitle(),
        SvgPicture.asset(AppImages.verifiedMail),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(children: [
            _buttonActions(),
            const SizedBox(height: 15),
            _checkMailSuggestion(),
          ]),
        )
      ],
    );
  }

  Widget _checkEmailTitle() {
    final emailUser = ref
        .read(emailVerificationControllerProvider.notifier)
        .getCurrentEmail();

    return TitleAndSubTitle(
      title: Utils.getLocaleMessage(LocaleKeys.authenticationCheckMailTitle),
      subTitle:
          Utils.getLocaleMessage(LocaleKeys.authenticationCheckMailSubTitle),
      subTitle2: emailUser,
    );
  }

  Container _buttonActions() {
    return Container(
      margin: const EdgeInsets.only(top: 80),
      child: CustomButton(
        backgroundColor: AppColors.fireYellowColor,
        title: Text(
          Utils.getLocaleMessage(LocaleKeys.authenticationBackButtonTitle),
          style: AppTextStyle.whiteBoldS14,
        ),
        onPressed: _backToLogin,
      ),
    );
  }

  SuggestionsText _checkMailSuggestion() {
    final count = ref.watch(forgotPasswordControllerProvider);

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
