import 'package:flutter/material.dart';
import 'package:jobs_pot/common/app_images.dart';

class AvatarImage extends StatelessWidget {
  const AvatarImage({
    super.key,
    required this.avatarLink,
    required this.size,
  });

  final String? avatarLink;
  final double size;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: avatarLink == null
          ? Image.asset(
              AppImages.avatarDefautl,
              width: size,
              height: size,
            )
          : Image.network(
              avatarLink!,
              width: size,
              height: size,
              fit: BoxFit.cover,
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return Image.asset(
                  AppImages.avatarDefautl,
                  width: size,
                  height: size,
                );
              },
            ),
    );
  }
}
