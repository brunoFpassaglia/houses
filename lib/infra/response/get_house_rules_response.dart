import 'dart:convert';

import 'package:houses/domain/models/house_rules_model.dart';

class GetHouseRulesResponseResponse {
  final bool success;
  final List<HouseRulesModel> data;
  final String message;

  GetHouseRulesResponseResponse(
    this.success,
    this.data,
    this.message,
  );

  Map<String, dynamic> toMap() {
    return {
      'success': success,
      'data': data.map((x) => x.toMap()).toList(),
      'message': message,
    };
  }

  factory GetHouseRulesResponseResponse.fromMap(Map<String, dynamic> map) {
    return GetHouseRulesResponseResponse(
      map['success'],
      List<HouseRulesModel>.from(
          map['data']?.map((x) => HouseRulesModel.fromMap(x))),
      map['message'],
    );
  }

  String toJson() => json.encode(toMap());

  factory GetHouseRulesResponseResponse.fromJson(String source) =>
      GetHouseRulesResponseResponse.fromMap(json.decode(source));
}
