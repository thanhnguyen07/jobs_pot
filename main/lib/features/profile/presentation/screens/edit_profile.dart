import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobs_pot/common/constant/app_colors.dart';
import 'package:jobs_pot/common/constant/app_enum.dart';
import 'package:jobs_pot/common/constant/app_icons.dart';
import 'package:jobs_pot/common/constant/app_text_styles.dart';
import 'package:jobs_pot/common/widgets/app_scaffold.dart';
import 'package:jobs_pot/common/widgets/avatar_image.dart';
import 'package:jobs_pot/common/widgets/bacground_image.dart';
import 'package:jobs_pot/common/widgets/modal_bottom_photo.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:models/entities/user/user_entity.dart';
import 'package:jobs_pot/features/profile/presentation/widgets/edit_profile_input_form.dart';
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
  void initState() {
    ref.read(authControllerProvider.notifier).getUserProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      unFocusKeyboard: true,
      scroll: true,
      physicsScroll: const ClampingScrollPhysics(),
      child: _body(context),
    );
  }

  Column _body(BuildContext context) {
    UserEntity? userData = ref.watch(authControllerProvider);

    return Column(
      children: [
        Stack(
          children: [
            _background(context, userData),
            _buttonHeader(context),
            _userAvatar(userData),
            _userName(context, userData),
          ],
        ),
        const SizedBox(height: 10),
        const ProfileInputForm()
      ],
    );
  }

  SizedBox _userName(BuildContext context, UserEntity? userData) {
    return SizedBox(
      width: double.infinity,
      height: 225 + MediaQuery.of(context).padding.top,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 12),
            child: Text(
              userData!.userName,
              style: AppTextStyle.bold.s18,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _chooseColor({
    required BuildContext context,
  }) {
    return showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Column(
            children: [
              Text(
                'Choose a Color',
                style: AppTextStyle.bold.s18,
              ),
              Expanded(
                flex: 1,
                child: SizedBox(
                  width: 300,
                  child: GridView.builder(
                    physics: const ClampingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                    ),
                    itemCount: AppColors.colorList.length,
                    itemBuilder: (context, index) {
                      Color color = AppColors.colorList[index];
                      return TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
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
                    color: Theme.of(context).colorScheme.background,
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
                        await showModalBottomSheet<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return ModalBottomPhoto(
                              takePhoto: () {},
                              pickFromGallery: () async {
                                Navigator.pop(context);
                                await ref
                                    .read(profileControllerProvider.notifier)
                                    .updateImage(UploadImageType.avatar);
                              },
                            );
                          },
                        );
                      },
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
          _editBackground(),
        ],
      ),
    );
  }

  Widget _editBackground() {
    return ElevatedButton(
      onPressed: () async {
        await showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return ModalBottomPhoto(
              takePhoto: () {},
              chooseColorFun: () {
                _chooseColor(context: context);
              },
              pickFromGallery: () async {
                Navigator.pop(context);
                await ref
                    .read(profileControllerProvider.notifier)
                    .updateImage(UploadImageType.background);
              },
            );
          },
        );
      },
      style: TextButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.background,
        minimumSize: const Size(30, 30),
        padding: EdgeInsets.zero,
      ),
      child: SvgPicture.asset(
        width: 20,
        height: 20,
        AppSvgIcons.pencil,
        colorFilter: ColorFilter.mode(
          Theme.of(context).colorScheme.onBackground,
          BlendMode.srcIn,
        ),
      ),
    );
  }

  Widget _background(BuildContext context, UserEntity? userData) {
    return BackgroundImage(imageUrl: userData?.backgroundUrl);
  }

  Widget _backButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.router.back();
      },
      style: TextButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.background,
        minimumSize: const Size(40, 30),
        padding: EdgeInsets.zero,
      ),
      child: SvgPicture.asset(
        AppSvgIcons.back,
        colorFilter: ColorFilter.mode(
          Theme.of(context).colorScheme.onBackground,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
