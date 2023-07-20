import 'package:flutter/material.dart';
import 'package:jobs_pot/common/app_colors.dart';
import 'package:jobs_pot/common/app_images.dart';
import 'package:jobs_pot/common/app_text_styles.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/utils/utils.dart';

class ButtonRemoteJob extends StatelessWidget {
  const ButtonRemoteJob({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.babyBlueColor,
          borderRadius: BorderRadius.all(
            Radius.circular(6),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.findJob,
              width: 35,
              height: 35,
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: const Text(
                "44.5k",
                style: AppTextStyle.textColor3MediumS16,
              ),
            ),
            Text(
              Utils.getLocaleMessage(LocaleKeys.homeRemoteJobTitle),
              style: AppTextStyle.darkPurpleRegularS14,
            )
          ],
        ),
      ),
    );
  }
}
