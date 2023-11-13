import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:jobs_pot/common/app_colors.dart';
// import 'package:jobs_pot/common/app_text_styles.dart';
// import 'package:jobs_pot/common/widgets/cutom_button.dart';
import 'package:jobs_pot/common/widgets/un_focus_keyboard.dart';
import 'package:jobs_pot/features/profile/presentation/widgets/profile_card.dart';
// import 'package:jobs_pot/features/profile/presentation/widgets/profile_input_form.dart';
// import 'package:jobs_pot/features/profile/profile_provider.dart';
// import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
// import 'package:jobs_pot/utils/utils.dart';

@RoutePage()
class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({Key? key}) : super(key: null);

  static const String path = '/ProfileScreen';

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    // bool editProfileState = ref.watch(profileControllerProvider);

    return UnFocusKeyboard(
      context: context,
      child: const Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(175),
          child: ProfileCard(),
        ),
        // body: SizedBox(
        //   width: double.infinity,
        //   height: double.infinity,
        //   child: SingleChildScrollView(
        //     physics: const BouncingScrollPhysics(),
        //     child: Column(
        //       children: [
        //         editProfileState ? const SizedBox() : const ProfileInputForm(),
        //         editProfileState ? const SizedBox() : _saveButton(context),
        //       ],
        //     ),
        //   ),
        // ),
      ),
    );
  }

  // Widget _saveButton(BuildContext context) {
  //   return Container(
  //     margin: const EdgeInsets.only(bottom: 30, left: 60, right: 60),
  //     child: CustomButton(
  //       title: Text(
  //         Utils.getLocaleMessage(LocaleKeys.profileSaveTitle),
  //         style: AppTextStyle.whiteBoldS14,
  //       ),
  //       backgroundColor: AppColors.egglantColor,
  //       onPressed: () {
  //         ref.read(profileControllerProvider.notifier).onSave();
  //       },
  //     ),
  //   );
  // }
}
