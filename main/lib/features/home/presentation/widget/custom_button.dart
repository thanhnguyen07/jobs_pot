import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobs_pot/common/constant/app_colors.dart';
import 'package:jobs_pot/common/constant/app_text_styles.dart';

class CustomButton1 extends StatelessWidget {
  const CustomButton1({
    super.key,
    required this.topButton,
    required this.count,
    required this.title,
    required this.icon,
  });

  final bool topButton;
  final String? count;
  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        width: double.infinity,
        margin: topButton
            ? const EdgeInsets.only(bottom: 8)
            : const EdgeInsets.only(top: 8),
        decoration: BoxDecoration(
          color: topButton ? AppColors.purple : AppColors.yellow,
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Row(
            children: [
              const SizedBox(width: 10),
              ClipOval(
                child: Container(
                  width: 40,
                  height: 40,
                  color: Colors.white,
                  padding: const EdgeInsets.all(10),
                  child: SvgPicture.asset(icon),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    count ?? "",
                    style: AppTextStyle.blackBoldS16,
                  ),
                  Text(
                    title,
                    style: AppTextStyle.darkPurpleRegularS14,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
