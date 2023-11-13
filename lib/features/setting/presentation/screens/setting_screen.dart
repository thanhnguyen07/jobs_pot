import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobs_pot/common/app_colors.dart';
import 'package:jobs_pot/common/app_icons.dart';
import 'package:jobs_pot/common/app_text_styles.dart';
import 'package:jobs_pot/common/widgets/cutom_button.dart';
import 'package:jobs_pot/features/setting/presentation/widgets/setttin_button.dart';
import 'package:jobs_pot/features/setting/setting_providers.dart';
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
        margin: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _backButton(context),
            _titleSettting(),
            _buttonChangeLanguage(context),
            _buttonLogout(),
          ],
        ),
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
      icon: SvgPicture.asset(AppIcons.logout),
    );
  }

  SettingButton _buttonChangeLanguage(BuildContext context) {
    return SettingButton(
      showArrowButton: true,
      title:
          "${Utils.getLocaleMessage(LocaleKeys.settingLanguagesTitle)}: ${Utils.getLocaleMessage(LocaleKeys.changeLanguageTitle2)}",
      icon: SvgPicture.asset(
        AppIcons.language,
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

  Container _titleSettting() {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Text(
        Utils.getLocaleMessage(LocaleKeys.settingTitle),
        style: AppTextStyle.textColor3MediumS16,
      ),
    );
  }

  GestureDetector _backButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.back();
      },
      child: SvgPicture.asset(AppIcons.back),
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
            const SizedBox(height: 40),
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
                  ref
                      .read(settingControllerProvider.notifier)
                      .onLogOut(context);
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
