import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/common/constant/app_colors.dart';
import 'package:jobs_pot/common/constant/app_text_styles.dart';
import 'package:jobs_pot/common/widgets/cutom_button.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/utils/utils.dart';

class ModalConfirm extends ConsumerStatefulWidget {
  const ModalConfirm({
    Key? key,
    required this.yesPress,
    required this.noPress,
    required this.type,
  }) : super(key: null);

  final void Function() yesPress;
  final void Function() noPress;
  final String type;

  @override
  ConsumerState<ModalConfirm> createState() => _ModalConfirmState();
}

class _ModalConfirmState extends ConsumerState<ModalConfirm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const SizedBox(height: 30),
        Text(
          LocaleKeys.settingAccountConfirmUnLink
              .plural(0, args: [Utils.getLocaleMessage(widget.type)]),
          style: AppTextStyle.bold.s20,
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
              style: AppTextStyle.bold.s14.copyWith(color: AppColors.white),
            ),
            backgroundColor: AppColors.candyAppleRed,
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
              style: AppTextStyle.bold.s14
                  .copyWith(color: Theme.of(context).colorScheme.onSecondary),
            ),
            backgroundColor: Theme.of(context).colorScheme.secondary,
            onPressed: widget.noPress,
          ),
        ),
      ],
    );
  }
}
