import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/common/app_keys.dart';
import 'package:jobs_pot/features/authentication/presentation/screens/forgotPassword/check_mail_screen.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/system/system_providers.dart';
import 'package:jobs_pot/utils/validation_schema.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ForgotPasswordController extends StateNotifier<int> {
  ForgotPasswordController(this.ref) : super(60);
  final Ref ref;
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _cancelCountDown() {
    if (_timer != null) {
      _timer?.cancel();
    }
    state = 0;
  }

  Future<bool> _sendRestPasswordMail() async {
    _cancelCountDown();

    final email = _getEmail();

    ref.read(systemControllerProvider.notifier).showLoading();

    try {
      return await FirebaseAuth.instance
          .sendPasswordResetEmail(email: email)
          .then(
        (value) {
          countDown();

          ref.read(systemControllerProvider.notifier).hideLoading();

          return true;
        },
      );
    } on FirebaseAuthException catch (e) {
      ref.read(systemControllerProvider.notifier).handlerFirebaseError(e.code);
      return false;
    }
  }

  final _forgotPasswordForm = FormGroup(
    {
      ValidationKeys.email: FormControl<String>(
        value: '',
        validators: [Validators.required, emailValidatorSchema],
        touched: true,
      ),
    },
  );

  FormGroup getForm() => _forgotPasswordForm;

  String _getEmail() {
    return _forgotPasswordForm.controls[ValidationKeys.email]?.value
            .toString() ??
        "";
  }

  void reSendRestPasswordMail() async {
    if (state == 0) {
      await _sendRestPasswordMail();
    }
  }

  void countDown() {
    if (state != 60) {
      state = 60;
    }
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        if (state == 0) {
          _cancelCountDown();
        } else {
          state = --state;
        }
      },
    );
  }

  void onResetPassword(BuildContext context) async {
    FocusManager.instance.primaryFocus?.unfocus();

    final isValid = _forgotPasswordForm.valid;

    if (isValid) {
      await _sendRestPasswordMail().then((sendMailResult) {
        if (sendMailResult) {
          context.router.pushNamed(CheckMailScreen.path);
        }
      });
    } else {
      _forgotPasswordForm.controls.forEach((key, value) {
        if (value.invalid) {
          value.setErrors({
            ValidationKeys.required: LocaleKeys.authenticationInputRequired
          });
        }
      });
    }
  }
}
