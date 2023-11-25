import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobs_pot/common/app_colors.dart';
import 'package:jobs_pot/common/app_icons.dart';
import 'package:jobs_pot/common/app_text_styles.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/utils/utils.dart';

class ModalBottomPhoto extends StatefulWidget {
  const ModalBottomPhoto({
    Key? key,
    required this.takePhoto,
    required this.pickFromGallery,
  }) : super(key: null);

  final Function()? takePhoto;
  final Function()? pickFromGallery;

  @override
  State<ModalBottomPhoto> createState() => _ModalBottomPhotoState();
}

class _ModalBottomPhotoState extends State<ModalBottomPhoto> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            Utils.getLocaleMessage(LocaleKeys.postAddImageTitle),
            style: AppTextStyle.blackBoldS16,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 80, vertical: 30),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: widget.takePhoto,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.babyBlueColor, // foreground
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AppIcons.camera,
                        width: 40,
                        height: 40,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        Utils.getLocaleMessage(LocaleKeys.postTakePictureTitle),
                        style: AppTextStyle.darkPurpleBoldS14,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: widget.pickFromGallery,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.babyBlueColor, // foreground
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AppIcons.picture,
                        width: 40,
                        height: 40,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        Utils.getLocaleMessage(
                            LocaleKeys.postPickFromGalleryTitle),
                        style: AppTextStyle.darkPurpleBoldS14,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    ;
  }
}
