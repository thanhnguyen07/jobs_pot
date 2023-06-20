import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/common/app_validation_keys.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/features/home/presentation/screens/home_screen.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/utils/utils.dart';
import 'package:jobs_pot/utils/validation_schema.dart';
import 'package:reactive_forms/reactive_forms.dart';

class LoginController extends StateNotifier {
  LoginController(this.ref) : super(null);
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

  Future signInWithEmail(BuildContext context) async {
    final email =
        loginForm.controls[ValidationKeys.email]?.value.toString() ?? "";
    final password =
        loginForm.controls[ValidationKeys.password]?.value.toString() ?? "";

    final encryptPassword = Utils.encryptPassword(password);

    EasyLoading.show();

    final resSignUp = await ref
        .read(authRepositoryProvider)
        .signInWithEmail(email, encryptPassword);

    resSignUp.fold((l) {
      // final error = l.error;

      // print(error);
    }, (r) {
      ref.read(authRepositoryProvider).saveToken(r.token);
      context.router.replaceNamed(HomeScreen.path);
    });

    EasyLoading.dismiss();
  }
}
