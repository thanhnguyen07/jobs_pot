import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jobs_pot/common/app_colors.dart';
import 'package:jobs_pot/common/app_icons.dart';
import 'package:jobs_pot/common/app_images.dart';
import 'package:jobs_pot/common/app_text_styles.dart';
import 'package:jobs_pot/common/widgets/avatar_image.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/features/authentication/domain/entities/user_entity.dart';
import 'package:jobs_pot/features/profile/profile_provider.dart';
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
    bool editProfileState = ref.watch(profileControllerProvider);

    return Stack(
      children: [
        Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 175 + MediaQuery.of(context).padding.top,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
                child: Image.asset(
                  AppImages.cardBackground2,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top, right: 20, left: 20),
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _avatarUser(userData?.photoUrl, false),
                    _userName(userData?.userName ?? ''),
                    _customText2(
                      userData?.email != null
                          ? LocaleKeys.profileCardEmailTitle
                              .plural(0, args: [userData!.email])
                          : null,
                    ),
                  ],
                ),
              ),
              _buttonActions(context, editProfileState)
            ],
          ),
        ),
      ],
    );
  }

  Widget _buttonActions(BuildContext context, bool editProfileState) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      margin: const EdgeInsets.only(bottom: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(width: 15),
              _customButton(
                onTab: () {},
                iconPath: AppIcons.share,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
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
              _buttonEditProfile(editProfileState, context),
            ],
          )
        ],
      ),
    );
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

  Widget _customText2(String? text) {
    return text != null
        ? Text(
            text,
            style: AppTextStyle.whiteRegularS12,
          )
        : const SizedBox();
  }

  Widget _avatarUser(String? avatarLink, bool editProfileState,
      [double? size]) {
    return AvatarImage(
      size: size ?? 60,
      avatarLink: avatarLink,
      edit: editProfileState,
      onTab: () async {
        await ref.read(profileControllerProvider.notifier).updateAvatar();
      },
    );
  }

  Widget _buttonEditProfile(bool editProfileState, BuildContext parentContext) {
    UserEntity? userData = ref.watch(authControllerProvider);
    ref.watch(languageControllerProvider);
    return ElevatedButton.icon(
      onPressed: () {
        ref.read(profileControllerProvider.notifier).changeEditProfile();
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 150),
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 175 + MediaQuery.of(parentContext).padding.top,
                        child: Stack(children: [
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(25)),
                            child: Image.asset(
                              AppImages.cardBackground2,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                ClipOval(
                                  child: Container(
                                    color: AppColors.fireYellowColor,
                                    padding: const EdgeInsets.all(2),
                                    child: SvgPicture.asset(
                                      width: 15,
                                      height: 15,
                                      AppIcons.pencil,
                                      colorFilter: const ColorFilter.mode(
                                        AppColors.whiteColor1,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                _avatarUser(userData?.photoUrl, true, 80)
                              ],
                            ),
                          ),
                        ]),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: editProfileState
            ? AppColors.fireYellowColor
            : Colors.white.withOpacity(0.2),
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

  GestureDetector _customButton({
    required Function() onTab,
    required String iconPath,
    ColorFilter? colorFilter,
  }) {
    return GestureDetector(
      onTap: () {
        onTab();
      },
      child: SvgPicture.asset(
        iconPath,
        colorFilter: colorFilter,
      ),
    );
  }
}
