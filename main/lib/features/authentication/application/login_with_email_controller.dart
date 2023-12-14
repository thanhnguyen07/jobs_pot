import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/common/constant/app_keys.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/features/authentication/presentation/screens/emailVerification/email_verification_screen.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/routes/route_config.gr.dart';
import 'package:jobs_pot/utils/utils.dart';
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
    Utils.showLoading();

    FocusManager.instance.primaryFocus?.unfocus();

    final isValid = _loginForm.valid;

    if (isValid) {
      final email = _getEmail();

      ref
          .read(emailVerificationControllerProvider.notifier)
          .setCurrentEmail(email);

      await signInWithEmail(context);
    } else {
      _loginForm.controls.forEach((key, value) {
        if (value.invalid) {
          value.setErrors({
            ValidationKeys.required: LocaleKeys.authenticationInputRequired
          });
        }
      });
    }
    Utils.hideLoading();
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
        final tokenFirebase = await credential.user?.getIdToken();

        if (tokenFirebase != null) {
          final signInWithFirebaseRes = await ref
              .read(authRepositoryProvider)
              .signInWithFirebase(tokenFirebase);

          await signInWithFirebaseRes.fold(
            (l) {},
            (r) async {
              ref.read(authControllerProvider.notifier).setDataUser(r.results);
              await Utils.localStorage.save
                  .dataUser(r.token, r.refreshToken, r.results.id)
                  .then(
                (value) async {
                  if (r.results.emailVerified) {
                    context.router.replaceAll([const HomeRoute()]);
                  } else {
                    final sendVerificationCodeRes = await ref
                        .read(authRepositoryProvider)
                        .sendVerificationCode(email);

                    sendVerificationCodeRes.fold(
                      (l) {},
                      (r) {
                        ref.read(emailVerificationControllerProvider.notifier);
                        Utils.showToastMessage(r.msg);
                        context.router.pushNamed(EmailVerificationScreen.path);
                      },
                    );
                  }
                },
              );
            },
          );
        }
      }
    } on FirebaseAuthException catch (e) {
      Utils.handlerFirebaseError(e.code);
    }
  }
}
