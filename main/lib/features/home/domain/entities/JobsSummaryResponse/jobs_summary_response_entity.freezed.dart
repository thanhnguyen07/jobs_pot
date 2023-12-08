// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'jobs_summary_response_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

JobsSummaryResponseEntity _$JobsSummaryResponseEntityFromJson(
    Map<String, dynamic> json) {
  return _JobsSummaryResponseEntity.fromJson(json);
}

/// @nodoc
mixin _$JobsSummaryResponseEntity {
  JobsSummaryEntity get results => throw _privateConstructorUsedError;
  String get msg => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JobsSummaryResponseEntityCopyWith<JobsSummaryResponseEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JobsSummaryResponseEntityCopyWith<$Res> {
  factory $JobsSummaryResponseEntityCopyWith(JobsSummaryResponseEntity value,
          $Res Function(JobsSummaryResponseEntity) then) =
      _$JobsSummaryResponseEntityCopyWithImpl<$Res, JobsSummaryResponseEntity>;
  @useResult
  $Res call({JobsSummaryEntity results, String msg});

  $JobsSummaryEntityCopyWith<$Res> get results;
}

/// @nodoc
class _$JobsSummaryResponseEntityCopyWithImpl<$Res,
        $Val extends JobsSummaryResponseEntity>
    implements $JobsSummaryResponseEntityCopyWith<$Res> {
  _$JobsSummaryResponseEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
    Object? msg = null,
  }) {
    return _then(_value.copyWith(
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as JobsSummaryEntity,
      msg: null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $JobsSummaryEntityCopyWith<$Res> get results {
    return $JobsSummaryEntityCopyWith<$Res>(_value.results, (value) {
      return _then(_value.copyWith(results: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$JobsSummaryResponseEntityImplCopyWith<$Res>
    implements $JobsSummaryResponseEntityCopyWith<$Res> {
  factory _$$JobsSummaryResponseEntityImplCopyWith(
          _$JobsSummaryResponseEntityImpl value,
          $Res Function(_$JobsSummaryResponseEntityImpl) then) =
      __$$JobsSummaryResponseEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({JobsSummaryEntity results, String msg});

  @override
  $JobsSummaryEntityCopyWith<$Res> get results;
}

/// @nodoc
class __$$JobsSummaryResponseEntityImplCopyWithImpl<$Res>
    extends _$JobsSummaryResponseEntityCopyWithImpl<$Res,
        _$JobsSummaryResponseEntityImpl>
    implements _$$JobsSummaryResponseEntityImplCopyWith<$Res> {
  __$$JobsSummaryResponseEntityImplCopyWithImpl(
      _$JobsSummaryResponseEntityImpl _value,
      $Res Function(_$JobsSummaryResponseEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
    Object? msg = null,
  }) {
    return _then(_$JobsSummaryResponseEntityImpl(
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as JobsSummaryEntity,
      msg: null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$JobsSummaryResponseEntityImpl implements _JobsSummaryResponseEntity {
  const _$JobsSummaryResponseEntityImpl(
      {required this.results, required this.msg});

  factory _$JobsSummaryResponseEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$JobsSummaryResponseEntityImplFromJson(json);

  @override
  final JobsSummaryEntity results;
  @override
  final String msg;

  @override
  String toString() {
    return 'JobsSummaryResponseEntity(results: $results, msg: $msg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JobsSummaryResponseEntityImpl &&
            (identical(other.results, results) || other.results == results) &&
            (identical(other.msg, msg) || other.msg == msg));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, results, msg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JobsSummaryResponseEntityImplCopyWith<_$JobsSummaryResponseEntityImpl>
      get copyWith => __$$JobsSummaryResponseEntityImplCopyWithImpl<
          _$JobsSummaryResponseEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JobsSummaryResponseEntityImplToJson(
      this,
    );
  }
}

abstract class _JobsSummaryResponseEntity implements JobsSummaryResponseEntity {
  const factory _JobsSummaryResponseEntity(
      {required final JobsSummaryEntity results,
      required final String msg}) = _$JobsSummaryResponseEntityImpl;

  factory _JobsSummaryResponseEntity.fromJson(Map<String, dynamic> json) =
      _$JobsSummaryResponseEntityImpl.fromJson;

  @override
  JobsSummaryEntity get results;
  @override
  String get msg;
  @override
  @JsonKey(ignore: true)
  _$$JobsSummaryResponseEntityImplCopyWith<_$JobsSummaryResponseEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
