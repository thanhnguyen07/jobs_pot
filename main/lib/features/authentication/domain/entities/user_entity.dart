// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jobs_pot/features/authentication/domain/entities/provider_info_entity.dart';

part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

@freezed
class UserEntity with _$UserEntity {
  const factory UserEntity({
    @JsonKey(name: "user_name") required String userName,
    required String email,
    required String uid,
    @JsonKey(name: "email_verified") required bool emailVerified,
    @JsonKey(name: "provider_data")
    required List<ProviderInfoEntity> providerData,
    @JsonKey(name: "fcm_token") String? fcmToken,
    @JsonKey(name: "photo_url") String? photoUrl,
    @JsonKey(name: "background_url") String? backgroundUrl,
    @JsonKey(name: "date_of_birth") String? dateOfBirth,
    String? gender,
    @JsonKey(name: "phone_number") String? phoneNumber,
    String? location,
    @JsonKey(name: "_id") required String id,
  }) = _UserEntity;

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);
}
