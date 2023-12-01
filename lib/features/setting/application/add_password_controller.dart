import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/common/app_keys.dart';
import 'package:jobs_pot/common/app_text_styles.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/features/authentication/domain/entities/user_entity.dart';
import 'package:jobs_pot/features/setting/presentation/widgets/modal_verification_code.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/system/system_providers.dart';
import 'package:jobs_pot/utils/utils.dart';
import 'package:jobs_pot/utils/validation_schema.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AddPasswordController extends StateNotifier {
  AddPasswordController(this.ref) : super(null);

  final Ref ref;

  final _addPasswordForm = FormGroup({
    ValidationKeys.password: FormControl<String>(
      value: '',
      validators: [
        Validators.required,
        Validators.minLength(3),
        passwordValidatorSchema
      ],
      touched: true,
    ),
    ValidationKeys.confirmPassword: FormControl<String>(
      value: '',
      validators: [
        Validators.required,
      ],
      touched: true,
    ),
  }, validators: [
    Validators.mustMatch(
      ValidationKeys.password,
      ValidationKeys.confirmPassword,
      markAsDirty: false,
    ),
  ]);

  FormGroup getAddPasswordForm() => _addPasswordForm;

  String? getPassword() {
    return _addPasswordForm.controls[ValidationKeys.password]?.value.toString();
  }

  void addPassword(BuildContext context) async {
    ref.read(systemControllerProvider.notifier).showLoading();

    UserEntity? userData = ref.read(authControllerProvider);

    final isValid = _addPasswordForm.valid;

    if (isValid) {
      FocusManager.instance.primaryFocus?.unfocus();

      if (userData != null) {
        final sendVerificationCodeRes = await ref
            .read(authRepositoryProvider)
            .sendVerificationCode(userData.email);

        ref.read(systemControllerProvider.notifier).hideLoading();

        await sendVerificationCodeRes.fold(
          (l) {},
          (r) async {
            await showDialog(
              context: context,
              builder: (_) {
                return AlertDialog(
                  title: Text(
                    Utils.getLocaleMessage(
                        LocaleKeys.settingAccountChangeVerificationCode),
                    style: AppTextStyle.darkPurpleBoldS30,
                  ),
                  content: const ModalVerificationCode(),
                );
              },
            );
          },
        );
      }
    } else {
      _addPasswordForm.controls.forEach((key, value) {
        if (value.invalid) {
          value.setErrors({
            ValidationKeys.required: LocaleKeys.authenticationInputRequired
          });
        }
      });
    }
    ref.read(systemControllerProvider.notifier).hideLoading();
  }
}
