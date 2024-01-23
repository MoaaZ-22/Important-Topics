import 'package:animation/modules/bloc_package/repos/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;
  AuthBloc(this._authRepository)
      : super(const AuthStateLoggedOut(isLoading: false)) {
    on<AuthEventLogin>((event, emit) async {
      emit(const AuthStateLoggedOut(isLoading: true));
      await _authRepository.login();
      emit(const AuthStateLoggedIn(isLoading: false));
    });

    on<AuthEventLogout>((event, emit) async {
      emit(const AuthStateLoggedIn(isLoading: true));
      await _authRepository.logout();
      emit(const AuthStateLoggedOut(isLoading: false));
    });
  }
}
