import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/features/authentication/presentation/screens/login/login_screen.dart';
import 'package:jobs_pot/utils/utils.dart';

class OnboardingController extends StateNotifier {
  OnboardingController(this.ref) : super(null);
  final Ref ref;

  void goLogin(BuildContext context) async {
    Utils.localStorage.save.onboadingStatus();

    context.router.pushNamed(LoginScreen.path);
  }
}
