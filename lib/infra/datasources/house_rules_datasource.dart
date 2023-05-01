import 'dart:convert';

import 'package:houses/domain/entities/house_rules.dart';
import 'package:houses/infra/response/base_house_rules_response.dart';

abstract class HouseRulesDatasource {
  Future<List<HouseRules>> getHouseRules();
  Future<BaseHouseRulesResponseResponse> createHouseRules();
  Future<BaseHouseRulesResponseResponse> showHouseRules();
  Future<BaseHouseRulesResponseResponse> updateHouseRules();
  Future<void> deleteHouseRules();
}
