sealed class AuthEvent {}

class GetCurrentUserEvent extends AuthEvent {}

class SignInEvent extends AuthEvent {
  SignInEvent({required this.email, required this.password});

  final String email;
  final String password;
}

class SignOutEvent extends AuthEvent {}
