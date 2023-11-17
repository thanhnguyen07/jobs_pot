import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/features/authentication/presentation/screens/login/login_screen.dart';
import 'package:jobs_pot/features/authentication/presentation/screens/onboarding_screen.dart';
import 'package:jobs_pot/routes/route_config.gr.dart';
import 'package:jobs_pot/system/system_providers.dart';

class SplashController extends StateNotifier<bool> {
  SplashController(this.ref) : super(false);

  final Ref ref;

  Future initLogic(BuildContext context) async {
    Timer(
      const Duration(seconds: 2),
      () async {
        ref.read(authRepositoryProvider).getOnboadingStatus().then(
          (onboadingStatus) async {
            if (onboadingStatus != null) {
              final token = await ref.read(authRepositoryProvider).getToken();
              final idUser = await ref.read(authRepositoryProvider).getIdUser();
              final rememberStatus =
                  await ref.read(authRepositoryProvider).getRememberStatus();

              if (token != null && idUser != null && rememberStatus != null) {
                if (context.mounted) {
                  await getUserProfile(context, idUser);
                }
              } else {
                if (context.mounted) {
                  context.router.replaceNamed(LoginScreen.path);
                }
              }
            } else {
              context.router.replaceNamed(OnboardingScreen.path);
            }
          },
        );
      },
    );
  }

  Future getUserProfile(BuildContext context, String idUser) async {
    ref.read(systemControllerProvider.notifier).showLoading();

    await ref.read(authRepositoryProvider).getUserProfile(idUser).then(
      (res) {
        res.fold(
          (l) {
            context.router.replaceNamed(LoginScreen.path);
          },
          (r) {
            ref.read(authControllerProvider.notifier).setDataUser(r.results);

            context.router.removeLast();

            context.router.replaceAll([const HomeStackRoute()]);
          },
        );
      },
    );
    ref.read(systemControllerProvider.notifier).hideLoading();
  }
}
