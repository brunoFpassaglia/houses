import 'package:houses/feature/house_rules/domain/entities/house_rules.dart';

abstract class HouseRulesRepository {
  Future<List<HouseRules>> getHouseRules();
  Future<HouseRules> createHouseRules(HouseRules houseRules);
  Future<HouseRules> showHouseRules(HouseRules houseRules);
  Future<HouseRules> updateHouseRules(HouseRules houseRules);
  Future<void> deleteHouseRules(HouseRules houseRules);
  Future<List<HouseRules>> loadMoreHouseRules();
}
