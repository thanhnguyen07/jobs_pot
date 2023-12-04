import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  late StreamSubscription firebaseInit;

  Future initLogic(BuildContext context) async {
    firebaseInit =
        FirebaseAuth.instance.authStateChanges().listen((User? user) async {
      if (user == null) {
        goToLogin(context);
        return;
      } else {
        await user.reload();
      }

      bool onboadingStatusRes = await getOnboadingStatus();
      if (!onboadingStatusRes && context.mounted) {
        context.router.replaceNamed(OnboardingScreen.path);
        return;
      }

      String? idUser = await getIdUser();
      if (idUser == null) {
        goToLogin(context.mounted ? context : null);
        return;
      }

      bool getUserProfileRes = await getUserProfile(idUser);
      if (context.mounted) {
        if (getUserProfileRes) {
          context.router.removeLast();

          context.router.replaceAll([const HomeStackRoute()]);
        } else {
          goToLogin(context.mounted ? context : null);
        }
      }
    });
  }

  void goToLogin(BuildContext? context) {
    if (context != null && context.mounted) {
      context.router.replaceNamed(LoginScreen.path);
    }
  }

  Future<String?> getIdUser() async {
    final token = await ref.read(authRepositoryProvider).getToken();
    final idUser = await ref.read(authRepositoryProvider).getIdUser();
    final rememberStatus =
        await ref.read(authRepositoryProvider).getRememberStatus();
    if (token != null && idUser != null && rememberStatus != null) {
      return idUser;
    } else {
      return null;
    }
  }

  Future<bool> getOnboadingStatus() async {
    return await ref.read(authRepositoryProvider).getOnboadingStatus();
  }

  void cancelFirebaseInitListen() {
    firebaseInit.cancel();
  }

  Future<bool> getUserProfile(String idUser) async {
    ref.read(systemControllerProvider.notifier).showLoading();

    return await ref.read(authRepositoryProvider).getUserProfile(idUser).then(
      (res) {
        ref.read(systemControllerProvider.notifier).hideLoading();

        return res.fold(
          (l) {
            return false;
          },
          (r) {
            ref.read(authControllerProvider.notifier).setDataUser(r.results);

            return true;
          },
        );
      },
    );
  }
}
