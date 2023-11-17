import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobs_pot/common/app_colors.dart';
import 'package:jobs_pot/common/app_icons.dart';
import 'package:jobs_pot/common/app_images.dart';
import 'package:jobs_pot/common/widgets/avatar_image.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/features/authentication/domain/entities/user_entity.dart';
import 'package:jobs_pot/features/profile/profile_provider.dart';

@RoutePage()
class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: null);

  static const String path = '/EditProfileScreen';

  @override
  ConsumerState<EditProfileScreen> createState() => _EditProfileState();
}

class _EditProfileState extends ConsumerState<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    UserEntity? userData = ref.watch(authControllerProvider);

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              _background(context),
              _buttonHeader(context),
              _userAvatar(userData),
            ],
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
        children: [
          Stack(
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
                    edit: true,
                    sizeEditIcon: 20,
                    onTab: () async {
                      await ref
                          .read(profileControllerProvider.notifier)
                          .updateAvatar();
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container _buttonHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: MediaQuery.of(context).padding.top,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _backButton(context),
          ClipOval(
            child: Container(
              color: AppColors.iconColor,
              padding: const EdgeInsets.all(3),
              child: SvgPicture.asset(
                width: 20,
                height: 20,
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
    );
  }

  SizedBox _background(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 175 + MediaQuery.of(context).padding.top,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(25)),
        child: Image.asset(
          AppImages.cardBackground2,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  GestureDetector _backButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.back();
      },
      child: SvgPicture.asset(
        AppIcons.back,
        colorFilter: const ColorFilter.mode(
          AppColors.whiteColor1,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
