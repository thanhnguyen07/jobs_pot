// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jobs_summary_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JobsSummaryResponseEntityImpl _$$JobsSummaryResponseEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$JobsSummaryResponseEntityImpl(
      results:
          JobsSummaryEntity.fromJson(json['results'] as Map<String, dynamic>),
      msg: json['msg'] as String,
    );

Map<String, dynamic> _$$JobsSummaryResponseEntityImplToJson(
        _$JobsSummaryResponseEntityImpl instance) =>
    <String, dynamic>{
      'results': instance.results,
      'msg': instance.msg,
    };
