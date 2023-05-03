import 'package:houses/feature/login/domain/entities/login.dart';
import 'package:houses/feature/login/infra/datasources/login_datasource.dart';

class LoginDatasourceImpl implements LoginDatasource {
  @override
  Future<void> login(Login login) async {
    await Future.delayed(const Duration(seconds: 2));
    if (login.password == '1234') {
      return;
    } else {
      throw Exception('Invalid credentials');
    }
  }
}
