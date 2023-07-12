import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/system/system_providers.dart';

class EmailVerificationController extends StateNotifier<int> {
  EmailVerificationController(this.ref) : super(0);
  final Ref ref;
  Timer? _timerCountDown;
  late String _cureentEmail;

  @override
  void dispose() {
    _cancelTimer();
    super.dispose();
  }

  void setCurrentEmail(String email) {
    _cureentEmail = email;
  }

  String getCurrentEmail() {
    return _cureentEmail;
  }

  Future sendVerifyMail() async {
    _cancelTimer();

    ref.read(systemControllerProvider.notifier).showLoading();

    final User? user =
        ref.read(authControllerProvider.notifier).getCurrentFirebaseUser();

    if (user != null) {
      await user.sendEmailVerification();
      _countDownResend();
    }
    ref.read(systemControllerProvider.notifier).hideLoading();
  }

  void reSendVerifyMail() {
    if (state == 0) {
      sendVerifyMail();
    }
  }

  void checkVerifyEmail() async {
    ref.read(systemControllerProvider.notifier).showLoading();

    await _reloadUser();

    final User? currenUserNew =
        ref.read(authControllerProvider.notifier).getCurrentFirebaseUser();

    if (currenUserNew != null) {
      if (currenUserNew.emailVerified) {
        final User? user =
            ref.read(authControllerProvider.notifier).getCurrentFirebaseUser();

        final String? idToken = await user?.getIdToken();

        if (idToken != null) {
          await ref.read(authRepositoryProvider).saveToken(idToken).then(
            (value) async {
              _createUserOnServer();
            },
          );
        } else {
          ref.read(systemControllerProvider.notifier).showToastGeneralError();
        }
      } else {
        ref
            .read(systemControllerProvider.notifier)
            .showToastMessageWithLocaleKeys(
              LocaleKeys.authenticationVerifyEmailError,
            );
      }
    }
    ref.read(systemControllerProvider.notifier).hideLoading();
  }

  Future _reloadUser() async {
    final User? currenUser =
        ref.read(authControllerProvider.notifier).getCurrentFirebaseUser();

    if (currenUser != null) {
      return await currenUser.reload();
    }
    return null;
  }

  void _cancelTimer() {
    _timerCountDown?.cancel();
    state = 0;
  }

  void _createUserOnServer() async {
    _cancelTimer();

    ref.read(systemControllerProvider.notifier).showLoading();

    final fullName =
        ref.read(signUpWithEmailControllerProvider.notifier).getInputName();

    final resSignUp =
        await ref.read(authRepositoryProvider).signUpWithEmail(fullName);

    resSignUp.fold((l) {}, (r) {
      ref.read(authControllerProvider.notifier).setDataUser(r.results);

      final User? user =
          ref.read(authControllerProvider.notifier).getCurrentFirebaseUser();

      debugPrint('$user');
    });
    ref.read(systemControllerProvider.notifier).hideLoading();
  }

  void _countDownResend() {
    if (state != 60) {
      state = 60;
    }
    _timerCountDown = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (state == 0) {
        _timerCountDown?.cancel();
      } else {
        state = --state;
      }
    });
  }
}
