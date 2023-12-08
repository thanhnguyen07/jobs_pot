// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jobs_pot/features/authentication/domain/entities/User/user_entity.dart';

part 'user_response_entity.freezed.dart';
part 'user_response_entity.g.dart';

@freezed

/// Auth user entity
class UserResponseEntity with _$UserResponseEntity {
  /// Factory Constructor
  const factory UserResponseEntity({
    required UserEntity results,
    required String? token,
    @JsonKey(name: "refresh_token") required String? refreshToken,
    required String msg,
  }) = _UserResponseEntity;

  /// factory method to create entity from JSON
  factory UserResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$UserResponseEntityFromJson(json);
}
