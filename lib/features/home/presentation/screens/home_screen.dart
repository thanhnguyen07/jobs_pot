import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/common/app_colors.dart';
import 'package:jobs_pot/common/app_images.dart';
import 'package:jobs_pot/common/app_text_styles.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/features/profile/presentation/screens/profile_screen.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:jobs_pot/system/system_providers.dart';
import 'package:jobs_pot/utils/utils.dart';

@RoutePage()
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String path = 'HomeScreen';

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    ref.watch(languageControllerProvider);

    String userName = ref.read(authControllerProvider.notifier).getUserName();

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _header(userName, context),
              _couponCard(),
              _findYourJobTitle(),
              SizedBox(
                height: 170,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.only(right: 15),
                        decoration: const BoxDecoration(
                          color: AppColors.babyBlueColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(6),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: const EdgeInsets.only(left: 15),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                decoration: const BoxDecoration(
                                  color: AppColors.purpleColor,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(6),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                margin: const EdgeInsets.only(top: 10),
                                decoration: const BoxDecoration(
                                  color: AppColors.amberColor,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(6),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container _findYourJobTitle() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Text(
        Utils.getLocaleMessage(LocaleKeys.homeFinJobTitle),
        style: AppTextStyle.blackBoldS16,
      ),
    );
  }

  Stack _couponCard() {
    return Stack(children: [
      SizedBox(
        height: 200,
        child: Image.asset(AppImages.cardDefault),
      ),
      Container(
        width: double.infinity,
        height: 200,
        margin: const EdgeInsets.only(left: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Text(
              LocaleKeys.homePercentSaleTitle.plural(50),
              style: AppTextStyle.whiteMediumS18,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(0, 30),
                backgroundColor: AppColors.fireYellowColor,
              ),
              child: Text(
                Utils.getLocaleMessage(LocaleKeys.homeJoinNowTitle),
              ),
            )
          ],
        ),
      ),
    ]);
  }

  Row _header(String userName, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _welcomeText(userName),
        _avatarUser(context),
      ],
    );
  }

  Container _avatarUser(BuildContext context) {
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
          child: Image.asset(
            AppImages.avatarDefautl,
            width: 40,
            height: 40,
          ),
        ),
      ),
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
