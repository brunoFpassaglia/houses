import 'package:flutter_modular/flutter_modular.dart';
import 'package:houses/feature/house_rules/domain/repository/house_rules_repository.dart';
import 'package:houses/feature/house_rules/domain/usecases/house_rules_usecases.dart';
import 'package:houses/feature/house_rules/external/datasources/house_rules_datasource.dart';
import 'package:houses/feature/house_rules/infra/datasources/house_rules_datasource.dart';
import 'package:houses/feature/house_rules/infra/repository/house_rules_repository.dart';
import 'package:houses/feature/login/domain/repository/login_repository.dart';
import 'package:houses/feature/login/domain/usecases/login_usecase.dart';
import 'package:houses/feature/login/external/login_datasource.dart';
import 'package:houses/feature/login/infra/datasources/login_datasource.dart';
import 'package:houses/feature/login/infra/repository/login_repository.dart';
import 'package:houses/presentation/house_rules/house_rules_bloc.dart';
import 'package:houses/presentation/house_rules/house_rules_page.dart';
import 'package:houses/presentation/login/login_bloc.dart';
import 'package:houses/presentation/login/login_page.dart';
import 'package:http/http.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<Client>((i) => Client()),
        Bind.singleton<HouseRulesDatasource>(
            (i) => HouseRulesDatasourceImpl(i())),
        Bind.singleton<HouseRulesRepository>(
            (i) => HouseRulesRepositoryImpl(i())),
        Bind.singleton<HouseRulesUseCase>((i) => HouseRulesUseCaseImpl(i())),
        Bind.singleton<HouseRulesBloc>((i) => HouseRulesBloc(i())),
        Bind.singleton<LoginDatasource>((i) => LoginDatasourceImpl()),
        Bind.singleton<LoginRepository>((i) => LoginRepositoryImpl(i())),
        Bind.singleton<LoginUseCase>((i) => LoginUseCaseImpl(i())),
        Bind.singleton<LoginBloc>((i) => LoginBloc(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const LoginPage()),
        ChildRoute('/home', child: (_, __) => const HouseRulesPage()),
      ];
}
