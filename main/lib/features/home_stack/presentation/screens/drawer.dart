import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobs_pot/common/constant/app_colors.dart';
import 'package:jobs_pot/common/constant/app_icons.dart';
import 'package:jobs_pot/common/constant/app_text_styles.dart';
import 'package:jobs_pot/common/widgets/avatar_image.dart';
import 'package:jobs_pot/common/widgets/bacground_image.dart';
import 'package:jobs_pot/common/widgets/cutom_button.dart';
import 'package:jobs_pot/common/widgets/switch_theme.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:models/entities/export.dart';
import 'package:jobs_pot/features/home_stack/presentation/screens/bottom_navigation_screen.dart';
import 'package:jobs_pot/features/profile/presentation/screens/profile_screen.dart';
import 'package:jobs_pot/features/save_job/presentation/screens/save_job_screen.dart';
import 'package:jobs_pot/features/setting/presentation/screens/account_screen.dart';
import 'package:jobs_pot/features/setting/presentation/screens/setting_screen.dart';
import 'package:i18n/i18n.dart';
import 'package:jobs_pot/utils/utils.dart';

class MyDrawer extends ConsumerStatefulWidget {
  const MyDrawer({Key? key}) : super(key: null);

  @override
  ConsumerState<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends ConsumerState<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Drawer(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _userInfo(context),
                      const SizedBox(height: 20),
                      _bookmark(context),
                      _account(context),
                      const Divider(),
                      _settings(context),
                      _logout(context),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        vertical: 25, horizontal: 20),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SwitchThemeMode(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Expanded(
            flex: 1,
            child: SizedBox(),
          )
        ],
      ),
    );
  }

  Container _logout(BuildContext context) {
    return _button(
      title: Text(
        Utils.getLocaleMessage(LocaleKeys.settingLogoutTitle),
        style: AppTextStyle.mediumItalic.s16red,
      ),
      icon: SvgPicture.asset(
        AppSvgIcons.logout,
        colorFilter: const ColorFilter.mode(
          AppColors.candyAppleRed,
          BlendMode.srcIn,
        ),
      ),
      onPress: () {
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return _modalLogout(context);
          },
        );
      },
    );
  }

  Container _settings(BuildContext context) {
    return _button(
      title: Text(
        Utils.getLocaleMessage(LocaleKeys.settingTitle),
        style: AppTextStyle.mediumItalic.s16,
      ),
      icon: SvgPicture.asset(
        AppSvgIcons.setting,
        colorFilter: ColorFilter.mode(
          Theme.of(context).colorScheme.primary,
          BlendMode.srcIn,
        ),
      ),
      onPress: () {
        scaffoldBottomNavigationKey.currentState?.closeDrawer();
        context.router.navigateNamed(SettingScreen.path);
      },
    );
  }

  Container _account(BuildContext context) {
    return _button(
      title: Text(
        Utils.getLocaleMessage(LocaleKeys.settingAccountTitle),
        style: AppTextStyle.mediumItalic.s16,
      ),
      icon: SvgPicture.asset(
        AppSvgIcons.profile,
        colorFilter: ColorFilter.mode(
          Theme.of(context).colorScheme.primary,
          BlendMode.srcIn,
        ),
      ),
      onPress: () {
        scaffoldBottomNavigationKey.currentState?.closeDrawer();
        context.router.navigateNamed(AccountScreen.path);
      },
    );
  }

  Container _bookmark(BuildContext context) {
    return _button(
      title: Text(
        Utils.getLocaleMessage(LocaleKeys.drawerBookmarkTitle),
        style: AppTextStyle.mediumItalic.s16,
      ),
      icon: SvgPicture.asset(
        AppSvgIcons.bookmark,
        colorFilter: ColorFilter.mode(
          Theme.of(context).colorScheme.primary,
          BlendMode.srcIn,
        ),
      ),
      onPress: () {
        scaffoldBottomNavigationKey.currentState?.closeDrawer();
        context.router.navigateNamed(SaveJobScreen.path);
      },
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
              style: AppTextStyle.bold.s22,
            ),
            Text(
              Utils.getLocaleMessage(LocaleKeys.settingLogoutModalSubTitle),
              style: AppTextStyle.regular.s14,
            ),
            const SizedBox(height: 30),
            Container(
              margin: const EdgeInsets.only(left: 25, right: 25),
              child: CustomButton(
                title: Text(
                  Utils.getLocaleMessage(
                    LocaleKeys.yesButtonTitle,
                  ),
                  style: AppTextStyle.bold.s14.copyWith(color: AppColors.white),
                ),
                backgroundColor: Theme.of(context).colorScheme.onBackground,
                onPressed: () {
                  ref.read(authControllerProvider.notifier).onLogOut();
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 25,
                right: 25,
                top: 10,
                bottom: 20,
              ),
              child: CustomButton(
                title: Text(
                  Utils.getLocaleMessage(
                    LocaleKeys.cancelButtonTitle,
                  ),
                  style: AppTextStyle.bold.s14.copyWith(color: AppColors.white),
                ),
                backgroundColor: Theme.of(context).colorScheme.primary,
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

  Widget _userInfo(BuildContext context) {
    final UserEntity? userData = ref.watch(authControllerProvider);

    return SizedBox(
      height: 155 + MediaQuery.of(context).padding.top,
      child: Stack(
        children: [
          BackgroundImage(
            imageUrl: userData?.backgroundUrl,
            // radius: 0,
          ),
          Container(
            margin: EdgeInsets.only(
              left: 15,
              right: 15,
              top: MediaQuery.of(context).padding.top,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipOval(
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        color: Theme.of(context).colorScheme.background,
                        child: AvatarImage(
                          avatarLink: userData?.photoUrl,
                          size: 80,
                          onTab: () {
                            context.router.pop();
                            context.router.navigateNamed(ProfileScreen.path);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    userData?.userName ?? "",
                    style: AppTextStyle.boldItalic.white18,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    userData?.email ?? "",
                    style: AppTextStyle.mediumItalic.s12,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container _button({
    required Widget icon,
    required Function() onPress,
    required Widget title,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          padding: EdgeInsets.zero,
        ),
        onPressed: onPress,
        child: Row(
          children: [
            const SizedBox(width: 10),
            icon,
            const SizedBox(width: 10),
            title,
          ],
        ),
      ),
    );
  }
}
