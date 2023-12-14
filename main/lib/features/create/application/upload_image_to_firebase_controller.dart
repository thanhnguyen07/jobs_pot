import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jobs_pot/common/constant/app_keys.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/features/authentication/domain/entities/User/user_entity.dart';

class UploadImageToFirebaseControllef extends StateNotifier<List<String>?> {
  UploadImageToFirebaseControllef(this.ref) : super(null);
  final Ref ref;

  Future<void> uploadImages(List<XFile> imagesData) async {
    state = [];
    for (var imageFile in imagesData) {
      final String? imageLink = await uploadImageToFirebase(imageFile);
      if (imageLink != null) {
        if (state!.isNotEmpty) {
          final List<String> newData2 = [...state!];
          newData2.add(imageLink);
          state = newData2;
        } else {
          final List<String> newData = [];
          newData.add(imageLink);
          state = newData;
        }
      }
    }
  }

  Future<String?> uploadImageToFirebase(XFile imageFile) async {
    UserEntity? userData = ref.read(authControllerProvider);
    final File image = File(imageFile.path);
    try {
      String storagePath =
          "${FirebaseKeys.pathFolderPostImage}/${userData?.uid}/${imageFile.name}";

      Reference refStorage = FirebaseStorage.instance.ref().child(storagePath);

      UploadTask uploadTask = refStorage.putFile(image);

      final String imageLink = await (await uploadTask).ref.getDownloadURL();

      return imageLink;
    } catch (e) {
      return null;
    }
  }
}
