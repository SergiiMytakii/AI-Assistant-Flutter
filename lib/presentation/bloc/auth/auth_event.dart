part of 'auth_bloc.dart';

@freezed
class AuthenticationEvent with _$AuthenticationEvent {
  const factory AuthenticationEvent.checkStatus() = CheckAuthenticationStatus;
  const factory AuthenticationEvent.signOutRequested() =
      AuthenticationSignOutRequested;
  const factory AuthenticationEvent.signInRequested(
      {required String email,
      required String password}) = AuthenticationSignInRequested;
  const factory AuthenticationEvent.signUpRequested(
      {required String email,
      required String password}) = AuthenticationSignUpRequested;
}
