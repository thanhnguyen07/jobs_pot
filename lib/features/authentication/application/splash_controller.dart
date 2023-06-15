import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/features/authentication/presentation/screens/onboarding_screen.dart';

class SplashController extends StateNotifier<bool> {
  SplashController() : super(false);

  Future initLogic(BuildContext context) async {
    Timer(
      const Duration(seconds: 2),
      () async {
        context.router.pushNamed(OnboardingScreen.path);
      },
    );
  }
}
