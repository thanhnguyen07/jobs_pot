import 'package:flutter/material.dart';
import 'package:jobs_pot/common/constant/app_colors.dart';
import 'package:jobs_pot/common/widgets/cutom_button.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ButtonSubmitForm extends StatelessWidget {
  const ButtonSubmitForm({
    Key? key,
    required this.title,
    required this.onLogin,
  }) : super(key: null);
  final Text title;
  final void Function() onLogin;

  @override
  Widget build(BuildContext context) {
    Color checkBackgroundColor(FormGroup form) {
      if (!form.pristine) {
        return form.valid ? AppColors.egglantColor : AppColors.shadowColor;
      } else {
        return AppColors.egglantColor;
      }
    }

    void Function()? checkOnPress(FormGroup form) {
      if (form.pristine) {
        return onLogin;
      } else {
        return form.valid ? onLogin : null;
      }
    }

    return ReactiveFormConsumer(
      builder: (context, form, child) {
        return Container(
          margin: const EdgeInsets.all(15),
          child: CustomButton(
            title: title,
            backgroundColor: checkBackgroundColor(form),
            onPressed: checkOnPress(form),
          ),
        );
      },
    );
  }
}
