import 'package:houses/feature/login/domain/entities/login.dart';

abstract class LoginDatasource {
  Future<void> login(Login login);
}
