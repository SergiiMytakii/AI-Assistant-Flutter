// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Failure {
  String? get errorMessage => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? errorMessage) serverError,
    required TResult Function(String? errorMessage) networkError,
    required TResult Function(String? errorMessage) authenticationError,
    required TResult Function(String? errorMessage) openAiError,
    required TResult Function(String? errorMessage) notFound,
    required TResult Function(String? errorMessage) unknown,
    required TResult Function(String? errorMessage) internal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? errorMessage)? serverError,
    TResult? Function(String? errorMessage)? networkError,
    TResult? Function(String? errorMessage)? authenticationError,
    TResult? Function(String? errorMessage)? openAiError,
    TResult? Function(String? errorMessage)? notFound,
    TResult? Function(String? errorMessage)? unknown,
    TResult? Function(String? errorMessage)? internal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? errorMessage)? serverError,
    TResult Function(String? errorMessage)? networkError,
    TResult Function(String? errorMessage)? authenticationError,
    TResult Function(String? errorMessage)? openAiError,
    TResult Function(String? errorMessage)? notFound,
    TResult Function(String? errorMessage)? unknown,
    TResult Function(String? errorMessage)? internal,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError value) serverError,
    required TResult Function(NetworkError value) networkError,
    required TResult Function(AuthenticationError value) authenticationError,
    required TResult Function(OpenAiError value) openAiError,
    required TResult Function(NotFound value) notFound,
    required TResult Function(Unknown value) unknown,
    required TResult Function(InternalError value) internal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerError value)? serverError,
    TResult? Function(NetworkError value)? networkError,
    TResult? Function(AuthenticationError value)? authenticationError,
    TResult? Function(OpenAiError value)? openAiError,
    TResult? Function(NotFound value)? notFound,
    TResult? Function(Unknown value)? unknown,
    TResult? Function(InternalError value)? internal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError value)? serverError,
    TResult Function(NetworkError value)? networkError,
    TResult Function(AuthenticationError value)? authenticationError,
    TResult Function(OpenAiError value)? openAiError,
    TResult Function(NotFound value)? notFound,
    TResult Function(Unknown value)? unknown,
    TResult Function(InternalError value)? internal,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FailureCopyWith<Failure> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) then) =
      _$FailureCopyWithImpl<$Res, Failure>;
  @useResult
  $Res call({String? errorMessage});
}

/// @nodoc
class _$FailureCopyWithImpl<$Res, $Val extends Failure>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServerErrorImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$ServerErrorImplCopyWith(
          _$ServerErrorImpl value, $Res Function(_$ServerErrorImpl) then) =
      __$$ServerErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? errorMessage});
}

/// @nodoc
class __$$ServerErrorImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$ServerErrorImpl>
    implements _$$ServerErrorImplCopyWith<$Res> {
  __$$ServerErrorImplCopyWithImpl(
      _$ServerErrorImpl _value, $Res Function(_$ServerErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = freezed,
  }) {
    return _then(_$ServerErrorImpl(
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ServerErrorImpl extends ServerError {
  const _$ServerErrorImpl({this.errorMessage}) : super._();

  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'Failure.serverError(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerErrorImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerErrorImplCopyWith<_$ServerErrorImpl> get copyWith =>
      __$$ServerErrorImplCopyWithImpl<_$ServerErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? errorMessage) serverError,
    required TResult Function(String? errorMessage) networkError,
    required TResult Function(String? errorMessage) authenticationError,
    required TResult Function(String? errorMessage) openAiError,
    required TResult Function(String? errorMessage) notFound,
    required TResult Function(String? errorMessage) unknown,
    required TResult Function(String? errorMessage) internal,
  }) {
    return serverError(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? errorMessage)? serverError,
    TResult? Function(String? errorMessage)? networkError,
    TResult? Function(String? errorMessage)? authenticationError,
    TResult? Function(String? errorMessage)? openAiError,
    TResult? Function(String? errorMessage)? notFound,
    TResult? Function(String? errorMessage)? unknown,
    TResult? Function(String? errorMessage)? internal,
  }) {
    return serverError?.call(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? errorMessage)? serverError,
    TResult Function(String? errorMessage)? networkError,
    TResult Function(String? errorMessage)? authenticationError,
    TResult Function(String? errorMessage)? openAiError,
    TResult Function(String? errorMessage)? notFound,
    TResult Function(String? errorMessage)? unknown,
    TResult Function(String? errorMessage)? internal,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError value) serverError,
    required TResult Function(NetworkError value) networkError,
    required TResult Function(AuthenticationError value) authenticationError,
    required TResult Function(OpenAiError value) openAiError,
    required TResult Function(NotFound value) notFound,
    required TResult Function(Unknown value) unknown,
    required TResult Function(InternalError value) internal,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerError value)? serverError,
    TResult? Function(NetworkError value)? networkError,
    TResult? Function(AuthenticationError value)? authenticationError,
    TResult? Function(OpenAiError value)? openAiError,
    TResult? Function(NotFound value)? notFound,
    TResult? Function(Unknown value)? unknown,
    TResult? Function(InternalError value)? internal,
  }) {
    return serverError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError value)? serverError,
    TResult Function(NetworkError value)? networkError,
    TResult Function(AuthenticationError value)? authenticationError,
    TResult Function(OpenAiError value)? openAiError,
    TResult Function(NotFound value)? notFound,
    TResult Function(Unknown value)? unknown,
    TResult Function(InternalError value)? internal,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class ServerError extends Failure {
  const factory ServerError({final String? errorMessage}) = _$ServerErrorImpl;
  const ServerError._() : super._();

  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$ServerErrorImplCopyWith<_$ServerErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NetworkErrorImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$NetworkErrorImplCopyWith(
          _$NetworkErrorImpl value, $Res Function(_$NetworkErrorImpl) then) =
      __$$NetworkErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? errorMessage});
}

/// @nodoc
class __$$NetworkErrorImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$NetworkErrorImpl>
    implements _$$NetworkErrorImplCopyWith<$Res> {
  __$$NetworkErrorImplCopyWithImpl(
      _$NetworkErrorImpl _value, $Res Function(_$NetworkErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = freezed,
  }) {
    return _then(_$NetworkErrorImpl(
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$NetworkErrorImpl extends NetworkError {
  const _$NetworkErrorImpl({this.errorMessage}) : super._();

  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'Failure.networkError(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkErrorImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkErrorImplCopyWith<_$NetworkErrorImpl> get copyWith =>
      __$$NetworkErrorImplCopyWithImpl<_$NetworkErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? errorMessage) serverError,
    required TResult Function(String? errorMessage) networkError,
    required TResult Function(String? errorMessage) authenticationError,
    required TResult Function(String? errorMessage) openAiError,
    required TResult Function(String? errorMessage) notFound,
    required TResult Function(String? errorMessage) unknown,
    required TResult Function(String? errorMessage) internal,
  }) {
    return networkError(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? errorMessage)? serverError,
    TResult? Function(String? errorMessage)? networkError,
    TResult? Function(String? errorMessage)? authenticationError,
    TResult? Function(String? errorMessage)? openAiError,
    TResult? Function(String? errorMessage)? notFound,
    TResult? Function(String? errorMessage)? unknown,
    TResult? Function(String? errorMessage)? internal,
  }) {
    return networkError?.call(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? errorMessage)? serverError,
    TResult Function(String? errorMessage)? networkError,
    TResult Function(String? errorMessage)? authenticationError,
    TResult Function(String? errorMessage)? openAiError,
    TResult Function(String? errorMessage)? notFound,
    TResult Function(String? errorMessage)? unknown,
    TResult Function(String? errorMessage)? internal,
    required TResult orElse(),
  }) {
    if (networkError != null) {
      return networkError(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError value) serverError,
    required TResult Function(NetworkError value) networkError,
    required TResult Function(AuthenticationError value) authenticationError,
    required TResult Function(OpenAiError value) openAiError,
    required TResult Function(NotFound value) notFound,
    required TResult Function(Unknown value) unknown,
    required TResult Function(InternalError value) internal,
  }) {
    return networkError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerError value)? serverError,
    TResult? Function(NetworkError value)? networkError,
    TResult? Function(AuthenticationError value)? authenticationError,
    TResult? Function(OpenAiError value)? openAiError,
    TResult? Function(NotFound value)? notFound,
    TResult? Function(Unknown value)? unknown,
    TResult? Function(InternalError value)? internal,
  }) {
    return networkError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError value)? serverError,
    TResult Function(NetworkError value)? networkError,
    TResult Function(AuthenticationError value)? authenticationError,
    TResult Function(OpenAiError value)? openAiError,
    TResult Function(NotFound value)? notFound,
    TResult Function(Unknown value)? unknown,
    TResult Function(InternalError value)? internal,
    required TResult orElse(),
  }) {
    if (networkError != null) {
      return networkError(this);
    }
    return orElse();
  }
}

abstract class NetworkError extends Failure {
  const factory NetworkError({final String? errorMessage}) = _$NetworkErrorImpl;
  const NetworkError._() : super._();

  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$NetworkErrorImplCopyWith<_$NetworkErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthenticationErrorImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$AuthenticationErrorImplCopyWith(_$AuthenticationErrorImpl value,
          $Res Function(_$AuthenticationErrorImpl) then) =
      __$$AuthenticationErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? errorMessage});
}

/// @nodoc
class __$$AuthenticationErrorImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$AuthenticationErrorImpl>
    implements _$$AuthenticationErrorImplCopyWith<$Res> {
  __$$AuthenticationErrorImplCopyWithImpl(_$AuthenticationErrorImpl _value,
      $Res Function(_$AuthenticationErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = freezed,
  }) {
    return _then(_$AuthenticationErrorImpl(
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AuthenticationErrorImpl extends AuthenticationError {
  const _$AuthenticationErrorImpl({this.errorMessage}) : super._();

  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'Failure.authenticationError(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticationErrorImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthenticationErrorImplCopyWith<_$AuthenticationErrorImpl> get copyWith =>
      __$$AuthenticationErrorImplCopyWithImpl<_$AuthenticationErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? errorMessage) serverError,
    required TResult Function(String? errorMessage) networkError,
    required TResult Function(String? errorMessage) authenticationError,
    required TResult Function(String? errorMessage) openAiError,
    required TResult Function(String? errorMessage) notFound,
    required TResult Function(String? errorMessage) unknown,
    required TResult Function(String? errorMessage) internal,
  }) {
    return authenticationError(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? errorMessage)? serverError,
    TResult? Function(String? errorMessage)? networkError,
    TResult? Function(String? errorMessage)? authenticationError,
    TResult? Function(String? errorMessage)? openAiError,
    TResult? Function(String? errorMessage)? notFound,
    TResult? Function(String? errorMessage)? unknown,
    TResult? Function(String? errorMessage)? internal,
  }) {
    return authenticationError?.call(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? errorMessage)? serverError,
    TResult Function(String? errorMessage)? networkError,
    TResult Function(String? errorMessage)? authenticationError,
    TResult Function(String? errorMessage)? openAiError,
    TResult Function(String? errorMessage)? notFound,
    TResult Function(String? errorMessage)? unknown,
    TResult Function(String? errorMessage)? internal,
    required TResult orElse(),
  }) {
    if (authenticationError != null) {
      return authenticationError(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError value) serverError,
    required TResult Function(NetworkError value) networkError,
    required TResult Function(AuthenticationError value) authenticationError,
    required TResult Function(OpenAiError value) openAiError,
    required TResult Function(NotFound value) notFound,
    required TResult Function(Unknown value) unknown,
    required TResult Function(InternalError value) internal,
  }) {
    return authenticationError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerError value)? serverError,
    TResult? Function(NetworkError value)? networkError,
    TResult? Function(AuthenticationError value)? authenticationError,
    TResult? Function(OpenAiError value)? openAiError,
    TResult? Function(NotFound value)? notFound,
    TResult? Function(Unknown value)? unknown,
    TResult? Function(InternalError value)? internal,
  }) {
    return authenticationError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError value)? serverError,
    TResult Function(NetworkError value)? networkError,
    TResult Function(AuthenticationError value)? authenticationError,
    TResult Function(OpenAiError value)? openAiError,
    TResult Function(NotFound value)? notFound,
    TResult Function(Unknown value)? unknown,
    TResult Function(InternalError value)? internal,
    required TResult orElse(),
  }) {
    if (authenticationError != null) {
      return authenticationError(this);
    }
    return orElse();
  }
}

abstract class AuthenticationError extends Failure {
  const factory AuthenticationError({final String? errorMessage}) =
      _$AuthenticationErrorImpl;
  const AuthenticationError._() : super._();

  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$AuthenticationErrorImplCopyWith<_$AuthenticationErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OpenAiErrorImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$OpenAiErrorImplCopyWith(
          _$OpenAiErrorImpl value, $Res Function(_$OpenAiErrorImpl) then) =
      __$$OpenAiErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? errorMessage});
}

/// @nodoc
class __$$OpenAiErrorImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$OpenAiErrorImpl>
    implements _$$OpenAiErrorImplCopyWith<$Res> {
  __$$OpenAiErrorImplCopyWithImpl(
      _$OpenAiErrorImpl _value, $Res Function(_$OpenAiErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = freezed,
  }) {
    return _then(_$OpenAiErrorImpl(
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$OpenAiErrorImpl extends OpenAiError {
  const _$OpenAiErrorImpl({this.errorMessage}) : super._();

  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'Failure.openAiError(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpenAiErrorImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OpenAiErrorImplCopyWith<_$OpenAiErrorImpl> get copyWith =>
      __$$OpenAiErrorImplCopyWithImpl<_$OpenAiErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? errorMessage) serverError,
    required TResult Function(String? errorMessage) networkError,
    required TResult Function(String? errorMessage) authenticationError,
    required TResult Function(String? errorMessage) openAiError,
    required TResult Function(String? errorMessage) notFound,
    required TResult Function(String? errorMessage) unknown,
    required TResult Function(String? errorMessage) internal,
  }) {
    return openAiError(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? errorMessage)? serverError,
    TResult? Function(String? errorMessage)? networkError,
    TResult? Function(String? errorMessage)? authenticationError,
    TResult? Function(String? errorMessage)? openAiError,
    TResult? Function(String? errorMessage)? notFound,
    TResult? Function(String? errorMessage)? unknown,
    TResult? Function(String? errorMessage)? internal,
  }) {
    return openAiError?.call(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? errorMessage)? serverError,
    TResult Function(String? errorMessage)? networkError,
    TResult Function(String? errorMessage)? authenticationError,
    TResult Function(String? errorMessage)? openAiError,
    TResult Function(String? errorMessage)? notFound,
    TResult Function(String? errorMessage)? unknown,
    TResult Function(String? errorMessage)? internal,
    required TResult orElse(),
  }) {
    if (openAiError != null) {
      return openAiError(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError value) serverError,
    required TResult Function(NetworkError value) networkError,
    required TResult Function(AuthenticationError value) authenticationError,
    required TResult Function(OpenAiError value) openAiError,
    required TResult Function(NotFound value) notFound,
    required TResult Function(Unknown value) unknown,
    required TResult Function(InternalError value) internal,
  }) {
    return openAiError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerError value)? serverError,
    TResult? Function(NetworkError value)? networkError,
    TResult? Function(AuthenticationError value)? authenticationError,
    TResult? Function(OpenAiError value)? openAiError,
    TResult? Function(NotFound value)? notFound,
    TResult? Function(Unknown value)? unknown,
    TResult? Function(InternalError value)? internal,
  }) {
    return openAiError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError value)? serverError,
    TResult Function(NetworkError value)? networkError,
    TResult Function(AuthenticationError value)? authenticationError,
    TResult Function(OpenAiError value)? openAiError,
    TResult Function(NotFound value)? notFound,
    TResult Function(Unknown value)? unknown,
    TResult Function(InternalError value)? internal,
    required TResult orElse(),
  }) {
    if (openAiError != null) {
      return openAiError(this);
    }
    return orElse();
  }
}

abstract class OpenAiError extends Failure {
  const factory OpenAiError({final String? errorMessage}) = _$OpenAiErrorImpl;
  const OpenAiError._() : super._();

  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$OpenAiErrorImplCopyWith<_$OpenAiErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotFoundImplCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory _$$NotFoundImplCopyWith(
          _$NotFoundImpl value, $Res Function(_$NotFoundImpl) then) =
      __$$NotFoundImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? errorMessage});
}

/// @nodoc
class __$$NotFoundImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$NotFoundImpl>
    implements _$$NotFoundImplCopyWith<$Res> {
  __$$NotFoundImplCopyWithImpl(
      _$NotFoundImpl _value, $Res Function(_$NotFoundImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = freezed,
  }) {
    return _then(_$NotFoundImpl(
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$NotFoundImpl extends NotFound {
  const _$NotFoundImpl({this.errorMessage}) : super._();

  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'Failure.notFound(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotFoundImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotFoundImplCopyWith<_$NotFoundImpl> get copyWith =>
      __$$NotFoundImplCopyWithImpl<_$NotFoundImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? errorMessage) serverError,
    required TResult Function(String? errorMessage) networkError,
    required TResult Function(String? errorMessage) authenticationError,
    required TResult Function(String? errorMessage) openAiError,
    required TResult Function(String? errorMessage) notFound,
    required TResult Function(String? errorMessage) unknown,
    required TResult Function(String? errorMessage) internal,
  }) {
    return notFound(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? errorMessage)? serverError,
    TResult? Function(String? errorMessage)? networkError,
    TResult? Function(String? errorMessage)? authenticationError,
    TResult? Function(String? errorMessage)? openAiError,
    TResult? Function(String? errorMessage)? notFound,
    TResult? Function(String? errorMessage)? unknown,
    TResult? Function(String? errorMessage)? internal,
  }) {
    return notFound?.call(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? errorMessage)? serverError,
    TResult Function(String? errorMessage)? networkError,
    TResult Function(String? errorMessage)? authenticationError,
    TResult Function(String? errorMessage)? openAiError,
    TResult Function(String? errorMessage)? notFound,
    TResult Function(String? errorMessage)? unknown,
    TResult Function(String? errorMessage)? internal,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError value) serverError,
    required TResult Function(NetworkError value) networkError,
    required TResult Function(AuthenticationError value) authenticationError,
    required TResult Function(OpenAiError value) openAiError,
    required TResult Function(NotFound value) notFound,
    required TResult Function(Unknown value) unknown,
    required TResult Function(InternalError value) internal,
  }) {
    return notFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerError value)? serverError,
    TResult? Function(NetworkError value)? networkError,
    TResult? Function(AuthenticationError value)? authenticationError,
    TResult? Function(OpenAiError value)? openAiError,
    TResult? Function(NotFound value)? notFound,
    TResult? Function(Unknown value)? unknown,
    TResult? Function(InternalError value)? internal,
  }) {
    return notFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError value)? serverError,
    TResult Function(NetworkError value)? networkError,
    TResult Function(AuthenticationError value)? authenticationError,
    TResult Function(OpenAiError value)? openAiError,
    TResult Function(NotFound value)? notFound,
    TResult Function(Unknown value)? unknown,
    TResult Function(InternalError value)? internal,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(this);
    }
    return orElse();
  }
}

abstract class NotFound extends Failure {
  const factory NotFound({final String? errorMessage}) = _$NotFoundImpl;
  const NotFound._() : super._();

  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$NotFoundImplCopyWith<_$NotFoundImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnknownImplCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory _$$UnknownImplCopyWith(
          _$UnknownImpl value, $Res Function(_$UnknownImpl) then) =
      __$$UnknownImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? errorMessage});
}

/// @nodoc
class __$$UnknownImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$UnknownImpl>
    implements _$$UnknownImplCopyWith<$Res> {
  __$$UnknownImplCopyWithImpl(
      _$UnknownImpl _value, $Res Function(_$UnknownImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = freezed,
  }) {
    return _then(_$UnknownImpl(
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$UnknownImpl extends Unknown {
  const _$UnknownImpl({this.errorMessage}) : super._();

  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'Failure.unknown(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnknownImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnknownImplCopyWith<_$UnknownImpl> get copyWith =>
      __$$UnknownImplCopyWithImpl<_$UnknownImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? errorMessage) serverError,
    required TResult Function(String? errorMessage) networkError,
    required TResult Function(String? errorMessage) authenticationError,
    required TResult Function(String? errorMessage) openAiError,
    required TResult Function(String? errorMessage) notFound,
    required TResult Function(String? errorMessage) unknown,
    required TResult Function(String? errorMessage) internal,
  }) {
    return unknown(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? errorMessage)? serverError,
    TResult? Function(String? errorMessage)? networkError,
    TResult? Function(String? errorMessage)? authenticationError,
    TResult? Function(String? errorMessage)? openAiError,
    TResult? Function(String? errorMessage)? notFound,
    TResult? Function(String? errorMessage)? unknown,
    TResult? Function(String? errorMessage)? internal,
  }) {
    return unknown?.call(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? errorMessage)? serverError,
    TResult Function(String? errorMessage)? networkError,
    TResult Function(String? errorMessage)? authenticationError,
    TResult Function(String? errorMessage)? openAiError,
    TResult Function(String? errorMessage)? notFound,
    TResult Function(String? errorMessage)? unknown,
    TResult Function(String? errorMessage)? internal,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError value) serverError,
    required TResult Function(NetworkError value) networkError,
    required TResult Function(AuthenticationError value) authenticationError,
    required TResult Function(OpenAiError value) openAiError,
    required TResult Function(NotFound value) notFound,
    required TResult Function(Unknown value) unknown,
    required TResult Function(InternalError value) internal,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerError value)? serverError,
    TResult? Function(NetworkError value)? networkError,
    TResult? Function(AuthenticationError value)? authenticationError,
    TResult? Function(OpenAiError value)? openAiError,
    TResult? Function(NotFound value)? notFound,
    TResult? Function(Unknown value)? unknown,
    TResult? Function(InternalError value)? internal,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError value)? serverError,
    TResult Function(NetworkError value)? networkError,
    TResult Function(AuthenticationError value)? authenticationError,
    TResult Function(OpenAiError value)? openAiError,
    TResult Function(NotFound value)? notFound,
    TResult Function(Unknown value)? unknown,
    TResult Function(InternalError value)? internal,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class Unknown extends Failure {
  const factory Unknown({final String? errorMessage}) = _$UnknownImpl;
  const Unknown._() : super._();

  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$UnknownImplCopyWith<_$UnknownImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InternalErrorImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$InternalErrorImplCopyWith(
          _$InternalErrorImpl value, $Res Function(_$InternalErrorImpl) then) =
      __$$InternalErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? errorMessage});
}

/// @nodoc
class __$$InternalErrorImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$InternalErrorImpl>
    implements _$$InternalErrorImplCopyWith<$Res> {
  __$$InternalErrorImplCopyWithImpl(
      _$InternalErrorImpl _value, $Res Function(_$InternalErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = freezed,
  }) {
    return _then(_$InternalErrorImpl(
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$InternalErrorImpl extends InternalError {
  const _$InternalErrorImpl({this.errorMessage}) : super._();

  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'Failure.internal(errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InternalErrorImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InternalErrorImplCopyWith<_$InternalErrorImpl> get copyWith =>
      __$$InternalErrorImplCopyWithImpl<_$InternalErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? errorMessage) serverError,
    required TResult Function(String? errorMessage) networkError,
    required TResult Function(String? errorMessage) authenticationError,
    required TResult Function(String? errorMessage) openAiError,
    required TResult Function(String? errorMessage) notFound,
    required TResult Function(String? errorMessage) unknown,
    required TResult Function(String? errorMessage) internal,
  }) {
    return internal(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? errorMessage)? serverError,
    TResult? Function(String? errorMessage)? networkError,
    TResult? Function(String? errorMessage)? authenticationError,
    TResult? Function(String? errorMessage)? openAiError,
    TResult? Function(String? errorMessage)? notFound,
    TResult? Function(String? errorMessage)? unknown,
    TResult? Function(String? errorMessage)? internal,
  }) {
    return internal?.call(errorMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? errorMessage)? serverError,
    TResult Function(String? errorMessage)? networkError,
    TResult Function(String? errorMessage)? authenticationError,
    TResult Function(String? errorMessage)? openAiError,
    TResult Function(String? errorMessage)? notFound,
    TResult Function(String? errorMessage)? unknown,
    TResult Function(String? errorMessage)? internal,
    required TResult orElse(),
  }) {
    if (internal != null) {
      return internal(errorMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError value) serverError,
    required TResult Function(NetworkError value) networkError,
    required TResult Function(AuthenticationError value) authenticationError,
    required TResult Function(OpenAiError value) openAiError,
    required TResult Function(NotFound value) notFound,
    required TResult Function(Unknown value) unknown,
    required TResult Function(InternalError value) internal,
  }) {
    return internal(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerError value)? serverError,
    TResult? Function(NetworkError value)? networkError,
    TResult? Function(AuthenticationError value)? authenticationError,
    TResult? Function(OpenAiError value)? openAiError,
    TResult? Function(NotFound value)? notFound,
    TResult? Function(Unknown value)? unknown,
    TResult? Function(InternalError value)? internal,
  }) {
    return internal?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError value)? serverError,
    TResult Function(NetworkError value)? networkError,
    TResult Function(AuthenticationError value)? authenticationError,
    TResult Function(OpenAiError value)? openAiError,
    TResult Function(NotFound value)? notFound,
    TResult Function(Unknown value)? unknown,
    TResult Function(InternalError value)? internal,
    required TResult orElse(),
  }) {
    if (internal != null) {
      return internal(this);
    }
    return orElse();
  }
}

abstract class InternalError extends Failure {
  const factory InternalError({final String? errorMessage}) =
      _$InternalErrorImpl;
  const InternalError._() : super._();

  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$InternalErrorImplCopyWith<_$InternalErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
