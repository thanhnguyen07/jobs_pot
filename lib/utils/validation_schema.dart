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

class DifferentValidator extends Validator<dynamic> {
  final String controlName;
  final String differentControlName;

  DifferentValidator({
    required this.controlName,
    required this.differentControlName,
  }) : super();

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    final form = control as FormGroup;

    final formControl = form.control(controlName);
    final matchingFormControl = form.control(differentControlName);

    if (formControl.dirty && formControl.value == matchingFormControl.value) {
      matchingFormControl.setErrors({ValidationKeys.different: true});

      matchingFormControl.markAsTouched();
    } else {
      matchingFormControl.removeError(ValidationKeys.different);
    }

    return null;
  }
}
