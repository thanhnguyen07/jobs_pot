import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/common/constant/app_enum.dart';
import 'package:jobs_pot/features/home_stack/application/bottom_navigation_controller.dart';

final bottomNavigationController =
    StateNotifierProvider<BottomNavigationController, CreateScreenType?>(
  (ref) => BottomNavigationController(ref),
);
