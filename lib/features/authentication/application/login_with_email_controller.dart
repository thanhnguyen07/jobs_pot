import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/common/app_keys.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/features/authentication/presentation/screens/emailVerification/email_verification_screen.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/system/system_providers.dart';
import 'package:jobs_pot/utils/utils.dart';
import 'package:jobs_pot/utils/validation_schema.dart';
import 'package:reactive_forms/reactive_forms.dart';

class LoginWithEmailController extends StateNotifier {
  LoginWithEmailController(this.ref) : super(null);
  final Ref ref;

  final loginForm = FormGroup(
    {
      ValidationKeys.email: FormControl<String>(
        value: '',
        validators: [Validators.required, emailValidatorSchema],
        touched: true,
      ),
      ValidationKeys.password: FormControl<String>(
        value: '',
        validators: [
          Validators.required,
          Validators.minLength(3),
          passwordValidatorSchema
        ],
        touched: true,
      ),
    },
  );

  void onLogin(BuildContext context) async {
    FocusManager.instance.primaryFocus?.unfocus();
    final isValid = loginForm.valid;
    if (isValid) {
    final email = _getEmail();
      ref
          .read(emailVerificationControllerProvider.notifier)
          .setCurrentEmail(email);
      signInWithEmail(context);
    } else {
      loginForm.controls.forEach((key, value) {
        if (value.invalid) {
          value.setErrors({
            ValidationKeys.required: LocaleKeys.authenticationInputRequired
          });
        }
      });
    }
  }

  String _getEmail() {
    return loginForm.controls[ValidationKeys.email]?.value.toString() ?? "";
  }

  Future signInWithEmail(BuildContext context) async {
    final email = _getEmail();
    final password =
        loginForm.controls[ValidationKeys.password]?.value.toString() ?? "";

    try {
      final UserCredential credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      final User? user = credential.user;
      if (user != null) {
        if (user.emailVerified) {
          final idToken = await credential.user?.getIdToken();
          if (idToken != null) {
            await ref
                .read(authRepositoryProvider)
                .saveToken(idToken)
                .then((value) {
              _getProfileUser(context);
            });
          }
        } else {
          await ref
              .read(emailVerificationControllerProvider.notifier)
              .sendVerifyMail()
              .then((value) {
            context.router.pushNamed(EmailVerificationScreen.path);
          });
        }
      }
    } on FirebaseAuthException catch (e) {
      ref.read(systemControllerProvider.notifier).handlerFirebaseError(e.code);
    }
  }

  void _getProfileUser(BuildContext context) async {
    Utils.showLoading();

    final resSignUp = await ref.read(authRepositoryProvider).getUserProfile();

    resSignUp.fold(
      (l) {
        ref.read(systemControllerProvider.notifier).showToastMessage(l.error);
      },
      (r) {
        ref.read(systemControllerProvider.notifier).showToastMessage(r.msg);
        // context.router.removeLast();
        // context.router.pushNamed(HomeScreen.path);
      },
    );

    Utils.hideLoading();
  }
}
