import 'package:flutter/material.dart';
import 'package:jobs_pot/common/app_colors.dart';
import 'package:jobs_pot/common/app_text_styles.dart';
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
  });

  final FormControl? formController;
  final Text? title;
  final Map<String, String Function(Object)>? validationMessages;
  final bool obscureText;
  final Widget? suffixIcon;
  final String? hintText;
  final TextInputType? keyboardType;

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
              style: AppTextStyle.textErrorInputS12,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }

  Container _input() {
    return Container(
      decoration: _boxInputContainerStyle(),
      child: ReactiveTextField(
        formControl: widget.formController,
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText,
        showErrors: (control) => _handleError(control),
        onChanged: _onChanged,
        validationMessages: widget.validationMessages,
        decoration: _boxInputStyle(),
      ),
    );
  }

  InputDecoration _boxInputStyle() {
    return InputDecoration(
      suffixIcon: widget.suffixIcon,
      filled: true,
      hintText: widget.hintText,
      hintStyle: AppTextStyle.textlavenderGraS12,
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.only(left: 15, right: 15),
    );
  }

  BoxDecoration _boxInputContainerStyle() {
    return const BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: AppColors.shadowColor,
          blurRadius: 4,
          offset: Offset(2, 4), // Shadow position
        ),
      ],
    );
  }

  Container _title() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, top: 10),
      width: double.infinity,
      child: widget.title,
    );
  }
}
