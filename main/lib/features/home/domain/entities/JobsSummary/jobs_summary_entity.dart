import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jobs_pot/features/home/domain/entities/JobSummary/job_summary_entity.dart';

part 'jobs_summary_entity.freezed.dart';
part 'jobs_summary_entity.g.dart';

@freezed

/// Auth user entity
class JobsSummaryEntity with _$JobsSummaryEntity {
  /// Factory Constructor
  const factory JobsSummaryEntity({
    required JobSummaryEntity fullTime,
    required JobSummaryEntity partTime,
    required JobSummaryEntity remoteJob,
  }) = _JobsSummaryEntity;

  /// factory method to create entity from JSON
  factory JobsSummaryEntity.fromJson(Map<String, dynamic> json) =>
      _$JobsSummaryEntityFromJson(json);
}
