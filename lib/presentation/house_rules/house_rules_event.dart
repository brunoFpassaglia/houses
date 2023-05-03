import 'package:houses/feature/house_rules/domain/entities/house_rules.dart';

abstract class HouseRulesEvent {}

class LoadHouseRulesEvent extends HouseRulesEvent {}

class CreateHouseRulesEvent extends HouseRulesEvent {
  final String name;
  final int active;

  CreateHouseRulesEvent(this.name, this.active);
}

class DeleteHouseRulesEvent extends HouseRulesEvent {
  final HouseRules houseRules;

  DeleteHouseRulesEvent(this.houseRules);
}

class UpdateHouseRulesEvent extends HouseRulesEvent {
  final HouseRules houseRules;
  final String newName;
  final int newActive;

  UpdateHouseRulesEvent(this.houseRules, this.newName, this.newActive);
}

class LoadMoreHouseRulesEvent extends HouseRulesEvent {}
