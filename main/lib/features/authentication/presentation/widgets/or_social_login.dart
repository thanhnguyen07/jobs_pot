import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/common/widgets/social_login_button.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:i18n/i18n.dart';
import 'package:jobs_pot/utils/utils.dart';

class OrSocialLogin extends ConsumerStatefulWidget {
  const OrSocialLogin({Key? key}) : super(key: null);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OrSocialLoginState();
}

class _OrSocialLoginState extends ConsumerState<OrSocialLogin> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        signUpWith(context),
        const SizedBox(
          height: 10,
        ),
        SocialLoginButtons(
          googleLogin: () {
            ref
                .read(loginWithGoogleControllerProvider.notifier)
                .signInWithGoogle(context);
          },
          facebookLogin: () {
            ref
                .read(loginWithFacebookControllerProvider.notifier)
                .signInWithFacebook(context);
          },
          appleLogin: () {
            Utils.showToastMessageWithLocaleKeys(
              LocaleKeys.authenticationComingSoon,
            );
          },
        ),
      ],
    );
  }

  Widget signUpWith(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: 1,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
                Utils.getLocaleMessage(LocaleKeys.authenticationSignInWith)),
          ),
          Expanded(
            flex: 1,
            child: Container(
              height: 1,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
