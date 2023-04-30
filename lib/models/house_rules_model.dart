import 'dart:convert';

import 'package:houses/entities/house_rules.dart';

class HouseRulesModel implements HouseRules {
  @override
  final int id;
  @override
  final String name;
  @override
  final bool active;
  @override
  final int order;

  HouseRulesModel({
    required this.id,
    required this.name,
    required this.active,
    required this.order,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'active': active,
      'order': order,
    };
  }

  factory HouseRulesModel.fromMap(Map<String, dynamic> map) {
    return HouseRulesModel(
      id: map['id'],
      name: map['name'],
      active: map['active'],
      order: map['order'],
    );
  }

  String toJson() => json.encode(toMap());

  factory HouseRulesModel.fromJson(String source) =>
      HouseRulesModel.fromMap(json.decode(source));
}
