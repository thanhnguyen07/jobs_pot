// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'salary_entity.freezed.dart';
part 'salary_entity.g.dart';

@freezed
class SalaryEntity with _$SalaryEntity {
  const factory SalaryEntity({
    @JsonKey(name: "amount_start") double? amountStart,
    @JsonKey(name: "amount_end") double? amountEnd,
    @JsonKey(name: "amount_avg") double? amountAvg,
    required String type,
    required String currency,
  }) = _SalaryEntity;

  factory SalaryEntity.fromJson(Map<String, dynamic> json) =>
      _$SalaryEntityFromJson(json);
}
