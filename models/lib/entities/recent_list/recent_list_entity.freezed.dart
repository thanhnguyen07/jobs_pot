// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recent_list_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RecentListEntity _$RecentListEntityFromJson(Map<String, dynamic> json) {
  return _RecentListEntity.fromJson(json);
}

/// @nodoc
mixin _$RecentListEntity {
  @JsonKey(name: "_id")
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "job_name")
  String get jobName => throw _privateConstructorUsedError;
  @JsonKey(name: "company_name")
  String get companyName => throw _privateConstructorUsedError;
  @JsonKey(name: "company_address")
  String get companyAddress => throw _privateConstructorUsedError;
  @JsonKey(name: "company_avatar")
  String get companyAvatar => throw _privateConstructorUsedError;
  SalaryEntity get salary => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecentListEntityCopyWith<RecentListEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecentListEntityCopyWith<$Res> {
  factory $RecentListEntityCopyWith(
          RecentListEntity value, $Res Function(RecentListEntity) then) =
      _$RecentListEntityCopyWithImpl<$Res, RecentListEntity>;
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      @JsonKey(name: "job_name") String jobName,
      @JsonKey(name: "company_name") String companyName,
      @JsonKey(name: "company_address") String companyAddress,
      @JsonKey(name: "company_avatar") String companyAvatar,
      SalaryEntity salary,
      List<String> tags});

  $SalaryEntityCopyWith<$Res> get salary;
}

/// @nodoc
class _$RecentListEntityCopyWithImpl<$Res, $Val extends RecentListEntity>
    implements $RecentListEntityCopyWith<$Res> {
  _$RecentListEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? jobName = null,
    Object? companyName = null,
    Object? companyAddress = null,
    Object? companyAvatar = null,
    Object? salary = null,
    Object? tags = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      jobName: null == jobName
          ? _value.jobName
          : jobName // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      companyAddress: null == companyAddress
          ? _value.companyAddress
          : companyAddress // ignore: cast_nullable_to_non_nullable
              as String,
      companyAvatar: null == companyAvatar
          ? _value.companyAvatar
          : companyAvatar // ignore: cast_nullable_to_non_nullable
              as String,
      salary: null == salary
          ? _value.salary
          : salary // ignore: cast_nullable_to_non_nullable
              as SalaryEntity,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SalaryEntityCopyWith<$Res> get salary {
    return $SalaryEntityCopyWith<$Res>(_value.salary, (value) {
      return _then(_value.copyWith(salary: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RecentListEntityImplCopyWith<$Res>
    implements $RecentListEntityCopyWith<$Res> {
  factory _$$RecentListEntityImplCopyWith(_$RecentListEntityImpl value,
          $Res Function(_$RecentListEntityImpl) then) =
      __$$RecentListEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "_id") String id,
      @JsonKey(name: "job_name") String jobName,
      @JsonKey(name: "company_name") String companyName,
      @JsonKey(name: "company_address") String companyAddress,
      @JsonKey(name: "company_avatar") String companyAvatar,
      SalaryEntity salary,
      List<String> tags});

  @override
  $SalaryEntityCopyWith<$Res> get salary;
}

/// @nodoc
class __$$RecentListEntityImplCopyWithImpl<$Res>
    extends _$RecentListEntityCopyWithImpl<$Res, _$RecentListEntityImpl>
    implements _$$RecentListEntityImplCopyWith<$Res> {
  __$$RecentListEntityImplCopyWithImpl(_$RecentListEntityImpl _value,
      $Res Function(_$RecentListEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? jobName = null,
    Object? companyName = null,
    Object? companyAddress = null,
    Object? companyAvatar = null,
    Object? salary = null,
    Object? tags = null,
  }) {
    return _then(_$RecentListEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      jobName: null == jobName
          ? _value.jobName
          : jobName // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      companyAddress: null == companyAddress
          ? _value.companyAddress
          : companyAddress // ignore: cast_nullable_to_non_nullable
              as String,
      companyAvatar: null == companyAvatar
          ? _value.companyAvatar
          : companyAvatar // ignore: cast_nullable_to_non_nullable
              as String,
      salary: null == salary
          ? _value.salary
          : salary // ignore: cast_nullable_to_non_nullable
              as SalaryEntity,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecentListEntityImpl implements _RecentListEntity {
  const _$RecentListEntityImpl(
      {@JsonKey(name: "_id") required this.id,
      @JsonKey(name: "job_name") required this.jobName,
      @JsonKey(name: "company_name") required this.companyName,
      @JsonKey(name: "company_address") required this.companyAddress,
      @JsonKey(name: "company_avatar") required this.companyAvatar,
      required this.salary,
      required final List<String> tags})
      : _tags = tags;

  factory _$RecentListEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecentListEntityImplFromJson(json);

  @override
  @JsonKey(name: "_id")
  final String id;
  @override
  @JsonKey(name: "job_name")
  final String jobName;
  @override
  @JsonKey(name: "company_name")
  final String companyName;
  @override
  @JsonKey(name: "company_address")
  final String companyAddress;
  @override
  @JsonKey(name: "company_avatar")
  final String companyAvatar;
  @override
  final SalaryEntity salary;
  final List<String> _tags;
  @override
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  String toString() {
    return 'RecentListEntity(id: $id, jobName: $jobName, companyName: $companyName, companyAddress: $companyAddress, companyAvatar: $companyAvatar, salary: $salary, tags: $tags)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecentListEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.jobName, jobName) || other.jobName == jobName) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.companyAddress, companyAddress) ||
                other.companyAddress == companyAddress) &&
            (identical(other.companyAvatar, companyAvatar) ||
                other.companyAvatar == companyAvatar) &&
            (identical(other.salary, salary) || other.salary == salary) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      jobName,
      companyName,
      companyAddress,
      companyAvatar,
      salary,
      const DeepCollectionEquality().hash(_tags));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecentListEntityImplCopyWith<_$RecentListEntityImpl> get copyWith =>
      __$$RecentListEntityImplCopyWithImpl<_$RecentListEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecentListEntityImplToJson(
      this,
    );
  }
}

abstract class _RecentListEntity implements RecentListEntity {
  const factory _RecentListEntity(
      {@JsonKey(name: "_id") required final String id,
      @JsonKey(name: "job_name") required final String jobName,
      @JsonKey(name: "company_name") required final String companyName,
      @JsonKey(name: "company_address") required final String companyAddress,
      @JsonKey(name: "company_avatar") required final String companyAvatar,
      required final SalaryEntity salary,
      required final List<String> tags}) = _$RecentListEntityImpl;

  factory _RecentListEntity.fromJson(Map<String, dynamic> json) =
      _$RecentListEntityImpl.fromJson;

  @override
  @JsonKey(name: "_id")
  String get id;
  @override
  @JsonKey(name: "job_name")
  String get jobName;
  @override
  @JsonKey(name: "company_name")
  String get companyName;
  @override
  @JsonKey(name: "company_address")
  String get companyAddress;
  @override
  @JsonKey(name: "company_avatar")
  String get companyAvatar;
  @override
  SalaryEntity get salary;
  @override
  List<String> get tags;
  @override
  @JsonKey(ignore: true)
  _$$RecentListEntityImplCopyWith<_$RecentListEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
