import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobs_pot/common/constant/app_colors.dart';
import 'package:jobs_pot/common/constant/app_icons.dart';
import 'package:jobs_pot/common/widgets/avatar_image.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:models/entities/user/user_entity.dart';
import 'package:jobs_pot/features/home_stack/home_stack_provider.dart';
import 'package:jobs_pot/features/home_stack/presentation/screens/drawer.dart';
import 'package:jobs_pot/routes/route_config.gr.dart';

@RoutePage()
class HomeStackScreen extends ConsumerStatefulWidget {
  const HomeStackScreen({Key? key}) : super(key: null);

  static const String path = '/HomeStackScreen';

  @override
  ConsumerState<HomeStackScreen> createState() => _HomeStackScreenState();
}

GlobalKey<ScaffoldState> scaffoldBottomNavigationKey =
    GlobalKey<ScaffoldState>();

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
      scaffoldKey: scaffoldBottomNavigationKey,
      drawer: const MyDrawer(),
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
                  .actionButtonCreate(context, () {
                tabsRouter.setActiveIndex(2);
              });
            }
          },
          showUnselectedLabels: false,
          items: [
            _homeIcon(),
            _postIcon(),
            _addIcon(context),
            _chatIcon(),
            _profileIcon(),
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

  Widget _svgAddIcon({bool activeIcon = false, BuildContext? context}) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: context != null
            ? Theme.of(context).colorScheme.primary
            : AppColors.egglantColor,
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(13),
      child: SvgPicture.asset(
        AppSvgIcons.add,
        colorFilter: ColorFilter.mode(
            activeIcon ? AppColors.fireYellowColor : AppColors.white,
            BlendMode.srcIn),
      ),
    );
  }

  BottomNavigationBarItem _profileIcon() {
    UserEntity? userData = ref.read(authControllerProvider);
    return BottomNavigationBarItem(
      label: '',
      icon: AvatarImage(
        avatarLink: userData?.photoUrl,
        size: 25,
      ),
      activeIcon: ClipOval(
        child: Container(
          width: 30,
          height: 30,
          color: AppColors.fireYellowColor,
          child: Center(
            child: AvatarImage(
              avatarLink: userData?.photoUrl,
              size: 25,
            ),
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _chatIcon() {
    return BottomNavigationBarItem(
      label: '',
      icon: _svgIcons(icon: AppSvgIcons.chat),
      activeIcon: _svgIcons(icon: AppSvgIcons.chat, activeIcon: true),
    );
  }

  BottomNavigationBarItem _addIcon(BuildContext context) {
    return BottomNavigationBarItem(
        label: '',
        icon: _svgAddIcon(context: context),
        activeIcon: _svgAddIcon(activeIcon: true));
  }

  BottomNavigationBarItem _postIcon() {
    return BottomNavigationBarItem(
      label: '',
      icon: _svgIcons(icon: AppSvgIcons.post),
      activeIcon: _svgIcons(icon: AppSvgIcons.post, activeIcon: true),
    );
  }

  BottomNavigationBarItem _homeIcon() {
    return BottomNavigationBarItem(
      label: '',
      icon: _svgIcons(icon: AppSvgIcons.home),
      activeIcon: _svgIcons(icon: AppSvgIcons.home, activeIcon: true),
    );
  }
}
