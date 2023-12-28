import 'package:flutter/material.dart';
import 'package:jobs_pot/common/constant/app_colors.dart';
import 'package:jobs_pot/common/constant/app_text_styles.dart';
import 'package:reactive_forms/reactive_forms.dart';

class InputReactiveForms extends StatefulWidget {
  const InputReactiveForms({
    super.key,
    required this.formController,
    this.title,
    this.validationMessages,
    required this.obscureText,
    this.suffixIcon,
    this.hintText,
    this.keyboardType,
    this.maxLine,
    this.inputBakgourndColor = AppColors.white,
    this.focusedInputBorderColor = AppColors.egglantColor,
  });

  final FormControl? formController;
  final Text? title;
  final Map<String, String Function(Object)>? validationMessages;
  final bool obscureText;
  final Widget? suffixIcon;
  final String? hintText;
  final TextInputType? keyboardType;
  final int? maxLine;
  final Color inputBakgourndColor;
  final Color focusedInputBorderColor;

  @override
  State<StatefulWidget> createState() => _InputReactiveFormsState();
}

class _InputReactiveFormsState extends State<InputReactiveForms> {
  String errorText = '';

  void _setError(String value) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        errorText = value;
      });
    });
  }

  bool _handleError(FormControl<Object?> control) {
    final typeError = control.errors.keys.first;
    String newError = '';
    widget.validationMessages?.forEach((key, value) {
      if (key == typeError) {
        newError = value.call({});
      }
    });
    if (control.dirty && control.invalid && errorText != newError) {
      _setError(newError);
    }
    return false;
  }

  void _onChanged(FormControl<Object?> control) {
    if (control.valid && errorText.isNotEmpty) {
      _setError('');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _title(),
        _input(),
        errorText.isNotEmpty
            ? _textError()
            : const SizedBox(
                height: 10,
              )
      ],
    );
  }

  Padding _textError() {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Row(
        children: [
          Flexible(
            child: Text(
              errorText,
              style: AppTextStyle.light.s12.copyWith(
                color: AppColors.candyAppleRed,
              ),
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }

  Container _input() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        color: widget.inputBakgourndColor.withOpacity(0.5),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadowColor,
            blurRadius: 4,
            offset: Offset(2, 4), // Shadow position
          ),
        ],
      ),
      child: ReactiveTextField(
        formControl: widget.formController,
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText,
        showErrors: (control) => _handleError(control),
        onChanged: _onChanged,
        validationMessages: widget.validationMessages,
        decoration: _boxInputStyle(),
        maxLines: widget.maxLine ?? 1,
      ),
    );
  }

  InputDecoration _boxInputStyle() {
    return InputDecoration(
      suffixIcon: widget.suffixIcon,
      filled: true,
      hintText: widget.hintText,
      hintStyle: AppTextStyle.regular.s14,
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: errorText.isNotEmpty
              ? AppColors.scarletRed
              : widget.focusedInputBorderColor,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
    );
  }

  Container _title() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      child: widget.title,
    );
  }
}
