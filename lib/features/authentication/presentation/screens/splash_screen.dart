import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobs_pot/common/app_colors.dart';
import 'package:jobs_pot/common/app_icons.dart';
import 'package:jobs_pot/common/app_text_styles.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/utils/utils.dart';

@RoutePage()
class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: null);

  static const String path = "/SplashScreen";

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
  void deactivate() {
    ref.read(splashControllerProvider.notifier).cancelFirebaseInitListen();
    super.deactivate();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.egglantColor,
        child: _centerIconAndTitle(),
      ),
    );
  }

  Center _centerIconAndTitle() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppIcons.logo,
          ),
          Text(
            Utils.getLocaleMessage(LocaleKeys.splashTitle),
            style: AppTextStyle.whiteBoldS26,
          )
        ],
      ),
    );
  }
}
