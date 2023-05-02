import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:houses/domain/entities/house_rules.dart';
import 'package:houses/domain/models/house_rules_model.dart';
import 'package:houses/domain/usecases/house_rules_usecases.dart';
import 'package:houses/presentation/house_rules/house_rules_event.dart';
import 'package:houses/presentation/house_rules/house_rules_state.dart';

class HouseRulesBloc extends Bloc<HouseRulesEvent, HouseRulesState> {
  final HouseRulesUseCase _useCase;

  HouseRulesBloc(this._useCase) : super(HouseRulesGetLoading()) {
    on<LoadHouseRulesEvent>(_onLoadHouseRules);
    on<UpdateHouseRulesEvent>(_onUpdateHouseRulesEvent);
    on<CreateHouseRulesEvent>(_onCreateHouseRulesEvent);
    on<DeleteHouseRulesEvent>(_onDeleteHouseRulesEvent);
  }

  _onLoadHouseRules(HouseRulesEvent event, Emitter emit) async {
    emit(HouseRulesGetLoading());
    try {
      var houseRules = await _useCase.getHouseRules();
      emit(HouseRulesGetSuccess(houseRules));
    } catch (_) {
      emit(HouseRulesGetError('Error loading house rules'));
    }
  }

  _onUpdateHouseRulesEvent(UpdateHouseRulesEvent event, Emitter emit) async {
    emit(HouseRulesUpdateLoading());
    try {
      var houseRules = await _useCase.updateHouseRules(HouseRulesModel(
          active: event.newActive,
          name: event.newName,
          id: event.houseRules.id,
          order: event.houseRules.order));
      emit(HouseRulesUpdateSuccess(houseRules));
    } catch (e) {
      emit(HouseRulesUpdateError('Error updating house rules'));
    }
  }

  _onCreateHouseRulesEvent(CreateHouseRulesEvent event, Emitter emit) async {
    emit(HouseRulesCreateLoading());
    try {
      var houseRules = await _useCase.createHouseRules(HouseRulesModel(
          active: event.active, name: event.name, id: 999, order: 999));
      emit(HouseRulesUpdateSuccess(houseRules));
    } catch (e) {
      emit(HouseRulesCreateError('Error creating house rules'));
    }
  }

  _onDeleteHouseRulesEvent(DeleteHouseRulesEvent event, Emitter emit) async {
    emit(HouseRulesDeleteLoading());
    try {
      await _useCase.deleteHouseRules(event.houseRules);
      emit(HouseRulesDeleteSuccess());
    } catch (e) {
      emit(HouseRulesDeleteError('Error deleting house rules'));
    }
  }
}
