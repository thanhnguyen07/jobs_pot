import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

@freezed

/// Auth user entity
class UserEntity with _$UserEntity {
  /// Factory Constructor
  const factory UserEntity({
    required String id,
    required String userName,
    required String email,
    required String type,
    required String uid,
  }) = _UserEntity;

  /// factory method to create entity from JSON
  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);
}
