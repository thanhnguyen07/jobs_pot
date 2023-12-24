import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobs_pot/common/constant/app_colors.dart';
import 'package:jobs_pot/common/constant/app_icons.dart';
import 'package:jobs_pot/common/constant/app_text_styles.dart';
import 'package:jobs_pot/common/widgets/bacground_image.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/features/authentication/domain/entities/User/user_entity.dart';
import 'package:jobs_pot/features/save_job/presentation/screens/save_job_screen.dart';
import 'package:jobs_pot/features/setting/presentation/screens/setting_screen.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/utils/utils.dart';

class MyDrawer extends ConsumerStatefulWidget {
  const MyDrawer({Key? key}) : super(key: null);

  @override
  ConsumerState<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends ConsumerState<MyDrawer>
    with SingleTickerProviderStateMixin {
  static const _initialDelayTime = Duration(milliseconds: 300);
  static const _itemSlideTime = Duration(milliseconds: 700);
  static const _staggerTime = Duration(milliseconds: 400);
  static const _extendTime = Duration(milliseconds: 400);
  final _animationDuration =
      _initialDelayTime + (_staggerTime * 2) + _extendTime;

  late AnimationController _staggeredController;

  @override
  void initState() {
    super.initState();

    _staggeredController = AnimationController(
      vsync: this,
      duration: _animationDuration,
    )..forward();
  }

  @override
  void dispose() {
    _staggeredController.dispose();
    super.dispose();
  }

  Interval _createAnimationIntervals(int index) {
    final startTime = _initialDelayTime + (_staggerTime * index);
    final endTime = startTime + _itemSlideTime;
    return Interval(
      startTime.inMilliseconds / _animationDuration.inMilliseconds,
      endTime.inMilliseconds / _animationDuration.inMilliseconds,
    );
  }

  @override
  Widget build(BuildContext context) {
    final UserEntity? userData = ref.watch(authControllerProvider);

    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Drawer(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              backgroundColor: AppColors.backgroundColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BackgroundImage(
                    imageUrl: userData?.backgroundUrl,
                    radius: 0,
                  ),
                  _animatedButton(
                    context: context,
                    index: 0,
                    titleKey: LocaleKeys.drawerBookmarkTitle,
                    icon: AppSvgIcons.bookmark,
                    onPress: () {
                      context.router.navigateNamed(SaveJobScreen.path);
                    },
                  ),
                  // const Divider(),
                  _animatedButton(
                    context: context,
                    index: 1,
                    titleKey: LocaleKeys.settingTitle,
                    icon: AppSvgIcons.setting,
                    onPress: () {
                      context.router.navigateNamed(SettingScreen.path);
                    },
                  ),
                ],
              ),
            ),
          ),
          const Expanded(
            flex: 1,
            child: SizedBox(),
          )
        ],
      ),
    );
  }

  AnimatedBuilder _animatedButton({
    required BuildContext context,
    required int index,
    required String titleKey,
    required String icon,
    required Function() onPress,
  }) {
    return AnimatedBuilder(
      animation: _staggeredController,
      builder: (context, child) {
        final animationPercent = Curves.easeOut.transform(
          _createAnimationIntervals(index)
              .transform(_staggeredController.value),
        );
        final opacity = animationPercent;
        final slideDistance = (1.0 - animationPercent) * 300;
        return Opacity(
          opacity: opacity,
          child: Transform.translate(
            offset: Offset(slideDistance, 0),
            child: child,
          ),
        );
      },
      child: TextButton.icon(
        onPressed: onPress,
        icon: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: SvgPicture.asset(
            icon,
            width: 25,
            height: 25,
            colorFilter: const ColorFilter.mode(
              Colors.black,
              BlendMode.srcIn,
            ),
          ),
        ),
        label: Text(
          Utils.getLocaleMessage(titleKey),
          style: AppTextStyle.mediumItalic.black16,
        ),
      ),
    );
  }
}
