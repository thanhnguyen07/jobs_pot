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
  @JsonKey(name: "refresh_token")
  String get refreshToken => throw _privateConstructorUsedError;
  String get msg => throw _privateConstructorUsedError;

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
      {UserEntity results,
      String token,
      @JsonKey(name: "refresh_token") String refreshToken,
      String msg});

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
    Object? msg = null,
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
      msg: null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$UserResponseEntityImplCopyWith<$Res>
    implements $UserResponseEntityCopyWith<$Res> {
  factory _$$UserResponseEntityImplCopyWith(_$UserResponseEntityImpl value,
          $Res Function(_$UserResponseEntityImpl) then) =
      __$$UserResponseEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UserEntity results,
      String token,
      @JsonKey(name: "refresh_token") String refreshToken,
      String msg});

  @override
  $UserEntityCopyWith<$Res> get results;
}

/// @nodoc
class __$$UserResponseEntityImplCopyWithImpl<$Res>
    extends _$UserResponseEntityCopyWithImpl<$Res, _$UserResponseEntityImpl>
    implements _$$UserResponseEntityImplCopyWith<$Res> {
  __$$UserResponseEntityImplCopyWithImpl(_$UserResponseEntityImpl _value,
      $Res Function(_$UserResponseEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? results = null,
    Object? token = null,
    Object? refreshToken = null,
    Object? msg = null,
  }) {
    return _then(_$UserResponseEntityImpl(
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
      msg: null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserResponseEntityImpl implements _UserResponseEntity {
  const _$UserResponseEntityImpl(
      {required this.results,
      required this.token,
      @JsonKey(name: "refresh_token") required this.refreshToken,
      required this.msg});

  factory _$UserResponseEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserResponseEntityImplFromJson(json);

  @override
  final UserEntity results;
  @override
  final String token;
  @override
  @JsonKey(name: "refresh_token")
  final String refreshToken;
  @override
  final String msg;

  @override
  String toString() {
    return 'UserResponseEntity(results: $results, token: $token, refreshToken: $refreshToken, msg: $msg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserResponseEntityImpl &&
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
  _$$UserResponseEntityImplCopyWith<_$UserResponseEntityImpl> get copyWith =>
      __$$UserResponseEntityImplCopyWithImpl<_$UserResponseEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserResponseEntityImplToJson(
      this,
    );
  }
}

abstract class _UserResponseEntity implements UserResponseEntity {
  const factory _UserResponseEntity(
      {required final UserEntity results,
      required final String token,
      @JsonKey(name: "refresh_token") required final String refreshToken,
      required final String msg}) = _$UserResponseEntityImpl;

  factory _UserResponseEntity.fromJson(Map<String, dynamic> json) =
      _$UserResponseEntityImpl.fromJson;

  @override
  UserEntity get results;
  @override
  String get token;
  @override
  @JsonKey(name: "refresh_token")
  String get refreshToken;
  @override
  String get msg;
  @override
  @JsonKey(ignore: true)
  _$$UserResponseEntityImplCopyWith<_$UserResponseEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
