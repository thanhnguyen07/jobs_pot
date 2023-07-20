import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobs_pot/common/app_icons.dart';
import 'package:jobs_pot/common/app_images.dart';
import 'package:jobs_pot/common/app_text_styles.dart';
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
  Container _userName(String userName) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Text(
        userName,
        style: AppTextStyle.whiteMediumS14,
      ),
    );
  }

  Widget _location() {
    return const Text(
      'location',
      style: AppTextStyle.whiteRegularS12,
    );
  }

  Widget _avatarUser(String? avatarLink) {
    return ClipOval(
      child: Image.network(
        avatarLink!,
        width: 60,
        height: 60,
        fit: BoxFit.cover,
      ),
    );
  }

  ElevatedButton _buttonChangeImage() {
    return ElevatedButton(
      onPressed: () async {
        await ref.read(profileControllerProvider.notifier).updateAvatar();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white.withOpacity(0.2),
      ),
      child: Text(
        Utils.getLocaleMessage(LocaleKeys.profileChangeImageTitle),
        style: AppTextStyle.whiteRegularS12,
      ),
    );
  }

  GestureDetector _setingButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.navigateNamed(SettingScreen.path);
      },
      child: SvgPicture.asset(
        AppIcons.setting,
        width: 25,
        height: 25,
      ),
    );
  }

  GestureDetector _shareButton() {
    return GestureDetector(
      onTap: () {},
      child: SvgPicture.asset(
        AppIcons.share,
        width: 25,
        height: 25,
        colorFilter: const ColorFilter.mode(
          Colors.white,
          BlendMode.srcIn,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final UserEntity? userData = ref.watch(authControllerProvider);
    ref.watch(languageControllerProvider);

    return Stack(
      children: [
        Image.asset(AppImages.cardBackground2),
        Container(
          margin: const EdgeInsets.only(top: 50, right: 20, left: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _avatarUser(userData?.avatarLink),
                  _userName(userData?.userName ?? ''),
                  _location(),
                  const SizedBox(height: 10),
                  _buttonChangeImage()
                ],
              ),
              Row(
                children: [
                  _shareButton(),
                  const SizedBox(width: 15),
                  _setingButton(context),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
