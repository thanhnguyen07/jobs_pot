import 'dart:async';
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

class SignWithEmailController extends StateNotifier {
  SignWithEmailController(this.ref) : super(null);

  final Ref ref;

  final _signUpForm = FormGroup(
    {
      ValidationKeys.fullName: FormControl<String>(
        value: '',
        validators: [
          Validators.minLength(3),
          Validators.required,
        ],
        touched: true,
      ),
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

  FormGroup getSignUpForm() => _signUpForm;

  String getInputName() {
    return _signUpForm.controls[ValidationKeys.fullName]?.value.toString() ??
        "";
  }

  String getInputEmail() {
    return _signUpForm.controls[ValidationKeys.email]?.value.toString() ?? "";
  }

  void onSignUp(BuildContext context) async {
    ref.read(systemControllerProvider.notifier).showLoading();
    FocusManager.instance.primaryFocus?.unfocus();

    final isValid = _signUpForm.valid;

    if (isValid) {
      final String email = getInputEmail();

      ref
          .read(emailVerificationControllerProvider.notifier)
          .setCurrentEmail(email);

      await signUpWithEmail(context);
    } else {
      _signUpForm.controls.forEach((key, value) {
        if (value.invalid) {
          value.setErrors({
            ValidationKeys.required: LocaleKeys.authenticationInputRequired
          });
        }
      });
    }
    ref.read(systemControllerProvider.notifier).hideLoading();
  }

  Future signUpWithEmail(BuildContext context) async {
    final email =
        _signUpForm.controls[ValidationKeys.email]?.value.toString() ?? "";

    final password =
        _signUpForm.controls[ValidationKeys.password]?.value.toString() ?? "";

    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then(
        (value) async {
          await _createUserOnServer(context);
        },
      );
    } on FirebaseAuthException catch (e) {
      ref.read(systemControllerProvider.notifier).handlerFirebaseError(e.code);
    }
  }

  Future _createUserOnServer(BuildContext context) async {
    final fullName = ref.read(signUpWithEmailProvider.notifier).getInputName();
    final User? user =
        ref.read(authControllerProvider.notifier).getCurrentFirebaseUser();

    final String? tokenFirebase = await user?.getIdToken();

    if (tokenFirebase != null) {
      final resCreateUserOnServer = await ref
          .read(authRepositoryProvider)
          .signUpWithEmail(fullName, tokenFirebase);

      resCreateUserOnServer.fold((l) {
        ref.read(systemControllerProvider.notifier).showToastGeneralError();
      }, (r) async {
        ref.read(authControllerProvider.notifier).setDataUser(r.results);
        if (r.results.emailVerified) {
          ref
              .read(authRepositoryProvider)
              .saveBothToken(r.token, r.refreshToken)
              .then((value) {
            context.router.replaceAll([const HomeStackRoute()]);
          });
        } else {
          await ref
              .read(emailVerificationControllerProvider.notifier)
              .sendVerifyMail()
              .then(
            (value) {
              context.router.pushNamed(EmailVerificationScreen.path);
            },
          );
        }
      });
    }
  }
}
