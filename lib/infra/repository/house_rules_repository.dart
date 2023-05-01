import 'package:houses/domain/entities/house_rules.dart';
import 'package:houses/domain/repository/house_rules_repository.dart';
import 'package:houses/infra/datasources/house_rules_datasource.dart';

class HouseRulesRepositoryImpl implements HouseRulesRepository {
  final HouseRulesDatasource _datasource;

  HouseRulesRepositoryImpl(this._datasource);

  @override
  Future<HouseRules> createHouseRules(HouseRules houseRules) async {
    return await _datasource.createHouseRules(houseRules);
  }

  @override
  Future<void> deleteHouseRules(HouseRules houseRules) async {
    return await _datasource.deleteHouseRules(houseRules);
  }

  @override
  Future<List<HouseRules>> getHouseRules() async {
    return await _datasource.getHouseRules();
  }

  @override
  Future<HouseRules> showHouseRules(HouseRules houseRules) async {
    return await _datasource.showHouseRules(houseRules);
  }

  @override
  Future<HouseRules> updateHouseRules(HouseRules houseRules) async {
    return await _datasource.updateHouseRules(houseRules);
  }
}
