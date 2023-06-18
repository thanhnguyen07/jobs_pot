import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/features/authentication/presentation/screens/signUp/sign_up_screen.dart';
import 'package:jobs_pot/features/authentication/presentation/widgets/change_language.dart';
import 'package:jobs_pot/features/authentication/presentation/widgets/suggestions_text.dart';
import 'package:jobs_pot/features/authentication/presentation/widgets/title_and_sub_title.dart';
import 'package:jobs_pot/features/authentication/presentation/screens/login/login_form.dart';
import 'package:jobs_pot/features/authentication/presentation/widgets/login_with_google.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/system/system_providers.dart';
import 'package:jobs_pot/utils/utils.dart';

@RoutePage()
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const String path = "/LoginScreen";

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  void _goSignUp() {
    context.router.pushNamed(SignUpScreen.path);
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(languageControllerProvider);

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                _loginTitle(),
                const LoginForm(),
                const LoginWithGoogle(),
                const SizedBox(
                  height: 15,
                ),
                _signUpSuggestion(),
                const ChangeLanguage(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _loginTitle() {
    return TitleAndSubTitle(
      title: '${Utils.getLocaleMessage(LocaleKeys.authenticationLoginTitle)}\n',
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
