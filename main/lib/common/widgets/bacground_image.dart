import 'package:flutter/material.dart';
import 'package:jobs_pot/common/app_colors.dart';
import 'package:jobs_pot/common/app_images.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    super.key,
    required this.imageUrl,
    this.onTab,
  });

  final String? imageUrl;
  final void Function()? onTab;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: edit ? onTab : null,
      child: SizedBox(
        width: double.infinity,
        height: 175 + MediaQuery.of(context).padding.top,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
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
