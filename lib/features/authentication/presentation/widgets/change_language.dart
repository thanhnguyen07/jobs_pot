import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/config/app_configs.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
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
    // final bool state = ref.watch(rememberLoginController);
    return TextButton(
      onPressed: () {
        ref.read(languageControllerProvider.notifier).changeLanguege(context);
      },
      child: Text(Utils.getLocaleMessage(LocaleKeys.changeLanguageTitle)),
    );
  }
}
