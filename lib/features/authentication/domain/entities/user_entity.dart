import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

@freezed

/// Auth user entity
class UserEntity with _$UserEntity {
  @JsonSerializable(fieldRename: FieldRename.snake)

  /// Factory Constructor
  const factory UserEntity({
    required String id,
    required int accountId,
    String? firstname,
    String? lastname,
    required String email,
    required String type,
    required String timezone,
    int? offset,
    String? registrationDate,
    String? avatar,
    String? lastLogin,
    String? company,
    String? lang,
    String? companyCreated,
    int? companyNumberOfVehicles,
    int? vehicleGpsId,
  }) = _UserEntity;

  /// factory method to create entity from JSON
  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);
}
