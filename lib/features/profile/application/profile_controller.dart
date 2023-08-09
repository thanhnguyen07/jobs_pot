import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jobs_pot/common/app_keys.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/features/authentication/domain/entities/user_entity.dart';
import 'package:jobs_pot/features/profile/profile_provider.dart';
import 'package:jobs_pot/system/system_providers.dart';
import 'package:jobs_pot/utils/validation_schema.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ProfileController extends StateNotifier<bool> {
  ProfileController(this.ref) : super(true);

  final Ref ref;

  String? _dateOfBirth;
  String? _gender;
  String? _phoneNumber;

  String? getDateOfBirth() => _dateOfBirth;
  void setDateOfBirth(String? value) => _dateOfBirth = value;

  String? getGender() => _gender;
  void setGender(String? value) => _gender = value;

  String? getPhoneNumber() => _phoneNumber;
  void setPhoneNumber(String? value) => _phoneNumber = value;

  void changeEditProfile() {
    state = !state;
  }

  final _profileInputForm = FormGroup(
    {
      ValidationKeys.fullName: FormControl<String>(
        value: '',
        validators: [
          Validators.minLength(3),
        ],
        touched: true,
      ),
      ValidationKeys.email: FormControl<String>(
        value: '',
        validators: [emailValidatorSchema],
        touched: true,
      ),
      ValidationKeys.location: FormControl<String>(
        value: '',
        touched: true,
      ),
    },
  );

  void clearInput() {
    _profileInputForm.reset();
  }

  Future<void> onSave() async {
    FocusManager.instance.primaryFocus?.unfocus();

    String? email = getInputEmail();
    String? userName = getInputName();
    String? location = getInputLocation();
    String? dateOfBirth = getDateOfBirth();
    String? gender = getGender();
    String? phoneNumber = getPhoneNumber();

    final updateAvatarResult =
        await ref.read(profileResponsitoryProvider).updateInformations(
              email: email,
              userName: userName,
              location: location,
              dateOfBirth: dateOfBirth,
              gender: gender,
              phoneNumber: phoneNumber,
            );

    updateAvatarResult.fold((l) {
      ref.read(systemControllerProvider.notifier).showToastMessage(l.error);
    }, (r) {
      ref.read(profileControllerProvider.notifier).changeEditProfile();

      ref.read(authControllerProvider.notifier).setDataUser(r.results);

      ref.read(systemControllerProvider.notifier).showToastMessage(r.msg);
    });
  }

  FormGroup getProfileInputForm() => _profileInputForm;

  String? getInputName() {
    return _profileInputForm.controls[ValidationKeys.fullName]?.value
        ?.toString();
  }

  String? getInputEmail() {
    return _profileInputForm.controls[ValidationKeys.email]?.value?.toString();
  }

  String? getInputLocation() {
    return _profileInputForm.controls[ValidationKeys.location]?.value
        ?.toString();
  }

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
    UserEntity? userData = ref.read(authControllerProvider);

    ref.read(systemControllerProvider.notifier).showLoading();
    final File image = File(imageFile.path);
    try {
      String storagePath =
          "${FirebaseKeys.pathFolderAvatarImage}/${userData?.uid}.jpg";

      Reference refStorage = FirebaseStorage.instance.ref().child(storagePath);

      try {
        await refStorage.delete();
      } catch (e) {
        //
      }

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
