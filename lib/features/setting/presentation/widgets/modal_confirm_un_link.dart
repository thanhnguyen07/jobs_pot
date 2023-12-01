import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/common/app_colors.dart';
import 'package:jobs_pot/common/app_text_styles.dart';
import 'package:jobs_pot/common/widgets/cutom_button.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/utils/utils.dart';

class ModalConfirmUnLink extends ConsumerStatefulWidget {
  const ModalConfirmUnLink({
    Key? key,
    required this.yesPress,
    required this.noPress,
  }) : super(key: null);

  final void Function() yesPress;
  final void Function() noPress;

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
        const SizedBox(height: 10),
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
            onPressed: widget.yesPress,
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
            onPressed: widget.noPress,
          ),
        ),
      ],
    );
  }
}
