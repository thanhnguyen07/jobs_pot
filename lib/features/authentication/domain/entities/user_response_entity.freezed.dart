// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_response_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserResponseEntity _$UserResponseEntityFromJson(Map<String, dynamic> json) {
  return _UserResponseEntity.fromJson(json);
}

/// @nodoc
mixin _$UserResponseEntity {
  UserEntity get results => throw _privateConstructorUsedError;
  String get token => throw _privateConstructorUsedError;
  String get refreshToken => throw _privateConstructorUsedError;
  String? get msg => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserResponseEntityCopyWith<UserResponseEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserResponseEntityCopyWith<$Res> {
  factory $UserResponseEntityCopyWith(
          UserResponseEntity value, $Res Function(UserResponseEntity) then) =
      _$UserResponseEntityCopyWithImpl<$Res, UserResponseEntity>;
  @useResult
  $Res call(
      {UserEntity results, String token, String refreshToken, String? msg});

  $UserEntityCopyWith<$Res> get results;
}

/// @nodoc
class _$UserResponseEntityCopyWithImpl<$Res, $Val extends UserResponseEntity>
    implements $UserResponseEntityCopyWith<$Res> {
  _$UserResponseEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
    Object? token = null,
    Object? refreshToken = null,
    Object? msg = freezed,
  }) {
    return _then(_value.copyWith(
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as UserEntity,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      msg: freezed == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserEntityCopyWith<$Res> get results {
    return $UserEntityCopyWith<$Res>(_value.results, (value) {
      return _then(_value.copyWith(results: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserResponseEntityCopyWith<$Res>
    implements $UserResponseEntityCopyWith<$Res> {
  factory _$$_UserResponseEntityCopyWith(_$_UserResponseEntity value,
          $Res Function(_$_UserResponseEntity) then) =
      __$$_UserResponseEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UserEntity results, String token, String refreshToken, String? msg});

  @override
  $UserEntityCopyWith<$Res> get results;
}

/// @nodoc
class __$$_UserResponseEntityCopyWithImpl<$Res>
    extends _$UserResponseEntityCopyWithImpl<$Res, _$_UserResponseEntity>
    implements _$$_UserResponseEntityCopyWith<$Res> {
  __$$_UserResponseEntityCopyWithImpl(
      _$_UserResponseEntity _value, $Res Function(_$_UserResponseEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
    Object? token = null,
    Object? refreshToken = null,
    Object? msg = freezed,
  }) {
    return _then(_$_UserResponseEntity(
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as UserEntity,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      msg: freezed == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserResponseEntity implements _UserResponseEntity {
  const _$_UserResponseEntity(
      {required this.results,
      required this.token,
      required this.refreshToken,
      this.msg});

  factory _$_UserResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$$_UserResponseEntityFromJson(json);

  @override
  final UserEntity results;
  @override
  final String token;
  @override
  final String refreshToken;
  @override
  final String? msg;

  @override
  String toString() {
    return 'UserResponseEntity(results: $results, token: $token, refreshToken: $refreshToken, msg: $msg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserResponseEntity &&
            (identical(other.results, results) || other.results == results) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.msg, msg) || other.msg == msg));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, results, token, refreshToken, msg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserResponseEntityCopyWith<_$_UserResponseEntity> get copyWith =>
      __$$_UserResponseEntityCopyWithImpl<_$_UserResponseEntity>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserResponseEntityToJson(
      this,
    );
  }
}

abstract class _UserResponseEntity implements UserResponseEntity {
  const factory _UserResponseEntity(
      {required final UserEntity results,
      required final String token,
      required final String refreshToken,
      final String? msg}) = _$_UserResponseEntity;

  factory _UserResponseEntity.fromJson(Map<String, dynamic> json) =
      _$_UserResponseEntity.fromJson;

  @override
  UserEntity get results;
  @override
  String get token;
  @override
  String get refreshToken;
  @override
  String? get msg;
  @override
  @JsonKey(ignore: true)
  _$$_UserResponseEntityCopyWith<_$_UserResponseEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
