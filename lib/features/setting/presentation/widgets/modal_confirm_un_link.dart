import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/common/app_colors.dart';
import 'package:jobs_pot/common/app_text_styles.dart';
import 'package:jobs_pot/common/widgets/cutom_button.dart';
import 'package:jobs_pot/features/setting/setting_providers.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/utils/utils.dart';

class ModalConfirmUnLink extends ConsumerStatefulWidget {
  const ModalConfirmUnLink({
    Key? key,
  }) : super(key: null);

  @override
  ConsumerState<ModalConfirmUnLink> createState() => _ModalConfirmUnLinkState();
}

class _ModalConfirmUnLinkState extends ConsumerState<ModalConfirmUnLink> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const SizedBox(height: 5),
        Text(
          Utils.getLocaleMessage(LocaleKeys.settingAccountConfirmUnLink),
          style: AppTextStyle.darkPurpleBoldS20,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 30),
        Container(
          margin: const EdgeInsets.only(left: 25, right: 25),
          child: CustomButton(
            title: Text(
              Utils.getLocaleMessage(
                LocaleKeys.yesButtonTitle,
              ),
              style: AppTextStyle.whiteBoldS14,
            ),
            backgroundColor: Colors.redAccent,
            onPressed: () async {
              Navigator.pop(context);
              await ref.read(accountControllerProvider.notifier).unLink();
            },
          ),
        ),
        Container(
          margin:
              const EdgeInsets.only(left: 25, right: 25, top: 10, bottom: 20),
          child: CustomButton(
            title: Text(
              Utils.getLocaleMessage(
                LocaleKeys.cancelButtonTitle,
              ),
              style: AppTextStyle.whiteBoldS14,
            ),
            backgroundColor: AppColors.lavenderColor,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }
}
