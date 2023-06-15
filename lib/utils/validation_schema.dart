import 'package:reactive_forms/reactive_forms.dart';

class EmailValidator extends Validator<dynamic> {
  static final RegExp emailRegex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  const EmailValidator() : super();

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    return (control.isNull ||
            control.value.toString().isEmpty ||
            emailRegex.hasMatch(control.value.toString()))
        ? null
        : <String, dynamic>{ValidationMessage.email: control.value};
  }
}

Validator<dynamic> get emailValidatorSchema => const EmailValidator();

class PasswordValidator extends Validator<dynamic> {
  static final RegExp passwordRegex =
      RegExp(r'^((?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[\W]).{8,20})$');

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    // don't validate empty values to allow optional controls
    return (control.isNull ||
            control.value.toString().isEmpty ||
            passwordRegex.hasMatch(control.value.toString()))
        ? null
        : <String, dynamic>{'password': control.value};
  }
}

Validator<dynamic> get passwordValidatorSchema => PasswordValidator();
