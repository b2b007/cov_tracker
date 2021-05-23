import 'dart:convert';

import 'package:cov_tracker/app/services/api_keys.dart';
import 'package:flutter/widgets.dart';

class API {
  API({@required this.apiKey});
  final apiKey;

  factory API.sandbox() => API(apiKey: APIKeys.covSandboxKey);

  static final String host = "covid-19-data.p.rapidapi.com";

  Uri tokenUri(String path, String params) => Uri(
        scheme: 'https',
        host: host,
        path: path,
        queryParameters: json.decode(params),
      );
}
