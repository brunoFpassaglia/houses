abstract class LoginEvent {}

class LoginAttemptEvent extends LoginEvent {
  final String email;
  final String password;

  LoginAttemptEvent({
    required this.email,
    required this.password,
  });
}
