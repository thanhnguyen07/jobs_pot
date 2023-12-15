import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jobs_pot/common/constant/app_colors.dart';
import 'package:jobs_pot/common/constant/app_icons.dart';
import 'package:jobs_pot/common/constant/app_text_styles.dart';
import 'package:jobs_pot/common/widgets/avatar_image.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/features/authentication/domain/entities/User/user_entity.dart';
import 'package:jobs_pot/features/home/home_porvider.dart';
import 'package:jobs_pot/features/home/presentation/widget/button_jobs.dart';
import 'package:jobs_pot/features/home/presentation/widget/coupon_card.dart';
import 'package:jobs_pot/features/home/presentation/widget/recent_job_list.dart';
import 'package:jobs_pot/features/profile/presentation/screens/profile_screen.dart';
import 'package:jobs_pot/features/save_job/presentation/screens/save_job_screen.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/system/system_providers.dart';
import 'package:jobs_pot/utils/utils.dart';

@RoutePage()
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: null);

  static const String path = 'HomeScreen';

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    ref.read(jobsSummaryController.notifier).getJobsSummary();
    ref.read(recentListController.notifier).getRecentList();

    super.initState();
  }

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    ref.watch(languageControllerProvider);

    return Scaffold(
      key: _scaffoldKey,
      drawerEnableOpenDragGesture: false,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
          ],
        ),
      ),
      body: Container(
        color: AppColors.backgroundColor,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _header(context),
              CouponCard(
                onPress: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
              ),
              const FindYouJob(),
              const RecentRemoteJob(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    final UserEntity? userData = ref.watch(authControllerProvider);
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
            child: SvgPicture.asset(
              AppSvgIcons.barsSort,
            ),
          ),
          Row(
            children: [
              Row(
                children: [
                  Text(
                    Utils.getLocaleMessage(LocaleKeys.homeHelloTitle),
                    style: AppTextStyle.boldItalic.black18,
                  ),
                  const SizedBox(width: 5),
                  Image.asset(
                    AppPngIcons.hello,
                    width: 20,
                    height: 20,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 10),
                ],
              ),
              GestureDetector(
                onTap: () {
                  context.router.navigateNamed(ProfileScreen.path);
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 20),
                  child: AvatarImage(
                    avatarLink: userData?.photoUrl,
                    size: 40,
                    edit: false,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
