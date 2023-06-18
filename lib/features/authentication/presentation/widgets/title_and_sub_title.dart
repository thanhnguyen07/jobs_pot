import 'package:flutter/material.dart';
import 'package:jobs_pot/common/app_text_styles.dart';

class TitleAndSubTitle extends StatelessWidget {
  const TitleAndSubTitle({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 80),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: title,
          style: AppTextStyle.darkPurpleBoldS30,
          children: <TextSpan>[
            TextSpan(
              text: subTitle,
              style: AppTextStyle.textColor1RegularS14,
            )
          ],
        ),
      ),
    );
  }
}
