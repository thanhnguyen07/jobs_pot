import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobs_pot/common/app_icons.dart';
import 'package:jobs_pot/common/app_text_styles.dart';

class SettingButton extends StatelessWidget {
  const SettingButton({
    super.key,
    required this.onPress,
    required this.title,
    required this.icon,
    required this.showArrowButton,
    this.color,
  });

  final Function onPress;
  final String title;
  final Widget icon;
  final bool showArrowButton;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: ElevatedButton(
        onPressed: () => onPress(),
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? Colors.white,
          minimumSize: const Size(double.infinity, 45),
          elevation: 8,
          shadowColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          // foreground
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                icon,
                const SizedBox(width: 15),
                Text(
                  title,
                  style: AppTextStyle.textBlackColorRegularS12,
                )
              ],
            ),
            showArrowButton
                ? SvgPicture.asset(AppIcons.arrowRight2)
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
