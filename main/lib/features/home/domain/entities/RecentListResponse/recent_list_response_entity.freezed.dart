// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recent_list_response_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RecentListResponseEntity _$RecentListResponseEntityFromJson(
    Map<String, dynamic> json) {
  return _RecentListResponseEntity.fromJson(json);
}

/// @nodoc
mixin _$RecentListResponseEntity {
  List<RecentListEntity> get results => throw _privateConstructorUsedError;
  String get msg => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecentListResponseEntityCopyWith<RecentListResponseEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecentListResponseEntityCopyWith<$Res> {
  factory $RecentListResponseEntityCopyWith(RecentListResponseEntity value,
          $Res Function(RecentListResponseEntity) then) =
      _$RecentListResponseEntityCopyWithImpl<$Res, RecentListResponseEntity>;
  @useResult
  $Res call({List<RecentListEntity> results, String msg});
}

/// @nodoc
class _$RecentListResponseEntityCopyWithImpl<$Res,
        $Val extends RecentListResponseEntity>
    implements $RecentListResponseEntityCopyWith<$Res> {
  _$RecentListResponseEntityCopyWithImpl(this._value, this._then);

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
              as List<RecentListEntity>,
      msg: null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecentListResponseEntityImplCopyWith<$Res>
    implements $RecentListResponseEntityCopyWith<$Res> {
  factory _$$RecentListResponseEntityImplCopyWith(
          _$RecentListResponseEntityImpl value,
          $Res Function(_$RecentListResponseEntityImpl) then) =
      __$$RecentListResponseEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<RecentListEntity> results, String msg});
}

/// @nodoc
class __$$RecentListResponseEntityImplCopyWithImpl<$Res>
    extends _$RecentListResponseEntityCopyWithImpl<$Res,
        _$RecentListResponseEntityImpl>
    implements _$$RecentListResponseEntityImplCopyWith<$Res> {
  __$$RecentListResponseEntityImplCopyWithImpl(
      _$RecentListResponseEntityImpl _value,
      $Res Function(_$RecentListResponseEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
    Object? msg = null,
  }) {
    return _then(_$RecentListResponseEntityImpl(
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<RecentListEntity>,
      msg: null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecentListResponseEntityImpl implements _RecentListResponseEntity {
  const _$RecentListResponseEntityImpl(
      {required final List<RecentListEntity> results, required this.msg})
      : _results = results;

  factory _$RecentListResponseEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecentListResponseEntityImplFromJson(json);

  final List<RecentListEntity> _results;
  @override
  List<RecentListEntity> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  final String msg;

  @override
  String toString() {
    return 'RecentListResponseEntity(results: $results, msg: $msg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecentListResponseEntityImpl &&
            const DeepCollectionEquality().equals(other._results, _results) &&
            (identical(other.msg, msg) || other.msg == msg));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_results), msg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecentListResponseEntityImplCopyWith<_$RecentListResponseEntityImpl>
      get copyWith => __$$RecentListResponseEntityImplCopyWithImpl<
          _$RecentListResponseEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecentListResponseEntityImplToJson(
      this,
    );
  }
}

abstract class _RecentListResponseEntity implements RecentListResponseEntity {
  const factory _RecentListResponseEntity(
      {required final List<RecentListEntity> results,
      required final String msg}) = _$RecentListResponseEntityImpl;

  factory _RecentListResponseEntity.fromJson(Map<String, dynamic> json) =
      _$RecentListResponseEntityImpl.fromJson;

  @override
  List<RecentListEntity> get results;
  @override
  String get msg;
  @override
  @JsonKey(ignore: true)
  _$$RecentListResponseEntityImplCopyWith<_$RecentListResponseEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
