import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jobs_pot/features/home/domain/entities/Salary/salary_entity.dart';

part 'recent_list_entity.freezed.dart';
part 'recent_list_entity.g.dart';

@freezed
class RecentListEntity with _$RecentListEntity {
  const factory RecentListEntity({
    @JsonKey(name: "_id") required String id,
    @JsonKey(name: "job_name") required String jobName,
    @JsonKey(name: "company_name") required String companyName,
    @JsonKey(name: "company_address") required String companyAddress,
    @JsonKey(name: "company_avatar") required String companyAvatar,
    required SalaryEntity salary,
    required List<String> tags,
  }) = _RecentListEntity;

  factory RecentListEntity.fromJson(Map<String, dynamic> json) =>
      _$RecentListEntityFromJson(json);
}
