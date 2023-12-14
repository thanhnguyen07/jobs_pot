import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/common/widgets/app_scaffold.dart';
import 'package:jobs_pot/features/profile/presentation/widgets/profile_card.dart';

@RoutePage()
class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({Key? key}) : super(key: null);

  static const String path = 'ProfileScreen';

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    // bool editProfileState = ref.watch(profileControllerProvider);

    return const AppScaffold(
      unFocusKeyboard: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(225),
        child: ProfileCard(),
      ),
      child: Column(
        children: [
          // editProfileState ? const SizedBox() : const ProfileInputForm(),
          // editProfileState ? const SizedBox() : _saveButton(context),
        ],
      ),
    );
  }
}
