import 'package:flutter/material.dart';
import 'package:jobs_pot/common/constant/app_icons.dart';
import 'package:jobs_pot/common/widgets/social_icon.dart';

class SocialLoginButtons extends StatelessWidget {
  const SocialLoginButtons({
    super.key,
    required this.googleLogin,
    required this.facebookLogin,
    required this.appleLogin,
  });

  final void Function() googleLogin;
  final void Function() facebookLogin;
  final void Function() appleLogin;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialIcon(icon: AppPngIcons.googleLogo, onPress: googleLogin),
        SocialIcon(icon: AppPngIcons.facebookLogo, onPress: facebookLogin),
        SocialIcon(icon: AppPngIcons.appleLogo, onPress: appleLogin),
      ],
    );
  }
}
