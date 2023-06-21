import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/features/authentication/presentation/screens/login/login_screen.dart';
import 'package:jobs_pot/features/authentication/presentation/screens/onboarding_screen.dart';

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
              context.router.replaceNamed(LoginScreen.path);
            } else {
              context.router.replaceNamed(OnboardingScreen.path);
            }
          },
        );
      },
    );
  }
}
