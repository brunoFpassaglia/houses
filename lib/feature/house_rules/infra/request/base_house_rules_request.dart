import 'dart:convert';

import 'package:houses/feature/house_rules/domain/models/house_rules_model.dart';

class BaseHouseRulesRequest {
  final HouseRulesModel house_rules;

  BaseHouseRulesRequest(this.house_rules);

  Map<String, dynamic> toMap() {
    return {
      'house_rules': house_rules.toMap(),
    };
  }

  factory BaseHouseRulesRequest.fromMap(Map<String, dynamic> map) {
    return BaseHouseRulesRequest(
      HouseRulesModel.fromMap(map['house_rules']),
    );
  }

  String toJson() => json.encode(toMap());

  factory BaseHouseRulesRequest.fromJson(String source) =>
      BaseHouseRulesRequest.fromMap(json.decode(source));
}
