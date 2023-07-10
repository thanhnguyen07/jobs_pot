import 'dart:async';
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

class SignUpWithEmailController extends StateNotifier {
  SignUpWithEmailController(this.ref) : super(null);
  final Ref ref;

  final signUpForm = FormGroup(
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

  void onSignUp(BuildContext context) async {
    FocusManager.instance.primaryFocus?.unfocus();
    final isValid = signUpForm.valid;
    if (isValid) {
      signUpWithEmail(context);
    } else {
      signUpForm.controls.forEach((key, value) {
        if (value.invalid) {
          value.setErrors({
            ValidationKeys.required: LocaleKeys.authenticationInputRequired
          });
        }
      });
    }
  }

  String getInputName() {
    return signUpForm.controls[ValidationKeys.fullName]?.value.toString() ?? "";
  }

  String getInputEmail() {
    return signUpForm.controls[ValidationKeys.email]?.value.toString() ?? "";
  }

  Future signUpWithEmail(BuildContext context) async {
    final email =
        signUpForm.controls[ValidationKeys.email]?.value.toString() ?? "";
    final password =
        signUpForm.controls[ValidationKeys.password]?.value.toString() ?? "";

    final encryptPassword = Utils.encryptPassword(password);

    Utils.showLoading();

    try {
      final userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: encryptPassword,
      );

      final String? idToken = await userCredential.user?.getIdToken();
      if (idToken != null) {
        await ref
            .read(authRepositoryProvider)
            .saveToken(idToken)
            .then((value) async {
          await ref
              .read(emailVerificationControllerProvider.notifier)
              .sendVerifyMail()
              .then((value) {
            context.router.pushNamed(EmailVerificationScreen.path);
          });
        });
      } else {
        ref.read(systemControllerProvider.notifier).showToastGeneralError();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == FirebaseKeys.weakPassword) {
        ref.read(systemControllerProvider.notifier).showToastMessage(
              Utils.getLocaleMessage(LocaleKeys.authenticationSignUpError2),
            );
      } else if (e.code == FirebaseKeys.emailAlreadyInUse) {
        ref.read(systemControllerProvider.notifier).showToastMessage(
              Utils.getLocaleMessage(LocaleKeys.authenticationSignUpError),
            );
      }
    } catch (e) {
      ref.read(systemControllerProvider.notifier).showToastGeneralError();
    }

    Utils.hideLoading();
  }
}
