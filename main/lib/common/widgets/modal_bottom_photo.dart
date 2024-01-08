import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobs_pot/common/constant/app_colors.dart';
import 'package:jobs_pot/common/constant/app_icons.dart';
import 'package:jobs_pot/common/constant/app_text_styles.dart';
import 'package:i18n/i18n.dart';
import 'package:jobs_pot/utils/utils.dart';

class ModalBottomPhoto extends StatefulWidget {
  const ModalBottomPhoto({
    Key? key,
    required this.takePhoto,
    required this.pickFromGallery,
    this.chooseColorFun,
  }) : super(key: null);

  final Function()? takePhoto;
  final Function()? pickFromGallery;
  final Function()? chooseColorFun;

  @override
  State<ModalBottomPhoto> createState() => _ModalBottomPhotoState();
}

class _ModalBottomPhotoState extends State<ModalBottomPhoto> {
  @override
  Widget build(BuildContext context) {
    bool checkChooseColor = widget.chooseColorFun != null;
    return SizedBox(
      height: checkChooseColor ? 300 : 225,
      child: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            Utils.getLocaleMessage(checkChooseColor
                ? LocaleKeys.postAddImageTitleWithColor
                : LocaleKeys.postAddImageTitle),
            style: AppTextStyle.bold.s16,
            textAlign: TextAlign.center,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 80, vertical: 30),
            child: Column(
              children: [
                _customButton(
                  textKey: LocaleKeys.postTakePictureTitle,
                  iconPath: AppSvgIcons.camera,
                  onPress: widget.takePhoto,
                ),
                const SizedBox(height: 10),
                _customButton(
                  textKey: LocaleKeys.postPickFromGalleryTitle,
                  iconPath: AppSvgIcons.picture,
                  onPress: widget.pickFromGallery,
                ),
                SizedBox(height: checkChooseColor ? 10 : 0),
                checkChooseColor
                    ? _customButton(
                        textKey: LocaleKeys.postChooseColorTitle,
                        iconPath: AppSvgIcons.swatches,
                        changeColor: true,
                        onPress: widget.chooseColorFun,
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ElevatedButton _customButton({
    required String textKey,
    required String iconPath,
    required void Function()? onPress,
    bool? changeColor,
  }) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.babyBlueColor,
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            iconPath,
            width: 40,
            height: 40,
            colorFilter: changeColor != null
                ? const ColorFilter.mode(
                    AppColors.fireYellowColor,
                    BlendMode.srcIn,
                  )
                : null,
          ),
          const SizedBox(width: 10),
          Text(
            Utils.getLocaleMessage(textKey),
            style: AppTextStyle.bold.s14,
          )
        ],
      ),
    );
  }
}
