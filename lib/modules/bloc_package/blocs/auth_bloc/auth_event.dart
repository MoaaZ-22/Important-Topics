part of 'auth_bloc.dart';

sealed class AuthEvent {
  const AuthEvent();
}

class AuthEventLogin extends AuthEvent {}

class AuthEventLogout extends AuthEvent {
  const AuthEventLogout();
}
