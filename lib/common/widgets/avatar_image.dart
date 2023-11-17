import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobs_pot/common/app_colors.dart';
import 'package:jobs_pot/common/app_icons.dart';
import 'package:jobs_pot/common/app_images.dart';

class AvatarImage extends StatelessWidget {
  const AvatarImage({
    super.key,
    required this.avatarLink,
    required this.size,
    this.onTab,
    this.sizeEditIcon,
    required this.edit,
  });

  final String? avatarLink;
  final bool edit;
  final double size;
  final double? sizeEditIcon;
  final void Function()? onTab;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: edit ? onTab : null,
      child: Stack(
        children: [
          SizedBox(
            width: size,
            height: size,
            child: ClipOval(
              child: avatarLink == null
                  ? _defautlAvatar()
                  : Image.network(
                      avatarLink!,
                      width: size,
                      height: size,
                      fit: BoxFit.cover,
                      loadingBuilder: (BuildContext context, Widget widget,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          return widget;
                        } else {
                          return Stack(
                            children: [
                              SvgPicture.asset(
                                AppIcons.user,
                                width: size,
                                height: size,
                                colorFilter: const ColorFilter.mode(
                                  AppColors.fireYellowColor,
                                  BlendMode.srcIn,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.all(10),
                                child: const Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.egglantColor,
                                    strokeWidth: 2,
                                  ),
                                ),
                              ),
                            ],
                          );
                        }
                      },
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return _defautlAvatar();
                      },
                    ),
            ),
          ),
          edit
              ? SizedBox(
                  width: size,
                  height: size,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ClipOval(
                        child: Container(
                          color: AppColors.iconColor,
                          padding: const EdgeInsets.all(3),
                          child: SvgPicture.asset(
                            width: sizeEditIcon ?? 15,
                            height: sizeEditIcon ?? 15,
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
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  Image _defautlAvatar() {
    return Image.asset(
      AppImages.avatarDefautl,
      width: size,
      height: size,
    );
  }
}
