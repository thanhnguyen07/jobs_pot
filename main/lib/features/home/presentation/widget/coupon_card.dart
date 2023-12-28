import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jobs_pot/common/constant/app_colors.dart';
import 'package:jobs_pot/common/constant/app_images.dart';
import 'package:jobs_pot/common/constant/app_text_styles.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/utils/utils.dart';

class CouponCard extends StatelessWidget {
  const CouponCard({
    Key? key,
    required this.onPress,
  }) : super(key: null);

  final void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        children: [
          SizedBox(
            height: 200,
            child: Image.asset(AppImages.cardDefault),
          ),
          Container(
            width: double.infinity,
            height: 200,
            margin: const EdgeInsets.only(left: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                SizedBox(
                  width: 200,
                  child: Text(
                    LocaleKeys.homePercentSaleTitle.plural(50),
                    style: AppTextStyle.mediumItalic.s18
                        .copyWith(color: AppColors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: onPress,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(0, 30),
                    elevation: 5,
                  ),
                  child: Text(
                    Utils.getLocaleMessage(LocaleKeys.homeJoinNowTitle),
                    style: AppTextStyle.bold.s14,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
