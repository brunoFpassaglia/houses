import 'package:houses/domain/entities/house_rules.dart';

abstract class HouseRulesState {}

abstract class HouseRulesSuccess extends HouseRulesState {
  final String message;

  HouseRulesSuccess(this.message);
}

abstract class HouseRulesLoading extends HouseRulesState {}

abstract class HouseRulesError extends HouseRulesState {
  final String error;

  HouseRulesError(this.error);
}

class HouseRulesGetLoading extends HouseRulesState {}

class HouseRulesGetSuccess extends HouseRulesState {
  final List<HouseRules> houseRules;

  HouseRulesGetSuccess(this.houseRules);
}

class HouseRulesGetError extends HouseRulesError {
  HouseRulesGetError(super.error);
}

class HouseRulesUpdateSuccess extends HouseRulesSuccess {
  final HouseRules houseRules;

  HouseRulesUpdateSuccess(this.houseRules) : super('Update successful!');
}

class HouseRulesUpdateError extends HouseRulesError {
  HouseRulesUpdateError(super.error);
}

class HouseRulesUpdateLoading extends HouseRulesLoading {}

class HouseRulesCreateSuccess extends HouseRulesSuccess {
  final HouseRules houseRules;

  HouseRulesCreateSuccess(this.houseRules) : super('Create successful!');
}

class HouseRulesCreateError extends HouseRulesError {
  HouseRulesCreateError(super.error);
}

class HouseRulesCreateLoading extends HouseRulesLoading {}

class HouseRulesDeleteSuccess extends HouseRulesSuccess {
  HouseRulesDeleteSuccess() : super('Delete successful!');
}

class HouseRulesDeleteError extends HouseRulesError {
  HouseRulesDeleteError(super.error);
}

class HouseRulesDeleteLoading extends HouseRulesLoading {}
