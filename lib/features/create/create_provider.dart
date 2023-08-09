import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import 'application/create_post_controller.dart';

final createPostController =
    StateNotifierProvider<CreatePostController, List<XFile>?>(
  (ref) => CreatePostController(ref),
);
