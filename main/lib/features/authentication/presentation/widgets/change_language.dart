import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i18n/i18n.dart';
import 'package:jobs_pot/system/system_providers.dart';
import 'package:jobs_pot/utils/utils.dart';

class ChangeLanguage extends ConsumerStatefulWidget {
  const ChangeLanguage({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends ConsumerState<ChangeLanguage> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        ref.read(languageControllerProvider.notifier).changeLanguege(context);
      },
      child: Text(Utils.getLocaleMessage(LocaleKeys.changeLanguageTitle)),
    );
  }
}
