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
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Row(
              children: [
                ClipOval(
                  child: Container(
                    width: 40,
                    height: 40,
                    color: Theme.of(context).colorScheme.background,
                    padding: const EdgeInsets.all(10),
                    child: SvgPicture.asset(
                      icon,
                      colorFilter: ColorFilter.mode(
                        Theme.of(context).colorScheme.onBackground,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      count ?? "",
                      style: AppTextStyle.bold.s16.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxHeight: 40,
                        maxWidth: 70,
                      ),
                      child: Text(
                        title,
                        style: AppTextStyle.regular.s14.copyWith(
                          color: AppColors.black,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
