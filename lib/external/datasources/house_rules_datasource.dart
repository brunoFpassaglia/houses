import 'dart:convert';

import 'package:houses/domain/entities/house_rules.dart';
import 'package:houses/domain/models/house_rules_model.dart';
import 'package:houses/infra/request/base_house_rules_request.dart';
import 'package:houses/infra/response/base_house_rules_response.dart';
import 'package:houses/infra/datasources/house_rules_datasource.dart';
import 'package:houses/infra/response/get_house_rules_response.dart';
import 'package:houses/routes.dart';
import 'package:http/http.dart';

class HouseRulesDatasourceImpl implements HouseRulesDatasource {
  final Client _http;

  HouseRulesDatasourceImpl(this._http);

  Map<String, String> _headers = {
    'Authorization':
        'Bearer 40fe071962846075452a4f6123ae71697463cad20f51e237e2035b41af0513d8',
  };

  @override
  Future<HouseRules> createHouseRules(HouseRules houseRules) async {
    try {
      var response = await _http.post(Uri.https(CREATEHOUSERULES),
          body: BaseHouseRulesRequest(houseRules as HouseRulesModel).toJson(),
          headers: _headers);
      if (response.statusCode != 200) throw response;
      var body =
          BaseHouseRulesResponseResponse.fromJson(json.decode(response.body));
      return body.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteHouseRules(HouseRules houseRules) async {
    try {
      var response = await _http.delete(
          Uri.https('$DELETEHOUSERULES/${houseRules.id}'),
          headers: _headers);
      if (response.statusCode != 200) throw response;
      return;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<HouseRules>> getHouseRules() async {
    try {
      var response =
          await _http.get(Uri.https(GETHOUSERULES), headers: _headers);
      if (response.statusCode != 200) throw response;
      var body =
          GetHouseRulesResponseResponse.fromJson(json.decode(response.body));
      return body.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<HouseRules> showHouseRules(HouseRules houseRules) async {
    try {
      var response = await _http.get(
          Uri.https('$SHOWHOUSERULES/${houseRules.id}'),
          headers: _headers);
      if (response.statusCode != 200) throw response;
      var body =
          BaseHouseRulesResponseResponse.fromJson(json.decode(response.body));
      return body.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<HouseRules> updateHouseRules(HouseRules houseRules) async {
    try {
      var response = await _http.put(
          Uri.https('$GETHOUSERULES/${houseRules.id}'),
          body: BaseHouseRulesRequest(houseRules as HouseRulesModel).toJson(),
          headers: _headers);
      if (response.statusCode != 200) throw response;
      var body =
          BaseHouseRulesResponseResponse.fromJson(json.decode(response.body));
      return body.data;
    } catch (e) {
      rethrow;
    }
  }
}
