import 'package:flutter/material.dart';
import 'package:jobs_pot/common/app_colors.dart';
import 'package:jobs_pot/common/widgets/cutom_button.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ButtonSubmitForm extends StatelessWidget {
  const ButtonSubmitForm({
    Key? key,
    required this.title,
    required this.onLogin,
  }) : super(key: key);
  final Text title;
  final void Function() onLogin;

  @override
  Widget build(BuildContext context) {
    Color checkBackgroundColor(FormGroup form) {
      if (form.dirty) {
        return form.valid ? AppColors.egglantColor : AppColors.shadowColor;
      } else {
        return AppColors.egglantColor;
      }
    }

    return ReactiveFormConsumer(
      builder: (context, form, child) {
        return Container(
          margin: const EdgeInsets.all(15),
          child: CustomButton(
            title: title,
            backgroundColor: checkBackgroundColor(form),
            onPressed: form.valid ? onLogin : null,
          ),
        );
      },
    );
  }
}
