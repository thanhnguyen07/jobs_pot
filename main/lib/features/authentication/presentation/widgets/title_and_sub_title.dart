import 'package:flutter/material.dart';
import 'package:jobs_pot/common/constant/app_text_styles.dart';

class TitleAndSubTitle extends StatelessWidget {
  const TitleAndSubTitle({
    super.key,
    required this.title,
    required this.subTitle,
    this.subTitle2,
  });

  final String title;
  final String subTitle;
  final String? subTitle2;
  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: "$title\n",
        style: AppTextStyle.bold.s30
            .copyWith(color: Theme.of(context).colorScheme.primary),
        children: <TextSpan>[
          TextSpan(
            text: '$subTitle\n',
            style: AppTextStyle.regular.s14,
            children: <TextSpan>[
              TextSpan(
                text: subTitle2,
                style: AppTextStyle.bold.s14,
              )
            ],
          )
        ],
      ),
    );
  }
}
