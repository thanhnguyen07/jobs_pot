import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobs_pot/common/app_icons.dart';
import 'package:jobs_pot/common/app_text_styles.dart';
import 'package:jobs_pot/utils/utils.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.onBack,
    required this.titleKey,
    this.rightButton,
  });

  final String titleKey;
  final void Function() onBack;
  final Widget? rightButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: onBack,
          child: SvgPicture.asset(
            AppIcons.back,
          ),
        ),
        Text(
          Utils.getLocaleMessage(titleKey),
          style: AppTextStyle.darkPurpleBoldS18,
        ),
        rightButton != null
            ? rightButton!
            : const TextButton(
                onPressed: null,
                child: SizedBox(),
              ),
      ],
    );
  }
}
