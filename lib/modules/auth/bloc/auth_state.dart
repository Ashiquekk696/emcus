// ignore_for_file: public_member_api_docs, sort_constructors_first
enum AuthStatus { initial, loading, success, failure }

class AuthState {
  final String? errorMessage;
  AuthStatus loginStatus;
  AuthStatus logutStatus;
  AuthStatus registerStatus;
  AuthState(
      {this.errorMessage,
      this.loginStatus = AuthStatus.initial,
      this.logutStatus = AuthStatus.initial,
      this.registerStatus = AuthStatus.initial});

  factory AuthState.initial() => AuthState(
      loginStatus: AuthStatus.initial,
      logutStatus: AuthStatus.initial,
      registerStatus: AuthStatus.initial);

  AuthState copyWith({
    String? errorMessage,
    AuthStatus? loginStatus,
    AuthStatus? logutStatus,
    AuthStatus? registerStatus,
  }) {
    return AuthState(
      errorMessage: errorMessage ?? this.errorMessage,
      loginStatus: loginStatus ?? this.loginStatus,
      logutStatus: logutStatus ?? this.logutStatus,
      registerStatus: registerStatus ?? this.registerStatus,
    );
  }
}
