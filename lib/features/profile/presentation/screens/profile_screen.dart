import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobs_pot/common/app_icons.dart';
import 'package:jobs_pot/common/app_images.dart';
import 'package:jobs_pot/features/setting/presentation/screens/setting_screen.dart';

@RoutePage()
class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  static const String path = '/ProfileScreen';

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(AppImages.cardBackground2),
              Container(
                margin: const EdgeInsets.only(top: 50, right: 20, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.router.back();
                      },
                      child: SvgPicture.asset(
                        AppIcons.back,
                        colorFilter: const ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                        width: 30,
                        height: 30,
                      ),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppIcons.share,
                          width: 25,
                          height: 25,
                          colorFilter: const ColorFilter.mode(
                              Colors.white, BlendMode.srcIn),
                        ),
                        const SizedBox(width: 15),
                        GestureDetector(
                          onTap: () {
                            context.router.navigateNamed(SettingScreen.path);
                          },
                          child: SvgPicture.asset(
                            AppIcons.setting,
                            width: 25,
                            height: 25,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
