import 'package:flutter/material.dart';
import 'package:jobs_pot/common/app_images.dart';
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
        SocialIcon(icon: AppImages.googleLogo, onPress: googleLogin),
        SocialIcon(icon: AppImages.facebookLogo, onPress: facebookLogin),
        SocialIcon(icon: AppImages.appleLogo, onPress: appleLogin),
      ],
    );
  }
}
