import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:my_template/data/use_cases/auth/sign_in_use_case.dart';
import 'package:my_template/data/use_cases/auth/sign_out_use_case.dart';
import 'package:my_template/data/use_cases/auth/sign_up_use_case.dart';
import 'package:my_template/data/use_cases/auth/user_stream_use_case.dart';
import 'package:my_template/domain/entities/user.dart';
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

  AuthenticationBloc(
    this._signInUseCase,
    this._signUpUseCase,
    this._signOutUseCase,
    this._userStreamUseCase,
  ) : super(const AuthenticationState.initial()) {
    on<CheckAuthenticationStatus>(_onCheckStatus);
    on<AuthenticationSignOutRequested>(_onSignOutRequested);
    on<AuthenticationSignInRequested>(_onSignInRequested);
    on<AuthenticationSignUpRequested>(_onSignUpRequested);
  }

  void _onCheckStatus(CheckAuthenticationStatus event,
      Emitter<AuthenticationState> emit) async {
    final user = await _userStreamUseCase();
    if (user != null) {
      emit(AuthenticationState.authenticated(user));
    } else {
      emit(const AuthenticationState.unauthenticated());
    }
  }

  Future<void> _onSignOutRequested(AuthenticationSignOutRequested event,
      Emitter<AuthenticationState> emit) async {
    await _signOutUseCase();
    emit(const AuthenticationState.unauthenticated());
  }

  Future<void> _onSignInRequested(AuthenticationSignInRequested event,
      Emitter<AuthenticationState> emit) async {
    final result =
        await _signInUseCase(email: event.email, password: event.password);
    emit(AuthenticationState.error('failure'));
    result.fold(
      (failure) => emit(AuthenticationState.error(failure)),
      (user) => emit(AuthenticationState.authenticated(user)),
    );
  }

  Future<void> _onSignUpRequested(AuthenticationSignUpRequested event,
      Emitter<AuthenticationState> emit) async {
    final result =
        await _signUpUseCase(email: event.email, password: event.password);

    result.fold(
      (failure) => emit(AuthenticationState.error(failure)),
      (user) => emit(AuthenticationState.authenticated(user)),
    );
  }
}
