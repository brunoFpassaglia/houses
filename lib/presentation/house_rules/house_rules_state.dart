import 'package:houses/domain/entities/house_rules.dart';

abstract class HouseRulesState {}

class HouseRulesLoading extends HouseRulesState {}

class HouseRulesSucess extends HouseRulesState {
  final List<HouseRules> houseRules;

  HouseRulesSucess(this.houseRules);
}

class HouseRulesError extends HouseRulesState {
  final String error;

  HouseRulesError(this.error);
}
