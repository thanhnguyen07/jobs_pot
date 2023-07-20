import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/features/profile/profile_provider.dart';
import 'package:jobs_pot/system/system_providers.dart';

class ProfileController extends StateNotifier<dynamic> {
  ProfileController(this.ref) : super(null);

  final Ref ref;

  Future<void> updateAvatar() async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        uploadImageToFirebase(image);
      }
    } catch (e) {
      ref.read(systemControllerProvider.notifier).showToastGeneralError();
    }
  }

  Future<void> uploadImageToFirebase(XFile imageFile) async {
    ref.read(systemControllerProvider.notifier).showLoading();
    final File image = File(imageFile.path);
    try {
      String storagePath =
          'avatar_images/${DateTime.now().millisecondsSinceEpoch}.jpg';

      Reference refStorage = FirebaseStorage.instance.ref().child(storagePath);

      UploadTask uploadTask = refStorage.putFile(image);

      String downloadUrl = await (await uploadTask).ref.getDownloadURL();

      await uploadAvatarLinkOnServer(downloadUrl);

      ref.read(systemControllerProvider.notifier).hideLoading();
    } catch (e) {
      ref.read(systemControllerProvider.notifier).hideLoading();

      ref.read(systemControllerProvider.notifier).showToastGeneralError();
    }
  }

  Future<void> uploadAvatarLinkOnServer(String downloadUrl) async {
    final updateAvatarResult =
        await ref.read(profileResponsitoryProvider).updateAvatar(downloadUrl);

    updateAvatarResult.fold((l) {}, (r) {
      ref.read(authControllerProvider.notifier).setDataUser(r.results);

      ref.read(systemControllerProvider.notifier).showToastMessage(r.msg);
    });
  }
}
