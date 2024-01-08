import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jobs_pot/common/constant/app_icons.dart';
import 'package:jobs_pot/common/constant/app_text_styles.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:models/entities/user/user_entity.dart';
import 'package:jobs_pot/features/home/home_porvider.dart';
import 'package:jobs_pot/features/home/presentation/widget/button_jobs.dart';
import 'package:jobs_pot/features/home/presentation/widget/coupon_card.dart';
import 'package:jobs_pot/features/home/presentation/widget/recent_job_list.dart';
import 'package:jobs_pot/features/home_stack/presentation/screens/bottom_navigation_screen.dart';
import 'package:i18n/i18n.dart';
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

  @override
  Widget build(BuildContext context) {
    ref.watch(languageControllerProvider);

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _header(context),
            CouponCard(
              onPress: () {},
            ),
            const FindYouJob(),
            const RecentRemoteJob(),
          ],
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    final UserEntity? userData = ref.watch(authControllerProvider);
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        left: 20,
        right: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              _menu(),
              const SizedBox(width: 10),
              _headerText(userData),
            ],
          ),
          _search(context)
        ],
      ),
    );
  }

  ElevatedButton _search(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(50, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: EdgeInsets.zero,
      ),
      child: SvgPicture.asset(
        AppSvgIcons.search,
        colorFilter: ColorFilter.mode(
          Theme.of(context).colorScheme.onBackground,
          BlendMode.srcIn,
        ),
      ),
    );
  }

  Column _headerText(UserEntity? userData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _helloText(),
        Text(
          userData!.userName,
          style: AppTextStyle.boldItalic.s18,
        ),
      ],
    );
  }

  ElevatedButton _menu() {
    return ElevatedButton(
      onPressed: () {
        scaffoldBottomNavigationKey.currentState?.openDrawer();
      },
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(50, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        padding: EdgeInsets.zero,
      ),
      child: SvgPicture.asset(
        AppSvgIcons.apps,
        colorFilter: ColorFilter.mode(
          Theme.of(context).colorScheme.onBackground,
          BlendMode.srcIn,
        ),
      ),
    );
  }

  Row _helloText() {
    return Row(
      children: [
        Text(
          Utils.getLocaleMessage(LocaleKeys.homeHelloTitle),
          style: AppTextStyle.mediumItalic.s16,
        ),
        const SizedBox(width: 5),
        Image.asset(
          AppPngIcons.hello,
          width: 20,
          height: 20,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
