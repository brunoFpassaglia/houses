import 'package:houses/feature/house_rules/domain/entities/house_rules.dart';

abstract class HouseRulesDatasource {
  Future<List<HouseRules>> getHouseRules();
  Future<List<HouseRules>> loadMoreHouseRules();
  Future<HouseRules> createHouseRules(HouseRules houseRules);
  Future<HouseRules> showHouseRules(HouseRules houseRules);
  Future<HouseRules> updateHouseRules(HouseRules houseRules);
  Future<void> deleteHouseRules(HouseRules houseRules);
}
