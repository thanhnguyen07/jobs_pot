// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Failure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function(String message) message,
    required TResult Function() unauthorized,
    required TResult Function() badRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function(String message)? message,
    TResult? Function()? unauthorized,
    TResult? Function()? badRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function(String message)? message,
    TResult Function()? unauthorized,
    TResult Function()? badRequest,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmptyFailure value) empty,
    required TResult Function(_MessageRequestFailure value) message,
    required TResult Function(_UnauthorizedFailure value) unauthorized,
    required TResult Function(_BadRequestFailure value) badRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EmptyFailure value)? empty,
    TResult? Function(_MessageRequestFailure value)? message,
    TResult? Function(_UnauthorizedFailure value)? unauthorized,
    TResult? Function(_BadRequestFailure value)? badRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmptyFailure value)? empty,
    TResult Function(_MessageRequestFailure value)? message,
    TResult Function(_UnauthorizedFailure value)? unauthorized,
    TResult Function(_BadRequestFailure value)? badRequest,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) then) =
      _$FailureCopyWithImpl<$Res, Failure>;
}

/// @nodoc
class _$FailureCopyWithImpl<$Res, $Val extends Failure>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$EmptyFailureImplCopyWith<$Res> {
  factory _$$EmptyFailureImplCopyWith(
          _$EmptyFailureImpl value, $Res Function(_$EmptyFailureImpl) then) =
      __$$EmptyFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EmptyFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$EmptyFailureImpl>
    implements _$$EmptyFailureImplCopyWith<$Res> {
  __$$EmptyFailureImplCopyWithImpl(
      _$EmptyFailureImpl _value, $Res Function(_$EmptyFailureImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EmptyFailureImpl extends _EmptyFailure {
  const _$EmptyFailureImpl() : super._();

  @override
  String toString() {
    return 'Failure.empty()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EmptyFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function(String message) message,
    required TResult Function() unauthorized,
    required TResult Function() badRequest,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function(String message)? message,
    TResult? Function()? unauthorized,
    TResult? Function()? badRequest,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function(String message)? message,
    TResult Function()? unauthorized,
    TResult Function()? badRequest,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmptyFailure value) empty,
    required TResult Function(_MessageRequestFailure value) message,
    required TResult Function(_UnauthorizedFailure value) unauthorized,
    required TResult Function(_BadRequestFailure value) badRequest,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EmptyFailure value)? empty,
    TResult? Function(_MessageRequestFailure value)? message,
    TResult? Function(_UnauthorizedFailure value)? unauthorized,
    TResult? Function(_BadRequestFailure value)? badRequest,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmptyFailure value)? empty,
    TResult Function(_MessageRequestFailure value)? message,
    TResult Function(_UnauthorizedFailure value)? unauthorized,
    TResult Function(_BadRequestFailure value)? badRequest,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _EmptyFailure extends Failure {
  const factory _EmptyFailure() = _$EmptyFailureImpl;
  const _EmptyFailure._() : super._();
}

/// @nodoc
abstract class _$$MessageRequestFailureImplCopyWith<$Res> {
  factory _$$MessageRequestFailureImplCopyWith(
          _$MessageRequestFailureImpl value,
          $Res Function(_$MessageRequestFailureImpl) then) =
      __$$MessageRequestFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$MessageRequestFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$MessageRequestFailureImpl>
    implements _$$MessageRequestFailureImplCopyWith<$Res> {
  __$$MessageRequestFailureImplCopyWithImpl(_$MessageRequestFailureImpl _value,
      $Res Function(_$MessageRequestFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$MessageRequestFailureImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MessageRequestFailureImpl extends _MessageRequestFailure {
  const _$MessageRequestFailureImpl({required this.message}) : super._();

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.message(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageRequestFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageRequestFailureImplCopyWith<_$MessageRequestFailureImpl>
      get copyWith => __$$MessageRequestFailureImplCopyWithImpl<
          _$MessageRequestFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function(String message) message,
    required TResult Function() unauthorized,
    required TResult Function() badRequest,
  }) {
    return message(this.message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function(String message)? message,
    TResult? Function()? unauthorized,
    TResult? Function()? badRequest,
  }) {
    return message?.call(this.message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function(String message)? message,
    TResult Function()? unauthorized,
    TResult Function()? badRequest,
    required TResult orElse(),
  }) {
    if (message != null) {
      return message(this.message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmptyFailure value) empty,
    required TResult Function(_MessageRequestFailure value) message,
    required TResult Function(_UnauthorizedFailure value) unauthorized,
    required TResult Function(_BadRequestFailure value) badRequest,
  }) {
    return message(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EmptyFailure value)? empty,
    TResult? Function(_MessageRequestFailure value)? message,
    TResult? Function(_UnauthorizedFailure value)? unauthorized,
    TResult? Function(_BadRequestFailure value)? badRequest,
  }) {
    return message?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmptyFailure value)? empty,
    TResult Function(_MessageRequestFailure value)? message,
    TResult Function(_UnauthorizedFailure value)? unauthorized,
    TResult Function(_BadRequestFailure value)? badRequest,
    required TResult orElse(),
  }) {
    if (message != null) {
      return message(this);
    }
    return orElse();
  }
}

abstract class _MessageRequestFailure extends Failure {
  const factory _MessageRequestFailure({required final String message}) =
      _$MessageRequestFailureImpl;
  const _MessageRequestFailure._() : super._();

  String get message;
  @JsonKey(ignore: true)
  _$$MessageRequestFailureImplCopyWith<_$MessageRequestFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnauthorizedFailureImplCopyWith<$Res> {
  factory _$$UnauthorizedFailureImplCopyWith(_$UnauthorizedFailureImpl value,
          $Res Function(_$UnauthorizedFailureImpl) then) =
      __$$UnauthorizedFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UnauthorizedFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$UnauthorizedFailureImpl>
    implements _$$UnauthorizedFailureImplCopyWith<$Res> {
  __$$UnauthorizedFailureImplCopyWithImpl(_$UnauthorizedFailureImpl _value,
      $Res Function(_$UnauthorizedFailureImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UnauthorizedFailureImpl extends _UnauthorizedFailure {
  const _$UnauthorizedFailureImpl() : super._();

  @override
  String toString() {
    return 'Failure.unauthorized()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnauthorizedFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function(String message) message,
    required TResult Function() unauthorized,
    required TResult Function() badRequest,
  }) {
    return unauthorized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function(String message)? message,
    TResult? Function()? unauthorized,
    TResult? Function()? badRequest,
  }) {
    return unauthorized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function(String message)? message,
    TResult Function()? unauthorized,
    TResult Function()? badRequest,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmptyFailure value) empty,
    required TResult Function(_MessageRequestFailure value) message,
    required TResult Function(_UnauthorizedFailure value) unauthorized,
    required TResult Function(_BadRequestFailure value) badRequest,
  }) {
    return unauthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EmptyFailure value)? empty,
    TResult? Function(_MessageRequestFailure value)? message,
    TResult? Function(_UnauthorizedFailure value)? unauthorized,
    TResult? Function(_BadRequestFailure value)? badRequest,
  }) {
    return unauthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmptyFailure value)? empty,
    TResult Function(_MessageRequestFailure value)? message,
    TResult Function(_UnauthorizedFailure value)? unauthorized,
    TResult Function(_BadRequestFailure value)? badRequest,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(this);
    }
    return orElse();
  }
}

abstract class _UnauthorizedFailure extends Failure {
  const factory _UnauthorizedFailure() = _$UnauthorizedFailureImpl;
  const _UnauthorizedFailure._() : super._();
}

/// @nodoc
abstract class _$$BadRequestFailureImplCopyWith<$Res> {
  factory _$$BadRequestFailureImplCopyWith(_$BadRequestFailureImpl value,
          $Res Function(_$BadRequestFailureImpl) then) =
      __$$BadRequestFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BadRequestFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$BadRequestFailureImpl>
    implements _$$BadRequestFailureImplCopyWith<$Res> {
  __$$BadRequestFailureImplCopyWithImpl(_$BadRequestFailureImpl _value,
      $Res Function(_$BadRequestFailureImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$BadRequestFailureImpl extends _BadRequestFailure {
  const _$BadRequestFailureImpl() : super._();

  @override
  String toString() {
    return 'Failure.badRequest()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$BadRequestFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function(String message) message,
    required TResult Function() unauthorized,
    required TResult Function() badRequest,
  }) {
    return badRequest();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function(String message)? message,
    TResult? Function()? unauthorized,
    TResult? Function()? badRequest,
  }) {
    return badRequest?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function(String message)? message,
    TResult Function()? unauthorized,
    TResult Function()? badRequest,
    required TResult orElse(),
  }) {
    if (badRequest != null) {
      return badRequest();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmptyFailure value) empty,
    required TResult Function(_MessageRequestFailure value) message,
    required TResult Function(_UnauthorizedFailure value) unauthorized,
    required TResult Function(_BadRequestFailure value) badRequest,
  }) {
    return badRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EmptyFailure value)? empty,
    TResult? Function(_MessageRequestFailure value)? message,
    TResult? Function(_UnauthorizedFailure value)? unauthorized,
    TResult? Function(_BadRequestFailure value)? badRequest,
  }) {
    return badRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmptyFailure value)? empty,
    TResult Function(_MessageRequestFailure value)? message,
    TResult Function(_UnauthorizedFailure value)? unauthorized,
    TResult Function(_BadRequestFailure value)? badRequest,
    required TResult orElse(),
  }) {
    if (badRequest != null) {
      return badRequest(this);
    }
    return orElse();
  }
}

abstract class _BadRequestFailure extends Failure {
  const factory _BadRequestFailure() = _$BadRequestFailureImpl;
  const _BadRequestFailure._() : super._();
}
