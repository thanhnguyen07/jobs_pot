import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/common/app_text_styles.dart';
import 'package:jobs_pot/utils/utils.dart';

class ProviderButton extends ConsumerStatefulWidget {
  const ProviderButton({
    Key? key,
    required this.linked,
    required this.icon,
    required this.title,
    required this.linkFun,
    required this.unLinkFun,
  }) : super(key: null);

  final String icon;
  final String title;
  final void Function() linkFun;
  final void Function() unLinkFun;
  final bool linked;

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
            color: Colors.white,
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

    return TextButton(
      onPressed: onPress,
      child: SizedBox(
        width: 250,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              widget.icon,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: 80,
              child: Text(
                Utils.getLocaleMessage(
                  widget.title,
                ),
                style: AppTextStyle.text4BoldS16,
              ),
            ),
            Switch(
              activeColor: Colors.green,
              activeTrackColor: Colors.greenAccent,
              trackOutlineColor: widget.linked
                  ? MaterialStateProperty.all(Colors.green)
                  : null,
              thumbIcon: thumbIcon,
              value: widget.linked,
              onChanged: (_) {
                onPress();
              },
            )
          ],
        ),
      ),
    );
  }
}
