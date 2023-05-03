import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:houses/app_module.dart';
import 'package:houses/feature/house_rules/domain/entities/house_rules.dart';
import 'package:houses/feature/house_rules/domain/models/house_rules_model.dart';
import 'package:houses/feature/house_rules/domain/usecases/house_rules_usecases.dart';
import 'package:modular_test/modular_test.dart';

void main() {
  late HouseRulesUseCase usecase;
  HouseRules houseRules =
      HouseRulesModel(active: 0, name: 'some name', id: 800, order: 999);

  late HouseRules newHouse;

  setUpAll(() {
    initModule(AppModule());
    usecase = Modular.get<HouseRulesUseCase>();
  });

  test('should return a list of house rules', () async {
    var result = await usecase.getHouseRules();
    expect(result, isList);
  });

  test('should return the created house rules', () async {
    var result = await usecase.createHouseRules(houseRules);
    expect(result, isA<HouseRules>());
    newHouse = result;
  });

  test('should return the updated house rules', () async {
    var result = await usecase.updateHouseRules(newHouse);
    expect(result, isA<HouseRules>());
  });

  test('should return null', () async {
    expect(() async => await usecase.updateHouseRules(newHouse), isA<void>());
  });
}
