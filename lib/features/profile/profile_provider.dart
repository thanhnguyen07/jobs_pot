import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/features/profile/application/edit_profile_controller.dart';
import 'package:jobs_pot/features/profile/application/profile_controller.dart';
import 'package:jobs_pot/features/profile/infrastructure/profile_respository.dart';

final profileResponsitoryProvider = Provider<ProfileResponsitory>(
  (ref) => ProfileResponsitory(),
);

final profileControllerProvider =
    AutoDisposeStateNotifierProvider<ProfileController, bool>(
  (ref) => ProfileController(ref),
);

final editProfileControllerProvider =
    StateNotifierProvider<EditProfileController, dynamic>(
  (ref) => EditProfileController(ref),
);
