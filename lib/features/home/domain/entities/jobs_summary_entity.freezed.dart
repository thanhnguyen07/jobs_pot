// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'jobs_summary_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

JobsSummaryEntity _$JobsSummaryEntityFromJson(Map<String, dynamic> json) {
  return _JobsSummaryEntity.fromJson(json);
}

/// @nodoc
mixin _$JobsSummaryEntity {
  JobSummaryEntity get fullTime => throw _privateConstructorUsedError;
  JobSummaryEntity get partTime => throw _privateConstructorUsedError;
  JobSummaryEntity get remoteJob => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JobsSummaryEntityCopyWith<JobsSummaryEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JobsSummaryEntityCopyWith<$Res> {
  factory $JobsSummaryEntityCopyWith(
          JobsSummaryEntity value, $Res Function(JobsSummaryEntity) then) =
      _$JobsSummaryEntityCopyWithImpl<$Res, JobsSummaryEntity>;
  @useResult
  $Res call(
      {JobSummaryEntity fullTime,
      JobSummaryEntity partTime,
      JobSummaryEntity remoteJob});

  $JobSummaryEntityCopyWith<$Res> get fullTime;
  $JobSummaryEntityCopyWith<$Res> get partTime;
  $JobSummaryEntityCopyWith<$Res> get remoteJob;
}

/// @nodoc
class _$JobsSummaryEntityCopyWithImpl<$Res, $Val extends JobsSummaryEntity>
    implements $JobsSummaryEntityCopyWith<$Res> {
  _$JobsSummaryEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullTime = null,
    Object? partTime = null,
    Object? remoteJob = null,
  }) {
    return _then(_value.copyWith(
      fullTime: null == fullTime
          ? _value.fullTime
          : fullTime // ignore: cast_nullable_to_non_nullable
              as JobSummaryEntity,
      partTime: null == partTime
          ? _value.partTime
          : partTime // ignore: cast_nullable_to_non_nullable
              as JobSummaryEntity,
      remoteJob: null == remoteJob
          ? _value.remoteJob
          : remoteJob // ignore: cast_nullable_to_non_nullable
              as JobSummaryEntity,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $JobSummaryEntityCopyWith<$Res> get fullTime {
    return $JobSummaryEntityCopyWith<$Res>(_value.fullTime, (value) {
      return _then(_value.copyWith(fullTime: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $JobSummaryEntityCopyWith<$Res> get partTime {
    return $JobSummaryEntityCopyWith<$Res>(_value.partTime, (value) {
      return _then(_value.copyWith(partTime: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $JobSummaryEntityCopyWith<$Res> get remoteJob {
    return $JobSummaryEntityCopyWith<$Res>(_value.remoteJob, (value) {
      return _then(_value.copyWith(remoteJob: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_JobsSummaryEntityCopyWith<$Res>
    implements $JobsSummaryEntityCopyWith<$Res> {
  factory _$$_JobsSummaryEntityCopyWith(_$_JobsSummaryEntity value,
          $Res Function(_$_JobsSummaryEntity) then) =
      __$$_JobsSummaryEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {JobSummaryEntity fullTime,
      JobSummaryEntity partTime,
      JobSummaryEntity remoteJob});

  @override
  $JobSummaryEntityCopyWith<$Res> get fullTime;
  @override
  $JobSummaryEntityCopyWith<$Res> get partTime;
  @override
  $JobSummaryEntityCopyWith<$Res> get remoteJob;
}

/// @nodoc
class __$$_JobsSummaryEntityCopyWithImpl<$Res>
    extends _$JobsSummaryEntityCopyWithImpl<$Res, _$_JobsSummaryEntity>
    implements _$$_JobsSummaryEntityCopyWith<$Res> {
  __$$_JobsSummaryEntityCopyWithImpl(
      _$_JobsSummaryEntity _value, $Res Function(_$_JobsSummaryEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullTime = null,
    Object? partTime = null,
    Object? remoteJob = null,
  }) {
    return _then(_$_JobsSummaryEntity(
      fullTime: null == fullTime
          ? _value.fullTime
          : fullTime // ignore: cast_nullable_to_non_nullable
              as JobSummaryEntity,
      partTime: null == partTime
          ? _value.partTime
          : partTime // ignore: cast_nullable_to_non_nullable
              as JobSummaryEntity,
      remoteJob: null == remoteJob
          ? _value.remoteJob
          : remoteJob // ignore: cast_nullable_to_non_nullable
              as JobSummaryEntity,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_JobsSummaryEntity implements _JobsSummaryEntity {
  const _$_JobsSummaryEntity(
      {required this.fullTime,
      required this.partTime,
      required this.remoteJob});

  factory _$_JobsSummaryEntity.fromJson(Map<String, dynamic> json) =>
      _$$_JobsSummaryEntityFromJson(json);

  @override
  final JobSummaryEntity fullTime;
  @override
  final JobSummaryEntity partTime;
  @override
  final JobSummaryEntity remoteJob;

  @override
  String toString() {
    return 'JobsSummaryEntity(fullTime: $fullTime, partTime: $partTime, remoteJob: $remoteJob)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_JobsSummaryEntity &&
            (identical(other.fullTime, fullTime) ||
                other.fullTime == fullTime) &&
            (identical(other.partTime, partTime) ||
                other.partTime == partTime) &&
            (identical(other.remoteJob, remoteJob) ||
                other.remoteJob == remoteJob));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, fullTime, partTime, remoteJob);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_JobsSummaryEntityCopyWith<_$_JobsSummaryEntity> get copyWith =>
      __$$_JobsSummaryEntityCopyWithImpl<_$_JobsSummaryEntity>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_JobsSummaryEntityToJson(
      this,
    );
  }
}

abstract class _JobsSummaryEntity implements JobsSummaryEntity {
  const factory _JobsSummaryEntity(
      {required final JobSummaryEntity fullTime,
      required final JobSummaryEntity partTime,
      required final JobSummaryEntity remoteJob}) = _$_JobsSummaryEntity;

  factory _JobsSummaryEntity.fromJson(Map<String, dynamic> json) =
      _$_JobsSummaryEntity.fromJson;

  @override
  JobSummaryEntity get fullTime;
  @override
  JobSummaryEntity get partTime;
  @override
  JobSummaryEntity get remoteJob;
  @override
  @JsonKey(ignore: true)
  _$$_JobsSummaryEntityCopyWith<_$_JobsSummaryEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
