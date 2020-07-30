import 'dart:convert';

import 'package:flutter_pepper/app/resorces/models/model.dart';
import 'package:http/http.dart' as http;

class PepperApiProvider {
  factory PepperApiProvider({String baseUrl =
  'https://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=96bbd4feacfd779d&format=json&large_area=Z011'}) {
    // ignore: join_return_with_assignment
    _instance ??= PepperApiProvider._internal(baseUrl);
    return _instance;
  }

  PepperApiProvider._internal(this.baseUrl);

  final String baseUrl;
  static PepperApiProvider _instance;

  Future<Shops> fetchPepperDetail() async {
    final response = await http.get('$baseUrl');
    if (response.statusCode == 200) {
      final _decodedResponse =
      await json.decode(response.body) as Map<String, dynamic>;
      final results = Results.fromJson(_decodedResponse);
      return results.results;
    } else {
      throw Exception('Error');
    }
  }
}
