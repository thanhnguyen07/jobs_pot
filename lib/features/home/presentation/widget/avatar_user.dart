import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jobs_pot/features/authentication/domain/entities/user_entity.dart';
import 'package:jobs_pot/features/profile/presentation/screens/profile_screen.dart';

class AvatarUser extends StatelessWidget {
  const AvatarUser({
    super.key,
    required this.context,
    this.userData,
  });

  final BuildContext context;
  final UserEntity? userData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50),
      child: TextButton(
        onPressed: () {
          context.router.navigateNamed(ProfileScreen.path);
        },
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        child: ClipOval(
          child: Image.network(
            userData!.avatarLink!,
            width: 40,
            height: 40,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
