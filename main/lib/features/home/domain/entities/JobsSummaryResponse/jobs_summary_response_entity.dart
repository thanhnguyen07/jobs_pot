import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jobs_pot/features/home/domain/entities/JobsSummary/jobs_summary_entity.dart';

part 'jobs_summary_response_entity.freezed.dart';
part 'jobs_summary_response_entity.g.dart';

@freezed

/// Auth user entity
class JobsSummaryResponseEntity with _$JobsSummaryResponseEntity {
  /// Factory Constructor
  const factory JobsSummaryResponseEntity({
    required JobsSummaryEntity results,
    required String msg,
  }) = _JobsSummaryResponseEntity;

  /// factory method to create entity from JSON
  factory JobsSummaryResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$JobsSummaryResponseEntityFromJson(json);
}
