import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jobs_pot/common/app_enum.dart';
import 'package:jobs_pot/common/app_keys.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/features/authentication/domain/entities/user_entity.dart';
import 'package:jobs_pot/features/profile/profile_provider.dart';
import 'package:jobs_pot/utils/utils.dart';
import 'package:jobs_pot/utils/validation_schema.dart';
import 'package:mime/mime.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ProfileController extends StateNotifier<bool> {
  ProfileController(this.ref) : super(false);

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
      Utils.showToastMessage(l.error);
    }, (r) {
      ref.read(authControllerProvider.notifier).setDataUser(r.results);

      Utils.showToastMessage(r.msg);
    });
  }

  void showToastGeneralError() {
    Utils.showToastGeneralError();
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

  Future<void> updateImage(UploadImageType type) async {
    Utils.showLoading();
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? imageXFile =
          await picker.pickImage(source: ImageSource.gallery);
      if (imageXFile != null) {
        UserEntity? userData = ref.read(authControllerProvider);

        String typeName =
            type == UploadImageType.avatar ? "avatar" : "background";

        String fileExtension = imageXFile.name.split(".").last;

        String fileName = "$typeName.$fileExtension";

        String? originalFileMimeTye = lookupMimeType(imageXFile.path);

        if (originalFileMimeTye != null && userData != null) {
          List<String> originalFileMimeTyeList = originalFileMimeTye.split('/');

          Utils.showLoading();

          await uploadAvatarLinkOnServer(
            filePath: imageXFile.path,
            fileName: fileName,
            contentType: MediaType(
                originalFileMimeTyeList.first, originalFileMimeTyeList.last),
            id: userData.id,
          );

          Utils.hideLoading();
        } else {
          showToastGeneralError();
        }
      }
      Utils.hideLoading();
    } catch (e) {
      Utils.hideLoading();
      showToastGeneralError();
    }
  }

  Future<void> uploadAvatarLinkOnServer({
    required String filePath,
    required String fileName,
    required MediaType contentType,
    required String id,
  }) async {
    UserEntity? userData = ref.read(authControllerProvider);
    String? userId = userData?.id;
    if (userId != null) {
      final updateAvatarResult =
          await ref.read(profileResponsitoryProvider).updateImage(
                filePath: filePath,
                fileName: fileName,
                contentType: contentType,
                id: id,
              );
      updateAvatarResult.fold((l) {
        showToastGeneralError();
      }, (r) {
        ref.read(authControllerProvider.notifier).setDataUser(r.results);

        Utils.showToastMessage(r.msg);
      });
    } else {
      showToastGeneralError();
    }
  }
}
