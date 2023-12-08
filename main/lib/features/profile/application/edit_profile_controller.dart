import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/common/app_keys.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/features/authentication/domain/entities/User/user_entity.dart';
import 'package:jobs_pot/features/authentication/presentation/screens/emailVerification/email_verification_screen.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/routes/route_config.gr.dart';
import 'package:jobs_pot/utils/utils.dart';
import 'package:jobs_pot/utils/validation_schema.dart';
import 'package:reactive_forms/reactive_forms.dart';

class EditProfileController extends StateNotifier {
  EditProfileController(this.ref) : super(null);

  final Ref ref;

  final _editProfileForm = FormGroup(
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

  FormGroup getEditProfileForm() => _editProfileForm;

  String getInputName() {
    return _editProfileForm.controls[ValidationKeys.fullName]?.value
            .toString() ??
        "";
  }

  String getInputEmail() {
    return _editProfileForm.controls[ValidationKeys.email]?.value.toString() ??
        "";
  }

  void onSignUp(BuildContext context) async {
    Utils.showLoading();
    FocusManager.instance.primaryFocus?.unfocus();

    final isValid = _editProfileForm.valid;

    if (isValid) {
      final String email = getInputEmail();

      ref
          .read(emailVerificationControllerProvider.notifier)
          .setCurrentEmail(email);

      await signUpWithEmail(context);
    } else {
      _editProfileForm.controls.forEach((key, value) {
        if (value.invalid) {
          value.setErrors({
            ValidationKeys.required: LocaleKeys.authenticationInputRequired
          });
        }
      });
    }
    Utils.hideLoading();
  }

  Future signUpWithEmail(BuildContext context) async {
    final email =
        _editProfileForm.controls[ValidationKeys.email]?.value.toString() ?? "";

    final password =
        _editProfileForm.controls[ValidationKeys.password]?.value.toString() ??
            "";

    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then(
        (value) async {
          await _createUserOnServer(context, email);
        },
      );
    } on FirebaseAuthException catch (e) {
      Utils.handlerFirebaseError(e.code);
    }
  }

  Future _createUserOnServer(BuildContext context, String email) async {
    final fullName = ref.read(signUpWithEmailProvider.notifier).getInputName();
    final User? user =
        ref.read(authControllerProvider.notifier).getCurrentFirebaseUser();

    final String? tokenFirebase = await user?.getIdToken();

    if (tokenFirebase != null) {
      final resCreateUserOnServer = await ref
          .read(authRepositoryProvider)
          .signUpWithEmail(fullName, tokenFirebase);

      resCreateUserOnServer.fold((l) {
        Utils.showToastGeneralError();
      }, (r) async {
        ref.read(authControllerProvider.notifier).setDataUser(r.results);
        await Utils.localStorage.save
            .dataUser(r.token, r.refreshToken, r.results.id);
        if (r.results.emailVerified) {
          if (context.mounted) {
            context.router.replaceAll([const HomeStackRoute()]);
          }
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
      });
    }
  }
}
