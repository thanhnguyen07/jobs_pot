import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/features/authentication/presentation/widgets/title_and_sub_title.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/utils/utils.dart';

@RoutePage()
class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  static const String path = '/ForgotPasswordScreen';

  @override
  ConsumerState<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _titleForgotPassword(),
    );
  }

  TitleAndSubTitle _titleForgotPassword() {
    return TitleAndSubTitle(
      title: Utils.getLocaleMessage(LocaleKeys.authenticationForgotPassword),
      subTitle: Utils.getLocaleMessage(
          LocaleKeys.authenticationForgotPasswordSubTitle),
    );
  }
}
