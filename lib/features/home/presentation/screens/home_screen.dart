import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/common/app_colors.dart';
import 'package:jobs_pot/common/app_text_styles.dart';
import 'package:jobs_pot/common/widgets/avatar_image.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/features/authentication/domain/entities/user_entity.dart';
import 'package:jobs_pot/features/home/home_porvider.dart';
import 'package:jobs_pot/features/home/presentation/widget/button_jobs.dart';
import 'package:jobs_pot/features/home/presentation/widget/coupon_card.dart';
import 'package:jobs_pot/features/profile/presentation/screens/profile_screen.dart';
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

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(languageControllerProvider);

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          width: double.infinity,
          color: AppColors.whiteColor1,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _header(context),
                CouponCard(
                  onPress: () {},
                ),
                _customTitle(LocaleKeys.homeFindJobTitle),
                const ButtonJobs(),
                _customTitle(LocaleKeys.homeRecentFinJobTitle),
                Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container _customTitle(String localeKeys) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Text(
        Utils.getLocaleMessage(localeKeys),
        style: AppTextStyle.blackBoldS16,
      ),
    );
  }

  Row _header(BuildContext context) {
    final UserEntity? userData = ref.watch(authControllerProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _welcomeText(userData?.userName ?? ""),
        Container(
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
            child: AvatarImage(
              avatarLink: userData?.photoUrl,
              size: 40,
              edit: false,
            ),
          ),
        )
      ],
    );
  }

  Container _welcomeText(String userName) {
    return Container(
      margin: const EdgeInsets.only(top: 70),
      child: Text(
        plural(LocaleKeys.homeHelloTitle, 0, args: [userName]),
        style: AppTextStyle.egglantBoldS22,
      ),
    );
  }
}
