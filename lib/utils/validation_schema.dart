import 'package:jobs_pot/common/app_keys.dart';
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
        : <String, dynamic>{ValidationKeys.email.toString(): control.value};
  }
}

Validator<dynamic> get emailValidatorSchema => const EmailValidator();

class PasswordValidator extends Validator<dynamic> {
  final digitRegex = RegExp(r'\d');
  final lowerCaseRegex = RegExp(r'[a-z]');
  final upperCaseRegex = RegExp(r'[A-Z]');
  final nonAlphanumericRegex = RegExp(r'[^a-zA-Z0-9]');

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    if (control.isNull || control.value.toString().isEmpty) {
      return null;
    }
    if (!digitRegex.hasMatch(control.value.toString())) {
      return <String, dynamic>{ValidationKeys.number.toString(): control.value};
    }
    if (!lowerCaseRegex.hasMatch(control.value.toString())) {
      return <String, dynamic>{
        ValidationKeys.lowerCase.toString(): control.value
      };
    }
    if (!upperCaseRegex.hasMatch(control.value.toString())) {
      return <String, dynamic>{
        ValidationKeys.upperCase.toString(): control.value
      };
    }
    if (!nonAlphanumericRegex.hasMatch(control.value.toString())) {
      return <String, dynamic>{
        ValidationKeys.nonAlphanumeric.toString(): control.value
      };
    }
    return null;
  }
}

Validator<dynamic> get passwordValidatorSchema => PasswordValidator();
