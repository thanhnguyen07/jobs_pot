import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/common/app_validation_keys.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/utils/utils.dart';
import 'package:jobs_pot/utils/validation_schema.dart';
import 'package:reactive_forms/reactive_forms.dart';

class SignUpController extends StateNotifier {
  SignUpController(this.ref) : super(null);
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

  void onSignUp() {
    final isValid = signUpForm.valid;
    if (isValid) {
      final fullName =
          signUpForm.controls[ValidationKeys.fullName]?.value.toString() ?? "";
      final email =
          signUpForm.controls[ValidationKeys.email]?.value.toString() ?? "";
      final password =
          signUpForm.controls[ValidationKeys.password]?.value.toString() ?? "";

      final encryptPassword = Utils.encryptPassword(password);
      signUpWithEmail();
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

  Future signUpWithEmail() async {
    final fullName =
        signUpForm.controls[ValidationKeys.fullName]?.value.toString() ?? "";
    final email =
        signUpForm.controls[ValidationKeys.email]?.value.toString() ?? "";
    final password =
        signUpForm.controls[ValidationKeys.password]?.value.toString() ?? "";

    final encryptPassword = Utils.encryptPassword(password);
  }
}
