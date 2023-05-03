import 'package:houses/feature/login/domain/entities/login.dart';
import 'package:houses/feature/login/domain/repository/login_repository.dart';

abstract class LoginUseCase {
  Future<void> login(Login login);
}

class LoginUseCaseImpl implements LoginUseCase {
  final LoginRepository _repo;

  LoginUseCaseImpl(this._repo);
  @override
  Future<void> login(Login login) async {
    return await _repo.login(login);
  }
}
