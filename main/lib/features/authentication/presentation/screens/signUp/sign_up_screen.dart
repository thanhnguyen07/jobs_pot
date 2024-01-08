import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/common/widgets/app_scaffold.dart';
import 'package:jobs_pot/features/authentication/presentation/widgets/or_social_login.dart';
import 'package:jobs_pot/features/authentication/presentation/widgets/suggestions_text.dart';
import 'package:jobs_pot/features/authentication/presentation/widgets/change_language.dart';
import 'package:jobs_pot/features/authentication/presentation/widgets/title_and_sub_title.dart';
import 'package:jobs_pot/features/authentication/presentation/screens/signUp/sign_up_form.dart';
import 'package:i18n/i18n.dart';
import 'package:jobs_pot/system/system_providers.dart';
import 'package:jobs_pot/utils/utils.dart';

@RoutePage()
class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({Key? key}) : super(key: null);

  static const String path = "/SignUpScreen";

  @override
  ConsumerState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  void _goLogin() {
    context.router.back();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(languageControllerProvider);

    return AppScaffold(
      unFocusKeyboard: true,
      scroll: true,
      physicsScroll: const ClampingScrollPhysics(),
      child: _bodyWidget(context),
    );
  }

  Widget _bodyWidget(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          _signUpTitle(),
          const SignUpForm(),
          const OrSocialLogin(),
          const SizedBox(
            height: 40,
          ),
          _loginSuggestion(),
          const ChangeLanguage(),
        ],
      ),
    );
  }

  SuggestionsText _loginSuggestion() {
    return SuggestionsText(
      textSuggestions:
          Utils.getLocaleMessage(LocaleKeys.authenticationSuggestionsLogin),
      textAction: Utils.getLocaleMessage(
          LocaleKeys.authenticationSuggestionsActionLogin),
      action: _goLogin,
    );
  }

  Widget _signUpTitle() {
    return TitleAndSubTitle(
      title: Utils.getLocaleMessage(LocaleKeys.authenticationSignUpTitle),
      subTitle: Utils.getLocaleMessage(LocaleKeys.onboardingSubTitle),
    );
  }
}
