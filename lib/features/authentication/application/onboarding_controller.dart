import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/features/authentication/presentation/screens/login/login_screen.dart';

class OnboardingController extends StateNotifier {
  OnboardingController(this.ref) : super(null);
  final Ref ref;

  void goLogin(BuildContext context) async {
    ref.read(authRepositoryProvider).saveOnboadingStatus();
    context.router.pushNamed(LoginScreen.path);
  }
}
