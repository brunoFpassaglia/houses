import 'dart:convert';

import 'package:houses/domain/models/house_rules_model.dart';

class GetHouseRulesResponseResponse {
  final bool success;
  final List<HouseRulesModel> entities;
  final Map<String, dynamic> pagination;
  final String message;

  GetHouseRulesResponseResponse(
    this.success,
    this.entities,
    this.pagination,
    this.message,
  );

  factory GetHouseRulesResponseResponse.fromMap(Map<String, dynamic> map) {
    return GetHouseRulesResponseResponse(
      map['success'],
      List<HouseRulesModel>.from(
          map['data']['entities']?.map((x) => HouseRulesModel.fromMap(x))),
      map['data']['pagination'],
      map['message'],
    );
  }

  factory GetHouseRulesResponseResponse.fromJson(String source) =>
      GetHouseRulesResponseResponse.fromMap(json.decode(source));
}
