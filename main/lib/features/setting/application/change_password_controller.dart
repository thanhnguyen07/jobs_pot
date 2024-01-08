import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/common/constant/app_keys.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/features/authentication/domain/entities/User/user_entity.dart';
import 'package:i18n/i18n.dart';
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
    Utils.showLoading();
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
    Utils.hideLoading();
  }

  Future checkOldPassword(
      BuildContext context, String oldPassword, String email) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: oldPassword);
      if (context.mounted) {
        await updatePassword(context);
      } else {
        Utils.showToastGeneralError();
      }
    } on FirebaseAuthException catch (_) {
      Utils.showToastMessageWithLocaleKeys(
        LocaleKeys.errorPassword,
      );
    }
  }

  Future updatePassword(BuildContext context) async {
    try {
      final String newPassword = getNewPassword();

      User? currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser != null) {
        await currentUser.updatePassword(newPassword);

        await ref.read(authControllerProvider.notifier).reloadFirebaseUser();

        Utils.showToastMessageWithLocaleKeys(
            LocaleKeys.settingAccountChangePasswordMsg);

        if (context.mounted) {
          context.router.back();
        } else {
          Utils.showToastGeneralError();
        }
      }
    } on FirebaseAuthException catch (_) {
      Utils.showToastGeneralError();
    }
  }
}
