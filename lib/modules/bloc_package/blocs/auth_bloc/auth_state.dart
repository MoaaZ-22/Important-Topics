part of 'auth_bloc.dart';

sealed class AuthState {
  const AuthState({
    required this.isLoading,
  });

  final bool isLoading;
}

class AuthStateLoggedOut extends AuthState {
  const AuthStateLoggedOut({required bool isLoading})
      : super(isLoading: isLoading);
}

class AuthStateLoggedIn extends AuthState {
  const AuthStateLoggedIn({required bool isLoading})
      : super(isLoading: isLoading);
}
