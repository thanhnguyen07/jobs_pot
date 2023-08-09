import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
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
    final UserEntity? userData = ref.watch(authControllerProvider);
    ref.watch(languageControllerProvider);
    bool editProfileState = ref.watch(profileControllerProvider);

    return Stack(
      children: [
        Image.asset(
          AppImages.cardBackground2,
          fit: BoxFit.fitHeight,
        ),
        Container(
          margin: const EdgeInsets.only(top: 50, right: 20, left: 20),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _avatarUser(userData?.avatarLink),
                  _userName(userData?.userName ?? ''),
                  _customText2(
                    userData?.dateOfBirth?.split(' ')[0] != null
                        ? LocaleKeys.profileCardDateOfBirthTitle.plural(
                            0,
                            args: [userData!.dateOfBirth!.split(' ')[0]],
                          )
                        : null,
                  ),
                  _customText2(
                    userData?.gender != null
                        ? LocaleKeys.profileCardGenderTitle
                            .plural(0, args: [userData!.gender!])
                        : null,
                  ),
                  _customText2(
                    userData?.email != null
                        ? LocaleKeys.profileCardEmailTitle
                            .plural(0, args: [userData!.email])
                        : null,
                  ),
                  _customText2(
                    userData?.phoneNumber != null
                        ? LocaleKeys.profileCardPhoneTitle
                            .plural(0, args: [userData!.phoneNumber!])
                        : null,
                  ),
                  _customText2(
                    userData?.location != null
                        ? LocaleKeys.profileCardLocationTitle
                            .plural(0, args: [userData!.location!])
                        : null,
                  ),
                ],
              ),
              _buttonActions(context, editProfileState)
            ],
          ),
        ),
      ],
    );
  }

  SizedBox _buttonActions(BuildContext context, bool editProfileState) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _customButton(
                onTab: () {
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                  ref
                      .read(profileControllerProvider.notifier)
                      .changeEditProfile();
                  if (!editProfileState) {
                    ref.read(profileControllerProvider.notifier).clearInput();
                  }
                },
                iconPath: AppIcons.edit,
                colorFilter: ColorFilter.mode(
                  editProfileState ? Colors.white : AppColors.fireYellowColor,
                  BlendMode.srcIn,
                ),
              ),
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
              editProfileState ? const SizedBox() : _buttonChangeImage(),
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
        style: AppTextStyle.whiteMediumS14,
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

  Widget _avatarUser(String? avatarLink) {
    return AvatarImage(
      size: 60,
      avatarLink: avatarLink,
    );
  }

  ElevatedButton _buttonChangeImage() {
    return ElevatedButton(
      onPressed: () async {
        await ref.read(profileControllerProvider.notifier).updateAvatar();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white.withOpacity(0.2),
        minimumSize: const Size(80, 30),
      ),
      child: Text(
        Utils.getLocaleMessage(LocaleKeys.profileChangeImageTitle),
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
