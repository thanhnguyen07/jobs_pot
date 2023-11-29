import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/common/app_colors.dart';
import 'package:jobs_pot/common/app_enum.dart';
import 'package:jobs_pot/common/app_text_styles.dart';
import 'package:jobs_pot/common/widgets/cutom_button.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/utils/utils.dart';

class BottomNavigationController extends StateNotifier<CreateScreenType?> {
  BottomNavigationController(this.ref) : super(null);

  final Ref ref;

  Future<void> actionButtonCreate(BuildContext context) {
    return showModalBottomSheet<void>(
      isDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 300,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    Utils.getLocaleMessage(LocaleKeys.postTitle),
                    style: AppTextStyle.text4BoldS16,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    Utils.getLocaleMessage(LocaleKeys.postSubTitle),
                    style: AppTextStyle.textColor5RegularS12,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 15),
                  CustomButton(
                    title: Text(
                      Utils.getLocaleMessage(LocaleKeys.postButtonTitle),
                      style: AppTextStyle.whiteBoldS14,
                    ),
                    backgroundColor: AppColors.darkPurpleColor,
                    onPressed: () {
                      state = CreateScreenType.post;
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(height: 10),
                  CustomButton(
                    title: Text(
                      Utils.getLocaleMessage(LocaleKeys.postMakeAJob),
                      style: AppTextStyle.whiteBoldS14,
                    ),
                    backgroundColor: AppColors.lavenderColor,
                    onPressed: () {
                      state = CreateScreenType.createJob;
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
