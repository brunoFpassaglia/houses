import 'package:houses/domain/repository/house_rules_repository.dart';
import 'package:houses/infra/datasources/house_rules_datasource.dart';

class HouseRulesRepositoryImpl implements HouseRulesRepository {
  final HouseRulesDatasource _datasource;

  HouseRulesRepositoryImpl(this._datasource);

  @override
  createHouseRules() {
    // TODO: implement createHouseRules
    throw UnimplementedError();
  }

  @override
  deleteHouseRules() {
    // TODO: implement deleteHouseRules
    throw UnimplementedError();
  }

  @override
  getHouseRules() {
    // TODO: implement getHouseRules
    throw UnimplementedError();
  }

  @override
  showHouseRules() {
    // TODO: implement showHouseRules
    throw UnimplementedError();
  }

  @override
  updateHouseRules() {
    // TODO: implement updateHouseRules
    throw UnimplementedError();
  }
}
