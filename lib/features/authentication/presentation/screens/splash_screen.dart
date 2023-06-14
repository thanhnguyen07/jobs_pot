import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobs_pot/common/app_colors.dart';
import 'package:jobs_pot/common/app_icons.dart';
import 'package:jobs_pot/common/app_text_styles.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const String route = 'splash';

  @override
  ConsumerState createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();

    ref.read(splashControllerProvider.notifier).initLogic(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.egglantColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AppIcons.logo,
              ),
              const Text(
                LocaleKeys.splashTitle,
                style: AppTextStyle.whiteBoldS26,
              ).tr()
            ],
          ),
        ),
      ),
    );
  }
}
