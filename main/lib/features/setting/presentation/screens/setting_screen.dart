import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobs_pot/common/constant/app_colors.dart';
import 'package:jobs_pot/common/constant/app_icons.dart';
import 'package:jobs_pot/common/constant/app_text_styles.dart';
import 'package:jobs_pot/common/widgets/cutom_button.dart';
import 'package:jobs_pot/common/widgets/header.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/features/setting/presentation/screens/account_screen.dart';
import 'package:jobs_pot/features/setting/presentation/widgets/settting_button.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/system/system_providers.dart';
import 'package:jobs_pot/utils/utils.dart';

@RoutePage()
class SettingScreen extends ConsumerStatefulWidget {
  const SettingScreen({Key? key}) : super(key: null);

  static const String path = '/SettingScreen';

  @override
  ConsumerState<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends ConsumerState<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(
              onBack: () {
                context.router.back();
              },
              titleKey: LocaleKeys.settingTitle,
            ),
            _body(context),
          ],
        ),
      ),
    );
  }

  Container _body(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          _buttonChangeLanguage(context),
          _accountButton(context),
          _buttonLogout(),
        ],
      ),
    );
  }

  SettingButton _buttonLogout() {
    return SettingButton(
      onPress: () {
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return _modalLogout(context);
          },
        );
      },
      title: Utils.getLocaleMessage(LocaleKeys.settingLogoutTitle),
      showArrowButton: true,
      icon: SvgPicture.asset(AppSvgIcons.logout),
    );
  }

  SettingButton _accountButton(BuildContext context) {
    return SettingButton(
      onPress: () {
        context.router.navigateNamed(AccountScreen.path);
      },
      title: Utils.getLocaleMessage(LocaleKeys.settingAccountTitle),
      showArrowButton: true,
      icon: SvgPicture.asset(
        AppSvgIcons.profile,
        colorFilter: const ColorFilter.mode(
          AppColors.blackColor,
          BlendMode.srcIn,
        ),
      ),
    );
  }

  SettingButton _buttonChangeLanguage(BuildContext context) {
    return SettingButton(
      showArrowButton: true,
      title:
          "${Utils.getLocaleMessage(LocaleKeys.settingLanguagesTitle)}: ${Utils.getLocaleMessage(LocaleKeys.changeLanguageTitle2)}",
      icon: SvgPicture.asset(
        AppSvgIcons.language,
        colorFilter: const ColorFilter.mode(
          AppColors.blackColor,
          BlendMode.srcIn,
        ),
      ),
      onPress: () {
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return _modalChangeLanguages(context);
          },
        );
      },
    );
  }

  SizedBox _modalChangeLanguages(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              Utils.getLocaleMessage(LocaleKeys.settingSelectLanguage),
              style: AppTextStyle.darkPurpleBoldS18,
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.darkPurpleColor,
              ),
              onPressed: () {
                ref
                    .read(languageControllerProvider.notifier)
                    .changeLanguege(context);
                Navigator.pop(context);
              },
              child: Text(
                Utils.getLocaleMessage(
                  LocaleKeys.changeLanguageTitle,
                ),
                style: AppTextStyle.whiteBoldS14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _modalLogout(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              Utils.getLocaleMessage(LocaleKeys.settingLogoutTitle),
              style: AppTextStyle.egglantBoldS22,
            ),
            Text(
              Utils.getLocaleMessage(LocaleKeys.settingLogoutModalSubTitle),
              style: AppTextStyle.textColor1RegularS14,
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
                backgroundColor: AppColors.egglantColor,
                onPressed: () {
                  ref.read(authControllerProvider.notifier).onLogOut();
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: 25, right: 25, top: 10, bottom: 20),
              child: CustomButton(
                title: Text(
                  Utils.getLocaleMessage(
                    LocaleKeys.cancelButtonTitle,
                  ),
                  style: AppTextStyle.whiteBoldS14,
                ),
                backgroundColor: AppColors.lavenderColor,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
