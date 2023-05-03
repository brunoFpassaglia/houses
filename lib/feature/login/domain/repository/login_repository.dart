import 'package:houses/feature/login/domain/entities/login.dart';

abstract class LoginRepository {
  Future<void> login(Login login);
}
