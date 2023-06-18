import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:jobs_pot/common/app_text_styles.dart';

class SuggestionsText extends StatelessWidget {
  const SuggestionsText({
    Key? key,
    required this.textSuggestions,
    required this.textAction,
    required this.action,
  }) : super(key: key);

  final String textSuggestions;
  final String textAction;
  final void Function()? action;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: textSuggestions,
                style: AppTextStyle.textColor1RegularS14,
              ),
              const TextSpan(
                text: ' ',
              ),
              TextSpan(
                text: textAction,
                style: AppTextStyle.fireYellowUnderlineRegularS14,
                recognizer: TapGestureRecognizer()..onTap = action,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
