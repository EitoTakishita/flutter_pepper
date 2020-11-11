import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BaseApiProvider {
  @protected
  Map<String, String> parameters = <String, String>{};

  Future<Map<String, dynamic>> post() async {
    try {
      // final body = json.encode(parameters);
      var uri = Uri.https(
          'webservice.recruit.co.jp', '/hotpepper/gourmet/v1/', parameters);
      // final response = await http
      //     .post(EnvironmentConfig.apiBaseUrl, body: body)
      //     .timeout(const Duration(seconds: 25));
      final response = await http.get(uri);
      parameters = {};
      if (response.statusCode == 200) {
        final _decodedResponse =
            await json.decode(response.body) as Map<String, dynamic>;
        return _decodedResponse;
      } else {
        throw Exception('Error');
      }
    } on Exception catch (e) {
      print('Error: $e');
      return Future.value(null);
    }
  }
}
