import 'package:houses/domain/repository/house_rules_repository.dart';

abstract class HouseRulesUseCase {
  getHouseRules();
  createHouseRules();
  showHouseRules();
  updateHouseRules();
  deleteHouseRules();
}

class HouseRulesUseCaseImpl implements HouseRulesUseCase {
  final HouseRulesRepository _repo;

  HouseRulesUseCaseImpl(this._repo);

  @override
  deleteHouseRules() {
    // TODO: implement deleteHouseRules
    throw UnimplementedError();
  }

  @override
  getHouseRules() {
    // TODO: implement getHouseRules
    throw UnimplementedError();
  }

  @override
  showHouseRules() {
    // TODO: implement showHouseRules
    throw UnimplementedError();
  }

  @override
  updateHouseRules() {
    // TODO: implement updateHouseRules
    throw UnimplementedError();
  }

  @override
  createHouseRules() {
    // TODO: implement createHouseRules
    throw UnimplementedError();
  }
}
