import 'package:flutter/material.dart';
import 'package:jobs_pot/common/app_colors.dart';
import 'package:jobs_pot/common/app_text_styles.dart';

class CustomButton1 extends StatelessWidget {
  const CustomButton1({
    super.key,
    required this.topButton,
    required this.count,
    required this.title,
  });

  final bool topButton;
  final String? count;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        width: double.infinity,
        margin: topButton
            ? const EdgeInsets.only(bottom: 12)
            : const EdgeInsets.only(top: 12),
        decoration: BoxDecoration(
          color: topButton ? AppColors.purpleColor : AppColors.amberColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(6),
          ),
        ),
        child: TextButton(
          onPressed: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 5),
                child: Text(
                  count ?? "",
                  style: AppTextStyle.textColor3MediumS16,
                ),
              ),
              Text(
                title,
                style: AppTextStyle.darkPurpleRegularS14,
              )
            ],
          ),
        ),
      ),
    );
  }
}
