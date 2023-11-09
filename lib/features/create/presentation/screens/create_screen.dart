import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/common/app_enum.dart';
import 'package:jobs_pot/features/create/presentation/screens/create_job_screen.dart';
import 'package:jobs_pot/features/home_stack/home_stack_provider.dart';

import 'create_post_screen.dart';

@RoutePage()
class CreateScreen extends ConsumerStatefulWidget {
  const CreateScreen({Key? key}) : super(key: null);

  static const String path = 'CreateJobScreen';

  @override
  ConsumerState<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends ConsumerState<CreateScreen> {
  @override
  Widget build(BuildContext context) {
    final CreateScreenType? createScreenType =
        ref.watch(bottomNavigationController);

    return createScreenType == CreateScreenType.post
        ? const CreatePostScreen()
        : const CreateJobScreen();
  }
}
