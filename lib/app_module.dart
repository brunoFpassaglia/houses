import 'package:flutter_modular/flutter_modular.dart';
import 'package:houses/domain/repository/house_rules_repository.dart';
import 'package:houses/domain/usescases/house_rules_usecases.dart';
import 'package:houses/external/datasources/house_rules_datasource.dart';
import 'package:houses/infra/datasources/house_rules_datasource.dart';
import 'package:houses/infra/repository/house_rules_repository.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory<HouseRulesDatasource>(
          (i) => HouseRulesDatasourceImpl(),
        ),
        Bind.factory<HouseRulesRepository>(
          (i) => HouseRulesRepositoryImpl(i()),
        ),
        Bind.factory<HouseRulesUseCase>(
          (i) => HouseRulesUseCaseImpl(i()),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        // ChildRoute('/', child: (context, args) => HomePage()),
      ];
}