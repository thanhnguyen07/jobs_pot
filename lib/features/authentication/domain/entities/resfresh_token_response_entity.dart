import 'package:freezed_annotation/freezed_annotation.dart';
part 'resfresh_token_response_entity.freezed.dart';
part 'resfresh_token_response_entity.g.dart';

@freezed

/// Auth user entity
class RefreshTokenResponseEntity with _$RefreshTokenResponseEntity {
  /// Factory Constructor
  const factory RefreshTokenResponseEntity({
    required String? token,
    @JsonKey(name: "refresh_token") required String? refreshToken,
    String? msg,
  }) = _RefreshTokenResponseEntity;

  /// factory method to create entity from JSON
  factory RefreshTokenResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$RefreshTokenResponseEntityFromJson(json);
}
