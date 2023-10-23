import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/common/app_colors.dart';
import 'package:jobs_pot/common/app_images.dart';
import 'package:jobs_pot/common/widgets/social_icon.dart';
import 'package:jobs_pot/common/widgets/un_focus_keyboard.dart';
import 'package:jobs_pot/features/authentication/presentation/widgets/suggestions_text.dart';
import 'package:jobs_pot/features/authentication/presentation/widgets/change_language.dart';
import 'package:jobs_pot/features/authentication/presentation/widgets/title_and_sub_title.dart';
import 'package:jobs_pot/features/authentication/presentation/widgets/login_with_google.dart';
import 'package:jobs_pot/features/authentication/presentation/screens/signUp/sign_up_form.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/system/system_providers.dart';
import 'package:jobs_pot/utils/utils.dart';

@RoutePage()
class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

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

    return UnFocusKeyboard(
      context: context,
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: _bodyWidget(context),
          ),
        ),
      ),
    );
  }

  Column _bodyWidget(BuildContext context) {
    return Column(
      children: [
        _signUpTitle(),
        const SignUpForm(),
        signUpWith(),
        const SizedBox(
          height: 10,
        ),
        socialSignUpButtons(),
        // const LoginWithGoogle(),
        const SizedBox(
          height: 40,
        ),
        _loginSuggestion(),
        const ChangeLanguage(),
      ],
    );
  }

  Widget socialSignUpButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialIcon(icon: AppImages.googleLogo, onPress: () {}),
        SocialIcon(icon: AppImages.facebookLogo, onPress: () {}),
        SocialIcon(icon: AppImages.appleLogo, onPress: () {}),
      ],
    );
  }

  Widget signUpWith() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: 1,
              color: AppColors.egglantColor,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
                Utils.getLocaleMessage(LocaleKeys.authenticationSignUpWith)),
          ),
          Expanded(
            flex: 1,
            child: Container(
              height: 1,
              color: AppColors.egglantColor,
            ),
          ),
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
