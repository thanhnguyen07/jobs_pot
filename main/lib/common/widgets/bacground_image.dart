import 'package:flutter/material.dart';
import 'package:jobs_pot/common/constant/app_colors.dart';
import 'package:jobs_pot/common/constant/app_images.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    super.key,
    required this.imageUrl,
    this.onTab,
    this.height = 175,
    this.radius = 25,
  });

  final String? imageUrl;
  final int height;
  final double radius;
  final void Function()? onTab;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
        width: double.infinity,
        height: height + MediaQuery.of(context).padding.top,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(radius),
            bottomRight: Radius.circular(radius),
          ),
          child: imageUrl == null
              ? _defautlAvatar()
              : Image.network(
                  imageUrl!,
                  fit: BoxFit.cover,
                  loadingBuilder: (BuildContext context, Widget widget,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return widget;
                    } else {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
    );
  }

  Image _defautlAvatar() {
    return Image.asset(
      AppImages.cardBackground2,
      fit: BoxFit.cover,
    );
  }
}
