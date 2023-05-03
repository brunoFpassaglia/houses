import 'package:houses/feature/house_rules/domain/entities/house_rules.dart';
import 'package:houses/feature/house_rules/domain/models/house_rules_model.dart';
import 'package:houses/feature/house_rules/domain/repository/house_rules_repository.dart';

abstract class HouseRulesUseCase {
  Future<List<HouseRules>> getHouseRules();
  Future<List<HouseRules>> loadMoreHouseRules();
  Future<HouseRules> createHouseRules(HouseRules houseRules);
  Future<HouseRules> showHouseRules(HouseRules houseRules);
  Future<HouseRules> updateHouseRules(HouseRules houseRules);
  Future<void> deleteHouseRules(HouseRules houseRules);
}

class HouseRulesUseCaseImpl implements HouseRulesUseCase {
  final HouseRulesRepository _repo;

  HouseRulesUseCaseImpl(this._repo);

  @override
  Future<HouseRules> createHouseRules(HouseRules houseRules) async {
    return await _repo.createHouseRules(houseRules);
  }

  @override
  Future<void> deleteHouseRules(HouseRules houseRules) async {
    return await _repo.deleteHouseRules(houseRules);
  }

  @override
  Future<List<HouseRules>> getHouseRules() async {
    return await _repo.getHouseRules();
  }

  @override
  Future<HouseRules> showHouseRules(HouseRules houseRules) async {
    return await _repo.showHouseRules(houseRules);
  }

  @override
  Future<HouseRules> updateHouseRules(HouseRules houseRules) async {
    return await _repo.updateHouseRules(houseRules);
  }

  @override
  Future<List<HouseRules>> loadMoreHouseRules() async {
    return await _repo.loadMoreHouseRules();
  }
}
