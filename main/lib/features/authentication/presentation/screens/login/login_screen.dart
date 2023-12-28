import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/common/widgets/app_scaffold.dart';
import 'package:jobs_pot/common/widgets/switch_theme.dart';
import 'package:jobs_pot/features/authentication/presentation/screens/signUp/sign_up_screen.dart';
import 'package:jobs_pot/features/authentication/presentation/widgets/change_language.dart';
import 'package:jobs_pot/features/authentication/presentation/widgets/or_social_login.dart';
import 'package:jobs_pot/features/authentication/presentation/widgets/suggestions_text.dart';
import 'package:jobs_pot/features/authentication/presentation/widgets/title_and_sub_title.dart';
import 'package:jobs_pot/features/authentication/presentation/screens/login/login_form.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/system/system_providers.dart';
import 'package:jobs_pot/utils/utils.dart';

@RoutePage()
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: null);

  static const String path = "/LoginScreen";

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  void _goSignUp() {
    context.router.pushNamed(SignUpScreen.path);
  }

  bool positive = false;
  int value = 0;

  @override
  Widget build(BuildContext context) {
    ref.watch(languageControllerProvider);

    return AppScaffold(
      unFocusKeyboard: true,
      scroll: true,
      physicsScroll: const BouncingScrollPhysics(),
      child: _body(),
    );
  }

  Widget _body() {
    return Container(
      margin: EdgeInsets.only(
        left: 30,
        right: 30,
        top: MediaQuery.of(context).padding.top,
      ),
      child: Column(
        children: [
          const SizedBox(height: 30),
          _loginTitle(),
          const LoginForm(),
          const OrSocialLogin(),
          const SizedBox(
            height: 15,
          ),
          _signUpSuggestion(),
          const ChangeLanguage(),
          const SwitchThemeMode(),
        ],
      ),
    );
  }

  Widget _loginTitle() {
    return TitleAndSubTitle(
      title: Utils.getLocaleMessage(LocaleKeys.authenticationLoginTitle),
      subTitle: Utils.getLocaleMessage(LocaleKeys.onboardingSubTitle),
    );
  }

  SuggestionsText _signUpSuggestion() {
    return SuggestionsText(
      textSuggestions:
          Utils.getLocaleMessage(LocaleKeys.authenticationSuggestionsSignUp),
      textAction: Utils.getLocaleMessage(
          LocaleKeys.authenticationSuggestionsActionSignUp),
      action: _goSignUp,
    );
  }
}
