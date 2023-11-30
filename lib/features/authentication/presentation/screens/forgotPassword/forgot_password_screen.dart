import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobs_pot/common/app_colors.dart';
import 'package:jobs_pot/common/app_images.dart';
import 'package:jobs_pot/common/app_text_styles.dart';
import 'package:jobs_pot/common/widgets/app_scaffold.dart';
import 'package:jobs_pot/common/widgets/cutom_button.dart';
import 'package:jobs_pot/features/authentication/presentation/screens/forgotPassword/forgot_password_form.dart';
import 'package:jobs_pot/features/authentication/presentation/widgets/title_and_sub_title.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/utils/utils.dart';

@RoutePage()
class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: null);

  static const String path = '/ForgotPasswordScreen';

  @override
  ConsumerState<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      unFocusKeyboard: true,
      scroll: true,
      physicsScroll: const ClampingScrollPhysics(),
      child: _body(),
    );
  }

  Widget _body() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          _forgotPasswordTitle(),
          SvgPicture.asset(AppImages.forgotPassword),
          const ForgotPasswordForm(),
          _buttonActions(),
        ],
      ),
    );
  }

  Widget _forgotPasswordTitle() {
    return TitleAndSubTitle(
      title: Utils.getLocaleMessage(LocaleKeys.authenticationForgotPassword),
      subTitle: Utils.getLocaleMessage(
          LocaleKeys.authenticationForgotPasswordSubTitle),
    );
  }

  Container _buttonActions() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: CustomButton(
        backgroundColor: AppColors.fireYellowColor,
        title: Text(
          Utils.getLocaleMessage(LocaleKeys.authenticationBackButtonTitle),
          style: AppTextStyle.whiteBoldS14,
        ),
        onPressed: () {
          context.router.back();
        },
      ),
    );
  }
}
