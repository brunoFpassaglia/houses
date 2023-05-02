import 'package:flutter_modular/flutter_modular.dart';
import 'package:houses/domain/repository/house_rules_repository.dart';
import 'package:houses/domain/usecases/house_rules_usecases.dart';
import 'package:houses/external/datasources/house_rules_datasource.dart';
import 'package:houses/infra/datasources/house_rules_datasource.dart';
import 'package:houses/infra/repository/house_rules_repository.dart';
import 'package:houses/presentation/house_rules/house_rules_bloc.dart';
import 'package:houses/presentation/house_rules/house_rules_page.dart';
import 'package:http/http.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<Client>((i) => Client()),
        Bind.factory<HouseRulesDatasource>(
            (i) => HouseRulesDatasourceImpl(i())),
        Bind.factory<HouseRulesRepository>(
            (i) => HouseRulesRepositoryImpl(i())),
        Bind.factory<HouseRulesUseCase>((i) => HouseRulesUseCaseImpl(i())),
        Bind.singleton<HouseRulesBloc>((i) => HouseRulesBloc(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, __) => const HouseRulesPage()),
      ];
}
