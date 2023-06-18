import 'package:flutter/material.dart';
import 'package:jobs_pot/common/app_colors.dart';
import 'package:jobs_pot/common/widgets/cutom_button.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ButtonSubmitForm extends StatelessWidget {
  const ButtonSubmitForm({Key? key, required this.title, required this.onLogin})
      : super(key: key);
  final Text title;
  final Function onLogin;

  @override
  Widget build(BuildContext context) {
    return ReactiveFormConsumer(
      builder: (context, form, child) {
        return Container(
          margin: const EdgeInsets.all(15),
          child: CutomButton(
            title: title,
            backgroundColor: AppColors.egglantColor,
            onPressed: () {
              onLogin(form);
            },
          ),
        );
      },
    );
  }
}
