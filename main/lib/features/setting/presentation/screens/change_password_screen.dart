import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/common/widgets/app_scaffold.dart';
import 'package:jobs_pot/common/widgets/header.dart';
import 'package:jobs_pot/features/setting/presentation/widgets/change_password_form.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';

@RoutePage()
class ChangePasswordScreen extends ConsumerStatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: null);

  static const String path = '/ChangePasswordScreen';

  @override
  ConsumerState<ChangePasswordScreen> createState() =>
      _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends ConsumerState<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      scroll: true,
      paddingTop: true,
      unFocusKeyboard: true,
      physicsScroll: const ClampingScrollPhysics(),
      child: Column(
        children: [
          Header(
            onBack: () {
              context.router.back();
            },
            titleKey: LocaleKeys.settingAccountChangePassword,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: const ChangePasswordForm(),
          ),
        ],
      ),
    );
  }
}
