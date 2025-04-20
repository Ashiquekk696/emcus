import 'package:emcus/modules/auth/repository/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(AuthState.initial()) {
    on<LoginEvent>(_onLogin);
    on<SignUpEvent>(_onSignUp);
    on<LogoutEvent>(_onLogout);
  }

  Future<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(loginStatus: AuthStatus.loading));
    try {
      await authRepository.login(event.email, event.password);
      emit(state.copyWith(loginStatus: AuthStatus.success));
    } catch (e) {
      emit(state.copyWith(
          loginStatus: AuthStatus.failure, errorMessage: e.toString()));
    }
  }

  Future<void> _onSignUp(SignUpEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(registerStatus: AuthStatus.loading));
    try {
      await authRepository.signUp(event.email, event.password);
      emit(state.copyWith(registerStatus: AuthStatus.success));
    } catch (e) {
      emit(state.copyWith(
          registerStatus: AuthStatus.failure, errorMessage: e.toString()));
    }
  }

  Future<void> _onLogout(LogoutEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(logutStatus: AuthStatus.loading));
    try {
      await authRepository.logout();
      emit(state.copyWith(logutStatus: AuthStatus.success));
    } catch (e) {
      emit(state.copyWith(
          logutStatus: AuthStatus.failure, errorMessage: e.toString()));
    }
  }
}
