import 'dart:convert';

import 'package:houses/feature/house_rules/domain/models/house_rules_model.dart';

class BaseHouseRulesResponseResponse {
  final bool success;
  final HouseRulesModel data;
  final String message;

  BaseHouseRulesResponseResponse(
    this.success,
    this.data,
    this.message,
  );

  Map<String, dynamic> toMap() {
    return {
      'success': success,
      'data': data.toMap(),
      'message': message,
    };
  }

  factory BaseHouseRulesResponseResponse.fromMap(Map<String, dynamic> map) {
    return BaseHouseRulesResponseResponse(
      map['success'],
      HouseRulesModel.fromMap(map['data']),
      map['message'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BaseHouseRulesResponseResponse.fromJson(String source) =>
      BaseHouseRulesResponseResponse.fromMap(json.decode(source));
}
