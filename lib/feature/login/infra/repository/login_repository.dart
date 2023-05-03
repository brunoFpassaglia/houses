import 'package:houses/feature/login/domain/entities/login.dart';
import 'package:houses/feature/login/domain/repository/login_repository.dart';
import 'package:houses/feature/login/infra/datasources/login_datasource.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDatasource _datasource;

  LoginRepositoryImpl(this._datasource);
  @override
  Future<void> login(Login login) async {
    return await _datasource.login(login);
  }
}
