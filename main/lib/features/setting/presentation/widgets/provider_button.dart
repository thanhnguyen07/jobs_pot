import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/common/constant/app_colors.dart';
import 'package:jobs_pot/common/constant/app_text_styles.dart';
import 'package:jobs_pot/utils/utils.dart';

class ProviderButton extends ConsumerStatefulWidget {
  const ProviderButton({
    Key? key,
    required this.linked,
    required this.icon,
    required this.title,
    required this.linkFun,
    required this.unLinkFun,
    this.topButton = false,
  }) : super(key: null);

  final String icon;
  final String title;
  final void Function() linkFun;
  final void Function() unLinkFun;
  final bool linked;
  final bool topButton;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProviderButtonState();
}

class _ProviderButtonState extends ConsumerState<ProviderButton> {
  @override
  Widget build(BuildContext context) {
    final MaterialStateProperty<Icon?> thumbIcon =
        MaterialStateProperty.resolveWith<Icon?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return const Icon(
            Icons.check,
            color: AppColors.black,
          );
        }
        return const Icon(
          Icons.close,
        );
      },
    );

    void onPress() {
      widget.linked ? widget.unLinkFun() : widget.linkFun();
    }

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary.withOpacity(0.8),
        border: Border(
          top: widget.topButton
              ? BorderSide(
                  color: Theme.of(context).colorScheme.onPrimary,
                  width: 1,
                )
              : BorderSide.none,
          bottom: BorderSide(
            color: Theme.of(context).colorScheme.onPrimary,
            width: 1,
          ),
        ),
        borderRadius: BorderRadius.only(
          topLeft: widget.topButton ? const Radius.circular(20) : Radius.zero,
          topRight: widget.topButton ? const Radius.circular(20) : Radius.zero,
          bottomLeft:
              !widget.topButton ? const Radius.circular(20) : Radius.zero,
          bottomRight:
              !widget.topButton ? const Radius.circular(20) : Radius.zero,
        ),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                widget.icon,
                width: 30,
                height: 30,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 15),
              Text(
                Utils.getLocaleMessage(
                  widget.title,
                ),
                style: AppTextStyle.bold.s14
                    .copyWith(color: Theme.of(context).colorScheme.onPrimary),
              ),
            ],
          ),
          Transform.scale(
            scale: 0.8,
            child: Switch(
              activeColor: AppColors.green,
              thumbIcon: thumbIcon,
              value: widget.linked,
              onChanged: (_) {
                onPress();
              },
            ),
          )
        ],
      ),
    );
  }
}
