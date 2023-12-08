// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_summary_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

JobSummaryEntity _$JobSummaryEntityFromJson(Map<String, dynamic> json) {
  return _JobSummaryEntity.fromJson(json);
}

/// @nodoc
mixin _$JobSummaryEntity {
  String get title => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JobSummaryEntityCopyWith<JobSummaryEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JobSummaryEntityCopyWith<$Res> {
  factory $JobSummaryEntityCopyWith(
          JobSummaryEntity value, $Res Function(JobSummaryEntity) then) =
      _$JobSummaryEntityCopyWithImpl<$Res, JobSummaryEntity>;
  @useResult
  $Res call({String title, int count});
}

/// @nodoc
class _$JobSummaryEntityCopyWithImpl<$Res, $Val extends JobSummaryEntity>
    implements $JobSummaryEntityCopyWith<$Res> {
  _$JobSummaryEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? count = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$JobSummaryEntityImplCopyWith<$Res>
    implements $JobSummaryEntityCopyWith<$Res> {
  factory _$$JobSummaryEntityImplCopyWith(_$JobSummaryEntityImpl value,
          $Res Function(_$JobSummaryEntityImpl) then) =
      __$$JobSummaryEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, int count});
}

/// @nodoc
class __$$JobSummaryEntityImplCopyWithImpl<$Res>
    extends _$JobSummaryEntityCopyWithImpl<$Res, _$JobSummaryEntityImpl>
    implements _$$JobSummaryEntityImplCopyWith<$Res> {
  __$$JobSummaryEntityImplCopyWithImpl(_$JobSummaryEntityImpl _value,
      $Res Function(_$JobSummaryEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? count = null,
  }) {
    return _then(_$JobSummaryEntityImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$JobSummaryEntityImpl implements _JobSummaryEntity {
  const _$JobSummaryEntityImpl({required this.title, required this.count});

  factory _$JobSummaryEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$JobSummaryEntityImplFromJson(json);

  @override
  final String title;
  @override
  final int count;

  @override
  String toString() {
    return 'JobSummaryEntity(title: $title, count: $count)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JobSummaryEntityImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, count);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JobSummaryEntityImplCopyWith<_$JobSummaryEntityImpl> get copyWith =>
      __$$JobSummaryEntityImplCopyWithImpl<_$JobSummaryEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JobSummaryEntityImplToJson(
      this,
    );
  }
}

abstract class _JobSummaryEntity implements JobSummaryEntity {
  const factory _JobSummaryEntity(
      {required final String title,
      required final int count}) = _$JobSummaryEntityImpl;

  factory _JobSummaryEntity.fromJson(Map<String, dynamic> json) =
      _$JobSummaryEntityImpl.fromJson;

  @override
  String get title;
  @override
  int get count;
  @override
  @JsonKey(ignore: true)
  _$$JobSummaryEntityImplCopyWith<_$JobSummaryEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
