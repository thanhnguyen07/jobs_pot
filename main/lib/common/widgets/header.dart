import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobs_pot/common/constant/app_icons.dart';
import 'package:jobs_pot/common/constant/app_text_styles.dart';
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
            AppSvgIcons.back,
            colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.onBackground,
              BlendMode.srcIn,
            ),
          ),
        ),
        Text(
          Utils.getLocaleMessage(titleKey),
          style: AppTextStyle.bold.s20,
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
