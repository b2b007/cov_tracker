import 'dart:convert';
import 'package:cov_tracker/app/models/countryDataModel.dart';
import 'package:cov_tracker/app/models/worldBoardModel.dart';
import 'package:http/http.dart' as http;
import 'package:cov_tracker/app/services/api.dart';

class APIService {
  APIService(this.api);
  final API api;

  Future<List<WorldBoardModel>> getTotals() async {
    final response = await http.get(
      api.tokenUri('totals', '{}'),
      headers: {'X-Rapidapi-Key': api.apiKey.toString()},
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final dataList = data as List;
      return dataList.map((map) => WorldBoardModel.fromJson(map)).toList();
    }
    print(
        "Request: ${api.tokenUri('totals', '{}')} failed\nResponse: ${response.statusCode} ${response.reasonPhrase}");
    throw response;
  }

  Future<List<CountryDataModel>> getByCountry(String countryName) async {
    final response = await http.get(
      api.tokenUri('country', json.encode({'name': countryName})),
      headers: {'X-Rapidapi-Key': api.apiKey.toString()},
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final dataList = data as List;
      return dataList.map((map) => CountryDataModel.fromJson(map)).toList();
    }
    print("Request: ${api.tokenUri('country', json.encode({
              'name': countryName
            }))} failed\nResponse: ${response.statusCode} ${response.reasonPhrase}");
    throw response;
  }
}
