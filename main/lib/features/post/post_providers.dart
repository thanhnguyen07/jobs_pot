import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jobs_pot/features/post/application/post_controller.dart';

final postControllerProvider = StateNotifierProvider<PostController, dynamic>(
  (ref) => PostController(ref),
);
