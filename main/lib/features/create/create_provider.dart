import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jobs_pot/features/create/application/upload_image_to_firebase_controller.dart';

import 'application/create_post_controller.dart';

final createPostController =
    StateNotifierProvider<CreatePostController, List<XFile>?>(
  (ref) => CreatePostController(ref),
);

final uploadImageToFirebaseController =
    StateNotifierProvider<UploadImageToFirebaseControllef, List<String>?>(
  (ref) => UploadImageToFirebaseControllef(ref),
);
