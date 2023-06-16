import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/common/validation_keys.dart';
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
}
