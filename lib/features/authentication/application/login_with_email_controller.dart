import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/common/app_keys.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/features/authentication/presentation/screens/emailVerification/email_verification_screen.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/routes/route_config.gr.dart';
import 'package:jobs_pot/system/system_providers.dart';
import 'package:jobs_pot/utils/validation_schema.dart';
import 'package:reactive_forms/reactive_forms.dart';

class LoginWithEmailController extends StateNotifier {
  LoginWithEmailController(this.ref) : super(null);
  final Ref ref;

  final _loginForm = FormGroup(
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

  FormGroup getLoginForm() => _loginForm;

  void onLogin(BuildContext context) async {
    ref.read(systemControllerProvider.notifier).showLoading();
    FocusManager.instance.primaryFocus?.unfocus();

    final isValid = _loginForm.valid;

    if (isValid) {
      final email = _getEmail();

      ref
          .read(emailVerificationControllerProvider.notifier)
          .setCurrentEmail(email);

      signInWithEmail(context);
    } else {
      _loginForm.controls.forEach((key, value) {
        if (value.invalid) {
          value.setErrors({
            ValidationKeys.required: LocaleKeys.authenticationInputRequired
          });
        }
      });
    }

    ref.read(systemControllerProvider.notifier).hideLoading();
  }

  String _getEmail() {
    return _loginForm.controls[ValidationKeys.email]?.value.toString() ?? "";
  }

  Future signInWithEmail(BuildContext context) async {
    final email = _getEmail();

    final password =
        _loginForm.controls[ValidationKeys.password]?.value.toString() ?? "";

    try {
      final UserCredential credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      final User? user = credential.user;

      if (user != null) {
        if (user.emailVerified) {
          final tokenFirebase = await credential.user?.getIdToken();

          if (tokenFirebase != null) {
            await ref
                .read(authRepositoryProvider)
                .signInWithFirebase(tokenFirebase)
                .then(
              (res) {
                res.fold(
                  (l) {},
                  (r) {
                    ref
                        .read(authControllerProvider.notifier)
                        .setDataUser(r.results);
                    ref
                        .read(authRepositoryProvider)
                        .saveBothToken(r.token, r.refreshToken)
                        .then((value) {
                      context.router.replaceAll([const HomeStackRoute()]);
                    });
                  },
                );
              },
            );
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
}
