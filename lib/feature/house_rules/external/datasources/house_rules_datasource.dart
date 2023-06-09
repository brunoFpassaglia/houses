import 'dart:convert';

import 'package:houses/feature/house_rules/domain/entities/house_rules.dart';
import 'package:houses/feature/house_rules/domain/models/house_rules_model.dart';
import 'package:houses/feature/house_rules/infra/request/base_house_rules_request.dart';
import 'package:houses/feature/house_rules/infra/response/base_house_rules_response.dart';
import 'package:houses/feature/house_rules/infra/datasources/house_rules_datasource.dart';
import 'package:houses/feature/house_rules/infra/response/get_house_rules_response.dart';
import 'package:houses/routes.dart';
import 'package:http/http.dart';

class HouseRulesDatasourceImpl implements HouseRulesDatasource {
  final Client _http;

  HouseRulesDatasourceImpl(this._http);

  final Map<String, String> _headers = {
    'Authorization':
        'Bearer 40fe071962846075452a4f6123ae71697463cad20f51e237e2035b41af0513d8',
  };

  String? nextPage;

  @override
  Future<HouseRules> createHouseRules(HouseRules houseRules) async {
    try {
      var response = await _http.post(Uri.parse(CREATEHOUSERULES),
          body: BaseHouseRulesRequest(houseRules as HouseRulesModel).toJson(),
          headers: _headers);
      if (response.statusCode != 200) throw response;
      var body = BaseHouseRulesResponseResponse.fromJson(response.body);
      return body.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteHouseRules(HouseRules houseRules) async {
    try {
      var response = await _http.delete(
          Uri.parse('$DELETEHOUSERULES/${houseRules.id}'),
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
          await _http.get(Uri.parse(GETHOUSERULES), headers: _headers);
      if (response.statusCode != 200) throw response;
      var body = GetHouseRulesResponseResponse.fromJson(response.body);
      nextPage = body.pagination['links']['next'];
      return body.entities;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<HouseRules> showHouseRules(HouseRules houseRules) async {
    try {
      var response = await _http.get(
          Uri.parse('$SHOWHOUSERULES/${houseRules.id}'),
          headers: _headers);
      if (response.statusCode != 200) throw response;
      var body = BaseHouseRulesResponseResponse.fromJson(response.body);
      return body.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<HouseRules> updateHouseRules(HouseRules houseRules) async {
    try {
      var response = await _http.put(
          Uri.parse('$GETHOUSERULES/${houseRules.id}'),
          body: BaseHouseRulesRequest(houseRules as HouseRulesModel).toJson(),
          headers: _headers);
      if (response.statusCode != 200) throw response;
      var body = BaseHouseRulesResponseResponse.fromJson(response.body);
      return body.data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<HouseRules>> loadMoreHouseRules() async {
    try {
      if (nextPage == null) throw Exception('No more items');
      var response = await _http.get(
          Uri.parse(nextPage!.replaceFirst(RegExp(r'http'), 'https')),
          headers: _headers);
      if (response.statusCode != 200) throw response;
      var body = GetHouseRulesResponseResponse.fromJson(response.body);
      nextPage = body.pagination['links']['next'];
      return body.entities;
    } catch (e) {
      rethrow;
    }
  }
}
