import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobs_pot/common/app_colors.dart';
import 'package:jobs_pot/common/app_icons.dart';
import 'package:jobs_pot/features/home_stack/home_stack_provider.dart';
import 'package:jobs_pot/routes/route_config.gr.dart';

@RoutePage()
class HomeStackScreen extends ConsumerStatefulWidget {
  const HomeStackScreen({Key? key}) : super(key: null);

  static const String path = '/HomeStackScreen';

  @override
  ConsumerState<HomeStackScreen> createState() => _HomeStackScreenState();
}

class _HomeStackScreenState extends ConsumerState<HomeStackScreen> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeRoute(),
        PostJobRoute(),
        CreateRoute(),
        ChatRoute(),
        ProfileRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: tabsRouter.activeIndex,
          onTap: (index) async {
            if (index != 2) {
              tabsRouter.setActiveIndex(index);
            } else {
              await ref
                  .read(bottomNavigationController.notifier)
                  .actionButtonCreate(context);
              tabsRouter.setActiveIndex(2);
            }
          },
          showUnselectedLabels: false,
          items: [
            _homeIcon(),
            _postIcon(),
            _addIcon(),
            _chatIcon(),
            _saveIcon(),
          ],
        );
      },
    );
  }

  Widget _svgIcons({required String icon, bool activeIcon = false}) {
    return SvgPicture.asset(
      icon,
      colorFilter: activeIcon
          ? const ColorFilter.mode(AppColors.fireYellowColor, BlendMode.srcIn)
          : null,
    );
  }

  Widget _svgAddIcon({bool activeIcon = false}) {
    return Container(
      width: 40,
      height: 40,
      decoration: const BoxDecoration(
        color: AppColors.egglantColor,
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(13),
      child: SvgPicture.asset(
        AppIcons.add,
        colorFilter: ColorFilter.mode(
            activeIcon ? AppColors.fireYellowColor : Colors.white,
            BlendMode.srcIn),
      ),
    );
  }

  BottomNavigationBarItem _saveIcon() {
    return BottomNavigationBarItem(
      label: '',
      icon: _svgIcons(icon: AppIcons.user),
      activeIcon: _svgIcons(icon: AppIcons.user, activeIcon: true),
    );
  }

  BottomNavigationBarItem _chatIcon() {
    return BottomNavigationBarItem(
      label: '',
      icon: _svgIcons(icon: AppIcons.chat),
      activeIcon: _svgIcons(icon: AppIcons.chat, activeIcon: true),
    );
  }

  BottomNavigationBarItem _addIcon() {
    return BottomNavigationBarItem(
        label: '',
        icon: _svgAddIcon(),
        activeIcon: _svgAddIcon(activeIcon: true));
  }

  BottomNavigationBarItem _postIcon() {
    return BottomNavigationBarItem(
      label: '',
      icon: _svgIcons(icon: AppIcons.post),
      activeIcon: _svgIcons(icon: AppIcons.post, activeIcon: true),
    );
  }

  BottomNavigationBarItem _homeIcon() {
    return BottomNavigationBarItem(
      label: '',
      icon: _svgIcons(icon: AppIcons.home),
      activeIcon: _svgIcons(icon: AppIcons.home, activeIcon: true),
    );
  }
}
