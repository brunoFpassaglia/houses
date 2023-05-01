import 'package:houses/domain/entities/house_rules.dart';

abstract class HouseRulesDatasource {
  Future<List<HouseRules>> getHouseRules();
  Future<HouseRules> createHouseRules(HouseRules houseRules);
  Future<HouseRules> showHouseRules(HouseRules houseRules);
  Future<HouseRules> updateHouseRules(HouseRules houseRules);
  Future<void> deleteHouseRules(HouseRules houseRules);
}
