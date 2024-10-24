import 'package:ai_assiatant_flutter/data/use_cases/auth/sign_in_by_uuid_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:ai_assiatant_flutter/data/use_cases/auth/sign_in_use_case.dart';
import 'package:ai_assiatant_flutter/data/use_cases/auth/sign_out_use_case.dart';
import 'package:ai_assiatant_flutter/data/use_cases/auth/sign_up_use_case.dart';
import 'package:ai_assiatant_flutter/data/use_cases/auth/user_stream_use_case.dart';
import 'package:ai_assiatant_flutter/domain/entities/user/user.dart';
part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@singleton
class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final SignInUseCase _signInUseCase;
  final SignUpUseCase _signUpUseCase;
  final SignOutUseCase _signOutUseCase;
  final UserStreamUseCase _userStreamUseCase;
  final SignInByUuidUseCase _signInByUuidUseCase;
  User? user;

  AuthenticationBloc(
    this._signInUseCase,
    this._signUpUseCase,
    this._signOutUseCase,
    this._userStreamUseCase,
    this._signInByUuidUseCase,
  ) : super(const AuthenticationState.initial()) {
    on<CheckAuthenticationStatus>(_onCheckStatus);
    on<AuthenticationSignOutRequested>(_onSignOutRequested);
    on<AuthenticationSignInRequested>(_onSignInRequested);
    on<AuthenticationSignUpRequested>(_onSignUpRequested);
    on<AuthenticateByUuid>(_onAuthenticateByUuid);
  }

  void _onCheckStatus(CheckAuthenticationStatus event,
      Emitter<AuthenticationState> emit) async {
    emit(const AuthenticationState.loading());

    final user = await _userStreamUseCase();
    if (user != null) {
      this.user = user;
      emit(AuthenticationState.authenticated(user));
    } else {
      emit(const AuthenticationState.unauthenticated());
    }
  }

  Future<void> _onSignOutRequested(AuthenticationSignOutRequested event,
      Emitter<AuthenticationState> emit) async {
    emit(const AuthenticationState.loading());
    user = null;
    await _signOutUseCase();
    emit(const AuthenticationState.unauthenticated());
  }

  Future<void> _onSignInRequested(AuthenticationSignInRequested event,
      Emitter<AuthenticationState> emit) async {
    emit(const AuthenticationState.loading());

    final result =
        await _signInUseCase(email: event.email, password: event.password);
    result.fold(
      (failure) =>
          emit(AuthenticationState.error(failure.toUserFriendlyMessage())),
      (user) {
        this.user = user;
        emit(AuthenticationState.authenticated(user));
      },
    );
  }

  Future<void> _onSignUpRequested(AuthenticationSignUpRequested event,
      Emitter<AuthenticationState> emit) async {
    emit(const AuthenticationState.loading());
    final result =
        await _signUpUseCase(email: event.email, password: event.password);

    result.fold(
      (failure) =>
          emit(AuthenticationState.error(failure.toUserFriendlyMessage())),
      (user) {
        this.user = user;
        emit(AuthenticationState.authenticated(user));
      },
    );
  }

  void _onAuthenticateByUuid(
      AuthenticateByUuid event, Emitter<AuthenticationState> emit) async {
    emit(const AuthenticationState.loading());

    final result = await _signInByUuidUseCase(uuid: event.uuid);
    result.fold(
      (failure) => emit(const AuthenticationState.unauthenticated()),
      (user) {
        this.user = user;
        emit(AuthenticationState.authenticated(user));
      },
    );
  }
}
