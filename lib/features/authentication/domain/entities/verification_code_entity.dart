import 'package:freezed_annotation/freezed_annotation.dart';
part 'verification_code_entity.freezed.dart';
part 'verification_code_entity.g.dart';

@freezed

/// Auth user entity
class VerificationCodeEntity with _$VerificationCodeEntity {
  /// Factory Constructor
  const factory VerificationCodeEntity({
    required String msg,
  }) = _VerificationCodeEntity;

  /// factory method to create entity from JSON
  factory VerificationCodeEntity.fromJson(Map<String, dynamic> json) =>
      _$VerificationCodeEntityFromJson(json);
}
