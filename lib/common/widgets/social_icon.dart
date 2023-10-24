import 'package:flutter/material.dart';
import 'package:jobs_pot/common/app_colors.dart';

class SocialIcon extends StatelessWidget {
  const SocialIcon({
    Key? key,
    required this.icon,
    required this.onPress,
  }) : super(key: key);

  final String icon;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(
        color: AppColors.shadowColor,
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      child: TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
        onPressed: onPress,
        child: Image.asset(
          icon,
          width: 30,
          height: 30,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}