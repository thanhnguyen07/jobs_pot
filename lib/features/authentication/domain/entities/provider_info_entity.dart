import 'package:freezed_annotation/freezed_annotation.dart';

part 'provider_info_entity.freezed.dart';
part 'provider_info_entity.g.dart';

@freezed
class ProviderInfoEntity with _$ProviderInfoEntity {
  const factory ProviderInfoEntity({
    String? uid,
    String? displayName,
    required String email,
    String? photoURL,
    required String providerId,
    String? phoneNumber,
  }) = _ProviderInfoEntity;

  factory ProviderInfoEntity.fromJson(Map<String, dynamic> json) =>
      _$ProviderInfoEntityFromJson(json);
}
