import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobs_pot/common/constant/app_colors.dart';
import 'package:jobs_pot/common/constant/app_icons.dart';
import 'package:jobs_pot/common/constant/app_text_styles.dart';
import 'package:jobs_pot/common/widgets/avatar_image.dart';
import 'package:jobs_pot/common/widgets/bacground_image.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/features/authentication/domain/entities/User/user_entity.dart';
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
        _userAvatar(userData),
        _userName(context, userData),
        _buttonsAction(context, userData),
      ],
    );
  }

  Container _buttonsAction(BuildContext context, UserEntity? userData) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).padding.top,
        horizontal: 20,
      ),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _setttingButton(
            onTab: () {
              context.router.navigateNamed(SettingScreen.path);
            },
          ),
          _editButton(
            onTab: () {
              context.router.navigateNamed(EditProfileScreen.path);
            },
          ),
        ],
      ),
    );
  }

  SizedBox _userName(BuildContext context, UserEntity? userData) {
    return SizedBox(
      width: double.infinity,
      height: 210 + MediaQuery.of(context).padding.top,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(width: 50),
          Text(
            userData!.userName,
            style: AppTextStyle.darkPurpleBoldS18,
          ),
        ],
      ),
    );
  }

  Widget _userAvatar(UserEntity? userData) {
    return SizedBox(
      width: double.infinity,
      height: 225 + MediaQuery.of(context).padding.top,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                  child: Container(
                    color: AppColors.whiteColor1,
                    width: 110,
                    height: 110,
                  ),
                ),
                SizedBox(
                  width: 110,
                  height: 110,
                  child: Center(
                    child: AvatarImage(
                      size: 100,
                      avatarLink: userData?.photoUrl,
                      edit: false,
                      sizeEditIcon: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _cardBackground(BuildContext context, UserEntity? userData) {
    return BackgroundImage(imageUrl: userData?.backgroundUrl);
  }

  Widget _setttingButton({
    required Function() onTab,
  }) {
    return TextButton(
      onPressed: onTab,
      style: TextButton.styleFrom(
        backgroundColor: AppColors.darkPurpleColor.withOpacity(0.8),
        minimumSize: const Size(40, 40),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        padding: EdgeInsets.zero,
      ),
      child: SvgPicture.asset(
        AppSvgIcons.setting,
        colorFilter: const ColorFilter.mode(
          Colors.white,
          BlendMode.srcIn,
        ),
      ),
    );
  }

  Widget _editButton({
    required Function() onTab,
  }) {
    return TextButton(
      onPressed: onTab,
      style: TextButton.styleFrom(
        backgroundColor: AppColors.purple,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        padding: EdgeInsets.zero,
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        width: 150,
        child: Row(
          children: [
            Image.asset(
              AppPngIcons.userPen,
              width: 20,
              height: 20,
            ),
            const SizedBox(width: 10),
            Text(
              Utils.getLocaleMessage(LocaleKeys.profileEditProfileTitle),
              style: AppTextStyle.regular.black14,
            ),
          ],
        ),
      ),
    );
  }
}
