import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:houses/domain/usecases/house_rules_usecases.dart';
import 'package:houses/presentation/house_rules/house_rules_event.dart';
import 'package:houses/presentation/house_rules/house_rules_state.dart';

class HouseRulesBloc extends Bloc<HouseRulesEvent, HouseRulesState> {
  final HouseRulesUseCase _useCase;

  HouseRulesBloc(this._useCase) : super(HouseRulesLoading()) {
    on<LoadHouseRulesEvent>(((event, emit) async {
      emit(HouseRulesLoading());
      try {
        var houseRules = await _useCase.getHouseRules();
        emit(HouseRulesSucess(houseRules));
      } catch (_) {
        emit(HouseRulesError('Ocorreu um erro ao carregar'));
      }
    }));
  }
}
