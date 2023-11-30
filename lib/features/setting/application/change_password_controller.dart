import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/common/app_keys.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/features/authentication/domain/entities/user_entity.dart';
import 'package:jobs_pot/features/authentication/presentation/screens/emailVerification/email_verification_screen.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/routes/route_config.gr.dart';
import 'package:jobs_pot/system/system_providers.dart';
import 'package:jobs_pot/utils/utils.dart';
import 'package:jobs_pot/utils/validation_schema.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ChangePasswordController extends StateNotifier {
  ChangePasswordController(this.ref) : super(null);

  final Ref ref;

  final _changePasswordForm = FormGroup({
    ValidationKeys.oldPassword: FormControl<String>(
      value: '',
      validators: [
        Validators.required,
      ],
      touched: true,
    ),
    ValidationKeys.newPassword: FormControl<String>(
      value: '',
      validators: [
        Validators.required,
        Validators.minLength(3),
        passwordValidatorSchema
      ],
      touched: true,
    ),
    ValidationKeys.confirmNewPassword: FormControl<String>(
      value: '',
      validators: [
        Validators.required,
        Validators.minLength(3),
        passwordValidatorSchema
      ],
      touched: true,
    ),
  }, validators: [
    Validators.mustMatch(
      ValidationKeys.newPassword,
      ValidationKeys.confirmNewPassword,
      markAsDirty: false,
    ),
    DifferentValidator(
      controlName: ValidationKeys.oldPassword,
      differentControlName: ValidationKeys.newPassword,
    )
  ]);

  FormGroup getChangePasswordForm() => _changePasswordForm;

  String getInputName() {
    return _changePasswordForm.controls[ValidationKeys.fullName]?.value
            .toString() ??
        "";
  }

  String getOldPassword() {
    return _changePasswordForm.controls[ValidationKeys.oldPassword]?.value
            .toString() ??
        "";
  }

  String getNewPassword() {
    return _changePasswordForm.controls[ValidationKeys.newPassword]?.value
            .toString() ??
        "";
  }

  void changePassword(BuildContext context) async {
    ref.read(systemControllerProvider.notifier).showLoading();
    FocusManager.instance.primaryFocus?.unfocus();

    UserEntity? userData = ref.read(authControllerProvider);

    final isValid = _changePasswordForm.valid;

    if (isValid) {
      final String oldPassword = getOldPassword();

      if (userData != null) {
        await checkOldPassword(context, oldPassword, userData.email);
      }
    } else {
      _changePasswordForm.controls.forEach((key, value) {
        if (value.invalid) {
          value.setErrors({
            ValidationKeys.required: LocaleKeys.authenticationInputRequired
          });
        }
      });
    }
    ref.read(systemControllerProvider.notifier).hideLoading();
  }

  Future checkOldPassword(
      BuildContext context, String oldPassword, String email) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: oldPassword);
      if (context.mounted) {
        await updatePassword(context);
      } else {
        ref.read(systemControllerProvider.notifier).showToastGeneralError();
      }
    } on FirebaseAuthException catch (_) {
      ref
          .read(systemControllerProvider.notifier)
          .showToastMessage(Utils.getLocaleMessage(
            LocaleKeys.errorPassword,
          ));
    }
  }

  Future updatePassword(BuildContext context) async {
    try {
      final String newPassword = getNewPassword();

      User? currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser != null) {
        await currentUser.updatePassword(newPassword);

        await ref.read(authControllerProvider.notifier).reloadFirebaseUser();

        ref.read(systemControllerProvider.notifier).showToastMessage(
            Utils.getLocaleMessage(LocaleKeys.settingAccountChangePasswordMsg));

        if (context.mounted) {
          context.router.back();
        } else {
          ref.read(systemControllerProvider.notifier).showToastGeneralError();
        }
      }
    } on FirebaseAuthException catch (_) {
      ref.read(systemControllerProvider.notifier).showToastGeneralError();
    }
  }

  Future signUpWithEmail(BuildContext context) async {
    final email =
        _changePasswordForm.controls[ValidationKeys.email]?.value.toString() ??
            "";

    final password = _changePasswordForm
            .controls[ValidationKeys.password]?.value
            .toString() ??
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
      ref.read(systemControllerProvider.notifier).handlerFirebaseError(e.code);
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
        ref.read(systemControllerProvider.notifier).showToastGeneralError();
      }, (r) async {
        ref.read(authControllerProvider.notifier).setDataUser(r.results);
        await ref
            .read(authRepositoryProvider)
            .saveDataUser(r.token, r.refreshToken, r.results.id);
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
              ref
                  .read(systemControllerProvider.notifier)
                  .showToastMessage(r.msg);
              context.router.pushNamed(EmailVerificationScreen.path);
            },
          );
        }
      });
    }
  }
}
