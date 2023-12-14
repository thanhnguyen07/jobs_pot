import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/common/constant/app_text_styles.dart';
import 'package:jobs_pot/system/system_providers.dart';
import 'package:jobs_pot/utils/utils.dart';

class CustomTitle extends ConsumerStatefulWidget {
  const CustomTitle({super.key, required this.titleKey});

  final String titleKey;

  @override
  ConsumerState<CustomTitle> createState() => _CustomTitleState();
}

class _CustomTitleState extends ConsumerState<CustomTitle> {
  @override
  Widget build(BuildContext context) {
    ref.watch(languageControllerProvider);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Text(
        Utils.getLocaleMessage(widget.titleKey),
        style: AppTextStyle.blackBoldS16,
      ),
    );
  }
}
