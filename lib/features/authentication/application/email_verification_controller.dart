import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/system/system_providers.dart';
import 'package:jobs_pot/utils/utils.dart';

class EmailVerificationController extends StateNotifier<int> {
  EmailVerificationController(this.ref) : super(0);
  final Ref ref;
  Timer? _timerCountDown;

  @override
  void dispose() {
    _cancelTimer();
    super.dispose();
  }

  Future sendVerifyMail() async {
    Utils.showLoading();
    final User? user = _getCurrentUser();
    if (user != null) {
      await user.sendEmailVerification();
      _countDownResend();
    }
    Utils.hideLoading();
  }

  void reSendVerifyMail() {
    if (state == 0) {
      sendVerifyMail();
    }
  }

  void checkVerifyEmail() async {
    Utils.showLoading();
    await _reloadUser();

    final User? currenUserNew = _getCurrentUser();
    if (currenUserNew != null) {
      if (currenUserNew.emailVerified) {
        _cancelTimer();
      } else {
        ref.read(systemControllerProvider.notifier).showToastMessage(
              Utils.getLocaleMessage(LocaleKeys.authenticationVerifyEmailError),
            );
      }
    }
    Utils.hideLoading();
  }

  User? _getCurrentUser() {
    final User? currenUser = FirebaseAuth.instance.currentUser;
    if (currenUser != null) {
      return currenUser;
    } else {
      _cancelTimer();
      ref.read(systemControllerProvider.notifier).showToastGeneralError();
      return null;
    }
  }

  Future _reloadUser() async {
    final User? currenUser = _getCurrentUser();
    if (currenUser != null) {
      return await currenUser.reload();
    }
    return null;
  }

  void _cancelTimer() {
    _timerCountDown?.cancel();
    state = 0;
  }

  void _createUserOnServer() {
    _cancelTimer();
    Utils.showLoading();
    Utils.hideLoading();

    // final resSignUp =
    //     await ref.read(authRepositoryProvider).signUpWithEmail(fullName);

    // resSignUp.fold((l) {
    //   ref.read(systemControllerProvider.notifier).showToastMessage(l.error);
    // }, (r) {
    //   ref.read(systemControllerProvider.notifier).showToastMessage(r.msg);

    // final User? user = FirebaseAuth.instance.currentUser;
    // print(user);

    //   // context.router.removeLast();

    // });
  }

  void _countDownResend() {
    state = 60;
    _timerCountDown = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (state == 0) {
        _timerCountDown?.cancel();
      } else {
        state = --state;
      }
    });
  }
}
