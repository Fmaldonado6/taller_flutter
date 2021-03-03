abstract class AuthState {}

class AuthStateInitial extends AuthState {}

class AuthStateLoading extends AuthState {}

class AuthStateError extends AuthState {
  final String message;

  AuthStateError(this.message);
}

class AuthStateCompleted extends AuthState {
  final String username;

  AuthStateCompleted(this.username);
}
