import 'package:houses/feature/login/domain/entities/login.dart';

class LoginModel implements Login {
  @override
  final String email;
  @override
  final String password;

  LoginModel(this.email, this.password);
}
