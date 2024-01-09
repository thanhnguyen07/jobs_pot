import 'package:freezed_annotation/freezed_annotation.dart';

part 'job_summary_entity.freezed.dart';
part 'job_summary_entity.g.dart';

@freezed

/// Auth user entity
class JobSummaryEntity with _$JobSummaryEntity {
  /// Factory Constructor
  const factory JobSummaryEntity({
    required String title,
    required int count,
  }) = _JobSummaryEntity;

  /// factory method to create entity from JSON
  factory JobSummaryEntity.fromJson(Map<String, dynamic> json) =>
      _$JobSummaryEntityFromJson(json);
}
