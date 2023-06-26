import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/features/authentication/presentation/screens/login/login_screen.dart';
import 'package:jobs_pot/features/authentication/presentation/screens/onboarding_screen.dart';
import 'package:jobs_pot/features/home/presentation/screens/home_screen.dart';
import 'package:jobs_pot/system/system_providers.dart';

class SplashController extends StateNotifier<bool> {
  SplashController(this.ref) : super(false);

  final Ref ref;

  Future initLogic(BuildContext context) async {
    Timer(
      const Duration(seconds: 2),
      () async {
        ref.read(authRepositoryProvider).getOnboadingStatus().then(
          (onboadingStatus) {
            if (onboadingStatus != null) {
              ref.read(authRepositoryProvider).getToken().then((token) {
                if (token != null) {
                  getUserProfile(context);
                } else {
                  context.router.replaceNamed(LoginScreen.path);
                }
              });
            } else {
              context.router.replaceNamed(OnboardingScreen.path);
            }
          },
        );
      },
    );
  }

  Future getUserProfile(BuildContext context) async {
    EasyLoading.show();

    final resGetUserProfile =
        await ref.read(authRepositoryProvider).getUserProfile();

    resGetUserProfile.fold(
      (l) {
        ref.read(systemControllerProvider.notifier).showToastMessage(l.error);

        context.router.replaceNamed(LoginScreen.path);
      },
      (r) {
        ref.read(systemControllerProvider.notifier).showToastMessage(r.msg);

        ref
            .read(authRepositoryProvider)
            .saveBothToken(r.token, r.refreshToken)
            .then((value) {
          context.router.removeLast();
          context.router.pushNamed(HomeScreen.path);
        });
      },
    );

    EasyLoading.dismiss();
  }
}
