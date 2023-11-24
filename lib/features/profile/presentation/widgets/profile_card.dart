import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobs_pot/common/app_colors.dart';
import 'package:jobs_pot/common/app_icons.dart';
import 'package:jobs_pot/common/app_text_styles.dart';
import 'package:jobs_pot/common/widgets/avatar_image.dart';
import 'package:jobs_pot/common/widgets/bacground_image.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/features/authentication/domain/entities/user_entity.dart';
import 'package:jobs_pot/features/profile/presentation/screens/edit_profile.dart';
import 'package:jobs_pot/features/setting/presentation/screens/setting_screen.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/system/system_providers.dart';
import 'package:jobs_pot/utils/utils.dart';

class ProfileCard extends ConsumerStatefulWidget {
  const ProfileCard({
    super.key,
  });

  @override
  ConsumerState<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends ConsumerState<ProfileCard> {
  @override
  Widget build(BuildContext context) {
    UserEntity? userData = ref.watch(authControllerProvider);
    ref.watch(languageControllerProvider);
    return Stack(
      children: [
        _cardBackground(context, userData),
        _cardBody(context, userData),
      ],
    );
  }

  Container _cardBody(BuildContext context, UserEntity? userData) {
    return Container(
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top, right: 20, left: 20),
      child: Row(
        children: [
          _userInfo(userData),
          _buttonsAction(context),
        ],
      ),
    );
  }

  Expanded _buttonsAction(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(width: 15),
              // _customButton(
              //   onTab: () {},
              //   iconPath: AppIcons.share,
              //   colorFilter: const ColorFilter.mode(
              //     Colors.white,
              //     BlendMode.srcIn,
              //   ),
              // ),
              const SizedBox(width: 15),
              _customButton(
                onTab: () {
                  context.router.navigateNamed(SettingScreen.path);
                },
                iconPath: AppIcons.setting,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              _buttonEditProfile(context),
            ],
          )
        ],
      ),
    );
  }

  Column _userInfo(UserEntity? userData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _avatarUser(userData?.photoUrl),
        _userName(userData?.userName ?? ''),
      ],
    );
  }

  Widget _cardBackground(BuildContext context, UserEntity? userData) {
    return BackgroundImage(imageUrl: userData?.backgroundUrl);
  }

  Container _userName(String userName) {
    return Container(
      margin: const EdgeInsets.only(top: 5, bottom: 10),
      child: Text(
        userName,
        style: AppTextStyle.whiteBoldS14,
      ),
    );
  }

  Widget _avatarUser(String? avatarLink) {
    return AvatarImage(
      size: 80,
      avatarLink: avatarLink,
      edit: false,
    );
  }

  Widget _buttonEditProfile(BuildContext parentContext) {
    ref.watch(languageControllerProvider);
    return ElevatedButton.icon(
      onPressed: () {
        parentContext.router.navigateNamed(EditProfileScreen.path);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.darkPurpleColor.withOpacity(0.8),
        minimumSize: const Size(80, 30),
      ),
      icon: SvgPicture.asset(
        width: 20,
        height: 20,
        AppIcons.edit,
        colorFilter: const ColorFilter.mode(
          AppColors.whiteColor1,
          BlendMode.srcIn,
        ),
      ),
      label: Text(
        Utils.getLocaleMessage(LocaleKeys.profileEditProfileTitle),
        style: AppTextStyle.whiteRegularS12,
      ),
    );
  }

  Widget _customButton({
    required Function() onTab,
    required String iconPath,
    ColorFilter? colorFilter,
  }) {
    return TextButton(
      onPressed: onTab,
      style: TextButton.styleFrom(
        backgroundColor: AppColors.darkPurpleColor.withOpacity(0.8),
        minimumSize: const Size(30, 0),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
      ),
      child: SvgPicture.asset(
        iconPath,
        colorFilter: colorFilter,
      ),
    );
  }
}
