import 'package:flutter/material.dart';
import 'package:jobs_pot/common/app_text_styles.dart';
import 'package:reactive_forms/reactive_forms.dart';

class InputReactiveForms extends StatefulWidget {
  const InputReactiveForms({
    super.key,
    required this.formController,
    this.title,
    this.validationMessages,
  });

  final FormControl? formController;
  final Text? title;
  final Map<String, String Function(Object)>? validationMessages;

  @override
  State<InputReactiveForms> createState() => _InputReactiveFormsState();
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
        Container(
          margin: const EdgeInsets.only(bottom: 15),
          width: double.infinity,
          child: widget.title,
        ),
        Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: ReactiveTextField(
            keyboardType: TextInputType.emailAddress,
            formControl: widget.formController,
            showErrors: (control) => _handleError(control),
            onChanged: _onChanged,
            validationMessages: widget.validationMessages,
            decoration: const InputDecoration(
              filled: true,
              hintText: '',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.only(left: 15, right: 15),
            ),
          ),
        ),
        errorText.isNotEmpty
            ? Padding(
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
              )
            : const SizedBox(
                height: 10,
              )
      ],
    );
  }
}
