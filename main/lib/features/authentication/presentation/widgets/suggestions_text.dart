import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:jobs_pot/common/constant/app_text_styles.dart';

class SuggestionsText extends StatelessWidget {
  const SuggestionsText({
    Key? key,
    required this.textSuggestions,
    required this.textAction,
    required this.action,
    this.textTime,
  }) : super(key: null);

  final String textSuggestions;
  final String textAction;
  final int? textTime;
  final void Function()? action;

  String formatSeconds(int? seconds) {
    if (seconds != null) {
      int minutes = seconds ~/ 60;
      int remainingSeconds = seconds % 60;
      return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
    } else {
      return "";
    }
  }

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
                  children: [
                    TextSpan(
                      text: textTime != null
                          ? textTime! > 0
                              ? " (${formatSeconds(textTime)})"
                              : ''
                          : '',
                    )
                  ]),
            ],
          ),
        ),
      ],
    );
  }
}
