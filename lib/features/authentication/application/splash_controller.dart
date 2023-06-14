import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/features/authentication/presentation/screens/onboarding_screen.dart';

class SplashController extends StateNotifier<bool> {
  SplashController(this._ref) : super(false);

  final Ref _ref;

  Future initLogic(BuildContext context) async {
    Timer(
      const Duration(seconds: 2),
      () async {
        _ref.read(autheControllerProvider).updateAuthState(false);
        context.goNamed(OnboardingScreen.route);
      },
    );
  }
}
